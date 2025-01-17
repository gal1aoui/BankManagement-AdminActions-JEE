package bean;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import accounts.comptes.Compte;
import accounts.operations.Operation;
import accounts.operations.Retrait;
import accounts.operations.Versement;
import users.actors.Client;
import users.actors.Employee;
import users.groups.GroupMembers;
import users.groups.Group;
import session.GestionProjetRemote;

@Stateless(name="PRJCT")
public class GestionProjetBean implements GestionProjetRemote{

	@PersistenceContext(unitName="UP_PRJCT")
	public EntityManager em;

	@Override
	public void ajouterClient(Client c) 
	{
		em.persist(c);		
	}

	@Override
	public void ajouterEmploye(Employee e) 
	{
		em.persist(e);
	}

	@Override
	public void ajouterGroupe(Group g) 
	{
		em.persist(g);
	}

	@Override
	public List<Client> consultationClients(){
		Query req = em.createQuery("select c from Client c");
		return req.getResultList();
		
	}

	@Override
	public Client consultationClient(long id) 
	{
		Client c = em.find(Client.class, id);
		return c;
	}

	@Override
	public List<Employee> consultationEmployes() 
	{
		Query req = em.createQuery("select e from Employee e");
		return req.getResultList();
	}

	@Override
	public Employee consultationEmploye(long id) 
	{
		Employee e = em.find(Employee.class, id);
		return e;
	}

	@Override
	public List<Group> consultationGroupes() 
	{
		Query req = em.createQuery("select g from Group g");
		return req.getResultList();
	}

	@Override
	public Group consultationGroupe(long id) 
	{
		Group g = em.find(Group.class, id);
		return g;
	}
	
	@Override
	public List<Compte> consultationComptesParClient(long clt_id)
	{
		Query req = em.createQuery("select cp from Compte cp where cp.client.id like :x");
		req.setParameter("x", clt_id);
		return req.getResultList();
	}
	
	@Override
	public void ajouterCompte(Compte c, long clt_id, long emp_id) 
	{
		Client clt = consultationClient(clt_id);
		Employee emp = consultationEmploye(emp_id);
		
		c.setClient(clt);
		c.setEmployee(emp);
		em.persist(c);
	}
	
	@Override
	public Compte consultationCompte(long id) 
	{
		Compte cp = em.find(Compte.class, id);
		return cp;
	}

	@Override
	public List<Client> chercherClient(String name) 
	{
		Query req = em.createQuery("select c from Client c where c.name like :x");
		req.setParameter("x", "%"+name+"%");
		return req.getResultList();
	}

	@Override
	public void verser(long id, float montant, long emp_id)
	{
		Compte cp = consultationCompte(id);
		Employee e = consultationEmploye(emp_id);
		Versement v = new Versement(new Date(), montant);
		v.setCompte(cp);
		v.setEmployee(e);
		em.persist(v);
		cp.setSolde(cp.getSolde() + montant);
		em.persist(cp);
	}

	@Override
	public void retirer(long id, float montant, long emp_id) 
	{
		Compte cp = consultationCompte(id);
		Employee e = consultationEmploye(emp_id);
		
		if(cp.getSolde() >= montant )
		{
			Retrait r = new Retrait(new Date(), montant);
			r.setCompte(cp);
			r.setEmployee(e);
			em.persist(r);
			cp.setSolde(cp.getSolde() - montant);
			em.persist(cp);
		}else
		{
			throw new RuntimeException("Votre Solde est insuffisant");
		}
	}

	@Override
	public void supprimerClient(long id) 
	{
		Client c = consultationClient(id);
		em.remove(c);
	}

	@Override
	public void supprimerEmploye(long id) 
	{
		Employee e = consultationEmploye(id);
		em.remove(e);
	}

	@Override
	public void supprimerGroupe(long id) 
	{
		Group g = consultationGroupe(id);
		em.remove(g);
	}

	@Override
	public void supprimerCompte(long id) 
	{
		Compte cp = consultationCompte(id);
		em.remove(cp);
	}
	
	@Override
	public void ajouterEmplAGroup(long emp_id, long grp_id, GroupMembers gm) 
	{
		Query req = em.createQuery("select g from GroupMembers g where g.groupe.id like :x and g.employee.id like :y");
		req.setParameter("x", grp_id);
		req.setParameter("y", emp_id);
		List<GroupMembers> rs = req.getResultList();
		
		if( rs.size() == 0 )
		{
		Employee e = consultationEmploye(emp_id);
		Group g = consultationGroupe(grp_id);
		gm.setEmployee(e);
		gm.setGroupe(g);
		em.persist(gm);
		}else{
			throw new RuntimeException("Cet employ� d�ja existe dans ce groupe");
		}
	}
	
	@Override
	public List<GroupMembers> consultationMembresGroupe(long grp_id)
	{
		return em.createQuery("select g from GroupMembers g where g.groupe.id like :x").setParameter("x", grp_id).getResultList();
	}

	@Override
	public List<Compte> consultationComptes() {
		return em.createQuery("select c from Compte c").getResultList();
	}
	
	@Override
	public List<Operation> consultationOperations() {
		return em.createQuery("select o from Operation o").getResultList();
	}

	@Override
	public void ajouterSuperieurHierarchique(long emp_id, long empSup_id) {
		Employee e = consultationEmploye(emp_id);
		Employee es = consultationEmploye(empSup_id);
		
		e.setUpperHierarchy(es);
		em.persist(e);
	}
	
}
