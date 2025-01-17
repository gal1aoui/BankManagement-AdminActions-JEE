package accounts.operations;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import users.actors.Employee;
import accounts.comptes.Compte;

/*Chap2-suite P31 -> Inheritance d�crire la relation d'h�ritage 
* SINGLE_TABLE -> repr�sente en BD un h�ritage avec une seule table
* DiscriminatorColumn -> une colonne discrimante contiendra un identifiant pour d�terminer le type r�el de la classe(P32)
* DiscriminatorValue -> pr�cise la valeur dans la col discrimante qui permet d'identifier un objet du type de classe
*/
@Entity
@Table(name="OP�RATIONS")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="TYPE_OPERATION")
public abstract class Operation implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@Column(name="DATE_CREATION")
	private Date createdAt;
	@Column(name="MONTANT")
	private float solde;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="COMPTE_FK")
	private Compte compte;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="Employee_FK")
	private Employee employee;

	public long getId() {
		return id;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public float getSolde() {
		return solde;
	}

	public void setSolde(float solde) {
		this.solde = solde;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public Operation(Date createdAt, float solde) {
		super();
		this.createdAt = createdAt;
		this.solde = solde;
	}

	public Operation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
