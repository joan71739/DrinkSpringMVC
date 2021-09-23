package tw.login.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "SQLMemberID")
@Component
public class SQLMemberID { 

	@Id
	@Column(name = "UserID")
	private String userID;
	
	@Column(name = "UserPaws")
	private String userPaws;
	
	@Column(name = "ClassMember")
	private String classMember;
	
	@Column(name = "VAT")
	private String VAT;
	
	public SQLMemberID() {
	}
	public SQLMemberID(String userID) {
		this.userID = userID;
	}
	
	public SQLMemberID(String userID ,String userPaws) {
		this.userID = userID;
		this.userPaws = userPaws;
	}
	
	public SQLMemberID(String userID ,String userPaws, String classMember, String VAT) {
		this.userID = userID;
		this.userPaws = userPaws;
		this.classMember = classMember;
		this.VAT = VAT;
	}

	public String getUserID() {
		return userID;
	}

	public String getUserPaws() {
		return userPaws;
	}

	public void setUserPaws(String userPaws) {
		this.userPaws = userPaws;
	}

	public String getClassMember() {
		return classMember;
	}

	public void setClassMember(String classMember) {
		this.classMember = classMember;
	}

	public String getVAT() {
		return VAT;
	}

	public void setVAT(String vAT) {
		VAT = vAT;
	}
	
}
