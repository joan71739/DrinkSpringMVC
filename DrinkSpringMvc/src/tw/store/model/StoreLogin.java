package tw.store.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity(name = "Login")
@Table(name = "login")
@Component("StoreLogin")
public class StoreLogin {
	
	@Id 
	private String stuserid;
	
	private String stpassword;
	
	private String company;
	
	

	public StoreLogin() {
	}
	
	public StoreLogin(String stuserid,String stpassword) {
		this.stuserid=stuserid;
		this.stpassword=stpassword;
	}

	public String getStuserid() {
		return stuserid;
	}

	public void setStuserid(String stuserid) {
		this.stuserid = stuserid;
	}

	public String getStpassword() {
		return stpassword;
	}

	public void setStpassword(String stpassword) {
		this.stpassword = stpassword;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

}
	