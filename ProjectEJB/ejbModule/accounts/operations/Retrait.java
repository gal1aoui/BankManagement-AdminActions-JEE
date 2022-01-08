package accounts.operations;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("R")
public class Retrait extends Operation {

	public Retrait() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Retrait(Date createdAt, float solde) {
		super(createdAt, solde);
		// TODO Auto-generated constructor stub
	}
	
}
