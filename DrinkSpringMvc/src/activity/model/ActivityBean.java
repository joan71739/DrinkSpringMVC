package activity.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity // 永續類別(必寫)
@Table(name="Activity") // 對應資料表名稱
@Component // 註冊 Bean 元件
public class ActivityBean {
	
	public ActivityBean() {}
	
	@Id // (必寫)
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 自動產生
	private int ID;
	
	private String activityTopic;
	private String startTime;
	private String endTime;
	private String activityContent;
	private int activityType;
	
	public int getID() {
		return ID;
	}
	
	public void setID(int iD) {
		ID = iD;
	}
	public String getActivityTopic() {
		return activityTopic;
	}
	public void setActivityTopic(String activityTopic) {
		this.activityTopic = activityTopic;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getActivityContent() {
		return activityContent;
	}
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	public int getActivityType() {
		return activityType;
	}
	public void setActivityType(int activityType) {
		this.activityType = activityType;
	}
	
	
}
