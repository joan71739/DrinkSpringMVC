package activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import activity.model.ActivityBean;
import activity.model.ActivityService;

@Controller
public class ManageActivityController {
	
	// 先備好 service 等等存資料用
	@Autowired
	private ActivityService activityService;
		
	
	// 導到活動管理頁面 GET
	@RequestMapping(path="/toActivityManagePage.controller",method = RequestMethod.GET)
	public String toManageActivityController(Model m) {
		
		System.out.println("MG");
		// 請 service 查詢現有活動資料
		List<ActivityBean> result = activityService.queryAllActivity();
		
		m.addAttribute("allActivity",result);
		
		return "activity/manageActivityPage.jsp";
	}
	
	
	// 導到活動管理頁面 POST
	@RequestMapping(path="/toActivityManagePage.controller",method = RequestMethod.POST)
	public String toManageActivityController2(Model m) {
		
		System.out.println("MP");
		// 請 service 查詢現有活動資料
		List<ActivityBean> result = activityService.queryAllActivity();
		
		m.addAttribute("allActivity",result);
		
		return "activity/manageActivityPage.jsp";
	}
	
	
}
