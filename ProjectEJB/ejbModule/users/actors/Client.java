package users.actors;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import compte.comptes.Compte;

@Entity
@Table(name="CLIENTS")
public class Client extends User {

	@Column(name="NOM_CLIENT")
	private String name;
	
	//pour charger directement les données
	@OneToMany(mappedBy="client", fetch=FetchType.EAGER)
	private List<Compte> comptes;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Compte> getComptes() {
		return comptes;
	}

	public void setComptes(List<Compte> comptes) {
		this.comptes = comptes;
	}

	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Client(String email, String password, String name) {
		super(email, password);
		this.name = name;
	}
	
}
