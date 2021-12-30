package users.session;

import java.util.List;

import javax.ejb.Remote;

import compte.comptes.Compte;
import compte.operations.Operation;
import users.actors.Client;
import users.actors.Employee;
import users.groupmembers.GroupMembers;
import users.Group;

@Remote
public interface GestionProjetRemote {
	
	//Les méthodes d'ajout
	public void ajouterClient(Client c);
	public void ajouterEmploye(Employee e);
	public void ajouterGroupe(Group g);
	public void ajouterCompte(Compte c, long clt_id, long emp_id);
	
	//Les méthodes de consultation
	public List<Client> consultationClients();
	public Client consultationClient(long id);
	
	public List<Employee> consultationEmployes();
	public Employee consultationEmploye(long id);
	
	public List<Group> consultationGroupes();
	public Group consultationGroupe(long id);
	
	public List<Compte> consultationComptesParClient(long clt_id);
	public Compte consultationCompte(long id);
	
	public List<Compte> consultationComptes();
	public List<Operation> consultationOperations();
	
	public List<GroupMembers> consultationMembresGroupe(long grp_id);
	
	//méthode de recherche de client par nom
	public List<Client> chercherClient(String name);
	
	// les méthodes d'un operation
	public void verser(long id, float montant, long emp_id);
	public void retirer(long id, float montant, long emp_id);
	
	//les méthodes de suppression
	public void supprimerClient(long id);
	public void supprimerEmploye(long id);
	public void supprimerGroupe(long id);
	public void supprimerCompte(long id);
	
	// méthode d'ajout d'un employer à un group 
	public void ajouterEmplAGroup(long emp_id, long grp_id, GroupMembers gm);
}