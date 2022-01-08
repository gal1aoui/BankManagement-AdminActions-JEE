package accounts.comptes;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

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
	}

	public CompteEpargne(float solde, Date createdAt, float taux) {
		super(solde, createdAt);
		this.taux = taux;
	}
}
