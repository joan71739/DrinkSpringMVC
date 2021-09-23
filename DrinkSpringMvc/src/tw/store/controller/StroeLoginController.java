package tw.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.store.model.Store;
import tw.store.model.StoreLoginDaoService;

@Controller
public class StroeLoginController {

	@Autowired
	private StoreLoginDaoService stDaoService;
	
	// 登入頁面
	@RequestMapping(path = "/checkLoginEntry.controller", method = RequestMethod.GET)
	public String checkLoginEntry() {
		return "storePages/storeLogin.jsp";
	}

	// 檢核帳號密碼
	@RequestMapping(path = "/checkLoginAction.controller", method = RequestMethod.POST)
	public String checkLoginAction(@RequestParam(name = "userid") String userid, 
								   @RequestParam(name = "pwd") String pwd,
								   Model m,
								   HttpServletRequest request) {
		
		
		boolean status = stDaoService.checkLogin(userid, pwd);
		if(status) {
			
			
			
			//登入成功取得公司統編
			String company = stDaoService.getCompany(userid);
			//登入成功取得分公司資訊(多筆資料)
			ArrayList<Store> userids = stDaoService.getUseridByCompany(company);
			
			request.getSession().setAttribute("userid", userid);
			request.getSession().setAttribute("company", company);
			request.getSession().setAttribute("userids", userids);
			
			System.out.println("登入成功");
			
			return "storePages/storeLoginSuccess.jsp";
		}
		
		m.addAttribute("errors","輸入錯誤，請重新輸入");
		return "storePages/storeLogin.jsp";

	}
	
	//登出
	@RequestMapping(path = "/LoginOutAction.controller", method = RequestMethod.GET)
	public String LoginOutAction(HttpServletRequest request) {
		request.getSession().invalidate();
		return "checkLoginEntry.controller";
	}
	
	
	

}
