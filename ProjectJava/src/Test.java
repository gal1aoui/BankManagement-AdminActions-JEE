import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import accounts.comptes.Compte;
import accounts.comptes.CompteCourant;
import accounts.comptes.CompteEpargne;
import users.actors.Client;
import users.groups.Group;
import users.actors.Employee;
import users.groups.GroupMembers;
import session.GestionProjetRemote;


public class Test {
	
	public static void main(String[] args) {
		try
		{
			Properties prop = new Properties();
			
			prop.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			Context ctx = new InitialContext(prop);
			//op peut effectuer ces actions avec un seul interface ejb.Remote pour les test machine et web sans l'interface locale ejb.Local
			GestionProjetRemote stub = (GestionProjetRemote)ctx.lookup("ejb:ProjectEAR/ProjectEJB/PRJCT!session.GestionProjetRemote");
			
			
			Client c = new Client("client@demo.com","12345678","Ahmed");
			Client c2 = new Client("client2@demo.com","12345678","Ali");
			Group g = new Group("Delta");
			Employee e = new Employee("employe@demo.com","12345678",1200);
			
			//(1)ajout
			/*stub.ajouterClient(c);
			stub.ajouterClient(c2);
			stub.ajouterEmploye(e);
			stub.ajouterGroupe(g);*/
			
			c = stub.consultationClient(1);
			c2 = stub.consultationClient(2);
			e = stub.consultationEmploye(3);
			g = stub.consultationGroupe(1);
			
			//(2)consultation par 1
			System.out.println("client " + c.getId() + " email "+ c.getEmail());
			System.out.println("client " + c2.getId() + " email "+ c2.getEmail());
			System.out.println("Employe " + e.getId() + " email "+ e.getEmail());
			System.out.println("Groupe " + g.getId() + " Nom "+ g.getName());
			
			/*Compte cpc = new CompteCourant(1000f, new Date(),100);
			Compte cpe = new CompteEpargne(1100f, new Date(), 50);
			
			cpc = stub.consultationCompte(1);
			cpe = stub.consultationCompte(2);
			
			System.out.println(cpc.getId()+ " - -"+ cpc.getSolde());
			System.out.println(cpe.getId()+ " - -"+ cpe.getSolde());
			*/
			/*stub.verser(c.getId(), 200f, e.getId());
			stub.retirer(c2.getId(), 300, e.getId());
			
			cpc = stub.consultationCompte(1);
			cpe = stub.consultationCompte(2);
			System.out.println(cpc.getId()+ " - d'apr�s -"+ cpc.getSolde()+" de client " + cpc.getClient().getName()+" effectuer par ->" + cpc.getEmployee().getEmail());
			System.out.println(cpe.getId()+ " - d'apr�s -"+ cpe.getSolde()+" de client " + cpc.getClient().getName()+" effectuer par ->" + cpc.getEmployee().getEmail());
			*/
			/*
			//(3) creation comptes
			stub.ajouterCompte(cpc,c.getId(),e.getId());
			stub.ajouterCompte(cpe,c2.getId(),e.getId());
			*/ 
			
			/*
			//(4) ajout d'un employe a un group
			GroupMembers gm = new GroupMembers();
			stub.ajouterEmplAGroup(11,1 , gm);
			*/
			
			/*
			//(5) Consultation clients
			List<Client> clients = stub.consultationClients();
			
			for(Client cp:clients){
			System.out.println("Client : "+cp.getName()+"--"+cp.getId());
			}
			//Consultation employes
			List<Employee> employes = stub.consultationEmployes();
			
			for(Employee cp:employes){
			System.out.println("Employe : "+cp.getEmail()+"--"+cp.getId()+" -Solde- "+ cp.getSolde());
			}
			//Consultation groupes
			List<Group> groupes = stub.consultationGroupes();
			
			for(Group cp:groupes){
			System.out.println("Groupe : "+cp.getId()+"--"+cp.getName());
			}
			*/
			
			/*
			//(6)Consultation les membres de groupe
			List<GroupMembers> grpm = stub.consultationMembresGroupe(g.getId());
			
			for(GroupMembers cp:grpm){
			System.out.println("Employe : "+cp.getEmployee().getEmail()+" -- "+cp.getEmployee().getId()+" -Solde- "+ cp.getEmployee().getSolde());
			}*/
			
			/*
			// (7) Suppression
			stub.supprimerClient(c.getId());
			stub.supprimerEmploye(e.getId());
			stub.supprimerGroupe(g.getId());
			stub.supprimerCompte(cpc.getId());
			*/
			//stub.ajouterSuperieurHierarchique(4, 3);
		} catch (NamingException e){
			e.printStackTrace();
		}
		
	}
}

