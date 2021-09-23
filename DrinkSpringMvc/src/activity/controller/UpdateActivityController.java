package activity.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import activity.model.ActivityBean;
import activity.model.ActivityService;

@Controller
public class UpdateActivityController {
	
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
	
	
	// 導到修改活動頁面
	@RequestMapping(path="/toUpdateActivityPage.controller", method= RequestMethod.GET )
	public String toUpdateActivity(@RequestParam(name="ID") int ID,Model m) {
		
		// 未實現功能:這邊要加入會員驗證
		
		// 請 Service 查詢該筆活動資料
		ActivityBean result = activityService.queryOneActivity(ID);
		
		// 找到的資料存起來
		m.addAttribute("oneActivity",result);
		
		return "activity/updateActivity.jsp";
	}
	
	// 修改活動頁面: 修改一筆活動
	@RequestMapping(path="/updateOneActivity.controller", method= RequestMethod.POST )
	public String updateOneActivity(@RequestParam Map<String,String> formData) {
		
		String deleteValue = formData.get("deleteValue");
		System.out.println("deleteValue="+ deleteValue);
		
		// 判斷要 update 或是 delete 此筆活動
		if( deleteValue.equals("1") ) { // delete 此活動
			
			// 請 Service 刪除該筆活動資料
			activityService.deleteActivity( Integer.valueOf(formData.get("IDValue")) );
			
		}else{ // update 此活動
		
			// 資料存到 JavaBean 中
			ActivityBean activityBean = new ActivityBean();
			activityBean.setID( Integer.valueOf(formData.get("IDValue")) );
			activityBean.setActivityTopic( formData.get("activityTopic") );
			
			String startTimeYMD = formData.get("startTimeYMD");
			String startTimeH = formData.get("startTimeH");
			activityBean.setStartTime( dateToSQLString(startTimeYMD,startTimeH) );
			
			String endTimeYMD = formData.get("endTimeYMD");
			String endTimeH = formData.get("endTimeH");
			activityBean.setEndTime( dateToSQLString(endTimeYMD,endTimeH) );
	
			activityBean.setActivityContent( formData.get("activityContent") );
			activityBean.setActivityType( Integer.valueOf( formData.get("activityType") ) );
			
			// ok刪
			System.out.println("----------------------------");
			System.out.println("getID="+activityBean.getID());
			System.out.println("getActivityTopic="+activityBean.getActivityTopic());
			System.out.println("getStartTime="+activityBean.getStartTime());
			System.out.println("getEndTime="+activityBean.getEndTime());
			System.out.println("getActivityContent="+activityBean.getActivityContent());
			System.out.println("getActivityType="+activityBean.getActivityType());
			
			// 請 Service 修改該筆活動資料
			System.out.println("經過Update.Controller");
			activityService.updateActivity(activityBean);
			
		}
		
		return "/toActivityManagePage.controller";
	}
	
	
}
