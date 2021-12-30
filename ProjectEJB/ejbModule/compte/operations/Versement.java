package compte.operations;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import users.actors.Employee;
import compte.comptes.Compte;

@Entity
@DiscriminatorValue("V")
public class Versement extends Operation {

	public Versement() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Versement(Date createdAt, float solde) {
		super(createdAt, solde);
		// TODO Auto-generated constructor stub
	}
	
}
