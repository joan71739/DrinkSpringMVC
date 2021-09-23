package tw.login.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "SQLMemberDataVendor")
@Component
public class SQLMemberDataVendor {
 
	@Id
	@Column(name = "UserID")
	private String userID;
	@Column(name = "Vendor")
	private String vendor;
	@Column(name = "Principal")
	private String principal;
	@Column(name = "Address")
	private String address;
	@Column(name = "Email")
	private String email;

	public SQLMemberDataVendor() {
	}

	public SQLMemberDataVendor(String userID) {
		this.userID = userID;
	}
	public SQLMemberDataVendor(String userID, String vendor, String principal, String address, String email) {
		this.userID = userID;
		this.vendor = vendor;
		this.principal = principal;
		this.address = address;
		this.email = email;
		
	}

	public String getUserID() {
		return userID;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
