package activity.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import activity.model.ActivityBean;
import activity.model.ActivityService;

@Controller
public class AddNewActivityController {
	
	// 先備好 service 等等存資料用
	@Autowired
	private ActivityService activityService;
	
	// 方法: 轉表單日期 -> SQL datetime 格式
	private String dateToSQLString(String time_DDMMYYY, String time_HH) {
		
		String[] timeArray = time_DDMMYYY.split("/");
		
		StringBuffer sb = new StringBuffer();
		sb.append(timeArray[2]);	// YYY
		sb.append("-");
		sb.append(timeArray[0]);	//MM
		sb.append("-");
		sb.append(timeArray[1]);	//DD
		sb.append(" ");
		sb.append(time_HH);			//HH
		sb.append(":00:00");
		return sb.toString();

	}
	
	
	// 導到新增活動表單頁面，不綁 JavaBean 到表單( 前端複雜度太高 )
	@RequestMapping(path="/toAddNewActivity.controller",method = RequestMethod.GET )
	public String toAddNewActivity() {
		return "activity/addNewActivityPage.jsp";
	}
	
	// 接收 addNewActivity 表單 Data
	@RequestMapping(path="/getAddNewActivity.controller",method = RequestMethod.POST )
	public String getAddNewActivity(@RequestParam Map<String,String> formData) {
		
		// 資料存到 JavaBean 中
		ActivityBean activityBean = new ActivityBean();
		activityBean.setActivityTopic( formData.get("activityTopic") );
		activityBean.setActivityContent( formData.get("activityContent") );
		activityBean.setActivityType( Integer.valueOf(formData.get("activityType")) );
		
		String startTimeYMD = formData.get("startTimeYMD");
		String startTimeH = formData.get("startTimeH");
		activityBean.setStartTime( dateToSQLString(startTimeYMD,startTimeH) );
		
		String endTimeYMD = formData.get("endTimeYMD");
		String endTimeH = formData.get("endTimeH");
		activityBean.setEndTime( dateToSQLString(endTimeYMD,endTimeH) );

		// ok刪
//		System.out.println("getActivityTopic="+activityBean.getActivityTopic());
//		System.out.println("getStartTime="+activityBean.getStartTime());
//		System.out.println("getEndTime="+activityBean.getEndTime());
//		System.out.println("getActivityContent="+activityBean.getActivityContent());
//		System.out.println("getActivityType="+activityBean.getActivityType());
		
		// 請 service 存資料
		activityService.insertActivity(activityBean);
		
		return "/toActivityManagePage.controller";
	}
	
	
}
