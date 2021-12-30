package compte.comptes;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import users.actors.Client;
import users.actors.Employee;

@Entity
@DiscriminatorValue("C")
public class CompteEpargne extends Compte {
	
	private float taux;

	public float getTaux() {
		return taux;
	}

	public void setTaux(float taux) {
		this.taux = taux;
	}

	public CompteEpargne() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompteEpargne(float solde, Date createdAt, float taux) {
		super(solde, createdAt);
		this.taux = taux;
	}
}
