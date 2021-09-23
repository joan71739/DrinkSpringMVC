package tw.kuziwu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table(name = "forum")
@Component
public class DiscussBean {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int discussId;
	
	
	private String shopName;
	
	
	private String drink;
	
	
	private String drinkDiscuss;
	
	
	private int drinkstar;
	
	
	
	public int getDiscussId() {
		return discussId;
	}

	public void setDiscussId(int discussId) {
		this.discussId = discussId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getDrink() {
		return drink;
	}

	public void setDrink(String drink) {
		this.drink = drink;
	}

	public String getDrinkDiscuss() {
		return drinkDiscuss;
	}

	public void setDrinkDiscuss(String drinkDiscuss) {
		this.drinkDiscuss = drinkDiscuss;
	}

	public int getDrinkstar() {
		return drinkstar;
	}

	public void setDrinkstar(int drinkstar) {
		this.drinkstar = drinkstar;
	}

	
	
	
	
}
