package users.groups;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import users.actors.Employee;
import users.groups.GroupMembers;

@Entity
@Table(name="GROUPES")
public class Group implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID_Groupe")
	private long id;
	@Column(name="NOM_GROUPE")
	private String name;
	
	@OneToMany(mappedBy="groupe", fetch=FetchType.EAGER)
	private List<GroupMembers> groupmembres;
	
	public List<GroupMembers> getGroupmembres() {
		return groupmembres;
	}
	public void setGroupmembres(List<GroupMembers> groupmembres) {
		this.groupmembres = groupmembres;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Group() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Group(String name) {
		super();
		this.name = name;
	}

}
