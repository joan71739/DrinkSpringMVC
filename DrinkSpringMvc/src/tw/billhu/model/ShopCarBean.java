package tw.billhu.model;



import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component(value = "shopcar")
public class ShopCarBean implements Serializable {
	private int shopingcarID;
	private int storeID;
	private int customerID;
	private int prouctID;
	private String prouctName;
	private int qty;
	private double price;
	private String ice;
	private String sugar;
	
	public int getShopingcarID() {
		return shopingcarID;
	}
	public void setShopingcarID(int shopingcarID) {
		this.shopingcarID = shopingcarID;
	}
	public int getStoreID() {
		return storeID;
	}
	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public int getProuctID() {
		return prouctID;
	}
	public void setProuctID(int prouctID) {
		this.prouctID = prouctID;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getIce() {
		return ice;
	}
	public void setIce(String ice) {
		this.ice = ice;
	}
	public String getSugar() {
		return sugar;
	}
	public void setSugar(String sugar) {
		this.sugar = sugar;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
	public String getProuctName() {
		return prouctName;
	}
	public void setProuctName(String prouctName) {
		this.prouctName = prouctName;
	}
	

	public ShopCarBean(int storeID, int prouctID, String prouctName, int qty, double price, String ice, String sugar) {

		this.storeID = storeID;
		this.prouctID = prouctID;
		this.prouctName = prouctName;
		this.qty = qty;
		this.price = price;
		this.ice = ice;
		this.sugar = sugar;
	}
	public ShopCarBean() {
		super();
	}
	
	
	public double total() {
		return price*qty;
	}
	




}
