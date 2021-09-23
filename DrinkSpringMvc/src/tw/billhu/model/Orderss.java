package tw.billhu.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="Orderss")
@Component(value = "orderss")
public class Orderss implements Serializable  {
	@Id@GeneratedValue(strategy=GenerationType.IDENTITY )
	private int OrderssID;
   
	private int customerID;

	private int storeID;

	private Date shopDate;

	private double total;
	

	public int getOrderssID() {
		return OrderssID;
	}



	public void setOrderssID(int orderssID) {
		OrderssID = orderssID;
	}


	public int getCustomerID() {
		return customerID;
	}



	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}



	public int getStoreID() {
		return storeID;
	}



	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}



	public Date getShopDate() {
		return shopDate;
	}



	public void setShopDate(Date shopDate) {
		this.shopDate = shopDate;
	}



	public double getTotal() {
		return total;
	}



	public void setTotal(double total) {
		this.total = total;
	}
	
	public Orderss( int customerID, int storeID, Date shopDate, double total) {
		this.customerID = customerID;
		this.storeID = storeID;
		this.shopDate = shopDate;
		this.total = total;
	}
	

  



	public Orderss() {
	}


}
