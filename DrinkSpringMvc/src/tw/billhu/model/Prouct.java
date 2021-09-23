package tw.billhu.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;



@Component(value="prouct")
@Entity@Table(name="prouct")
public class Prouct implements Serializable {
	@Id@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int prouctID;
	private int storeID;
	private String prouctName;
	private double prouctPrice;
	public int getProuctID() {
		return prouctID;
	}
	public void setProuctID(int prouctID) {
		this.prouctID = prouctID;
	}
	public int getStoreID() {
		return storeID;
	}
	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public String getProuctName() {
		return prouctName;
	}
	public void setProuctName(String prouctName) {
		this.prouctName = prouctName;
	}
	public double getProuctPrice() {
		return prouctPrice;
	}
	public void setProuctPrice(double prouctPrice) {
		this.prouctPrice = prouctPrice;
	}
	public Prouct(int prouctID, int storeID, String prouctName, double prouctPrice) {
		this.prouctID = prouctID;
		this.storeID = storeID;
		this.prouctName = prouctName;
		this.prouctPrice = prouctPrice;
	}
	public Prouct() {
		super();
	}



}
