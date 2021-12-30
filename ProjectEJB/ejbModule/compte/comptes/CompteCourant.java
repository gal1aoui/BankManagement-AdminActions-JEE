package compte.comptes;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import users.actors.Client;
import users.actors.Employee;

@Entity
@DiscriminatorValue("C")
public class CompteCourant extends Compte {
	
	private float decouvert;

	public float getDecouvert() {
		return decouvert;
	}

	public void setDecouvert(float decouvert) {
		this.decouvert = decouvert;
	}

	public CompteCourant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompteCourant(float solde, Date createdAt, float decouvert) {
		super(solde, createdAt);
		this.decouvert = decouvert;
	}
	
}
