package tw.login.controller;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.login.bean.SQLMemberData;
import tw.login.bean.SQLMemberDataVendor;
import tw.login.bean.SQLMemberID;
import tw.login.dao.MemberDB;
import tw.login.dao.MemberDao;

@Controller
public class NewMemberController { 

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(path = "/newMenberController", method = RequestMethod.POST)
	public String newMember(@RequestParam(name = "userID", required = false) String userID,
			@RequestParam(name = "pws", required = false) String userPaw,
			@RequestParam(name = "passwordck", required = false) String userPawCk,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "principal", required = false) String principal,
			@RequestParam(name = "birthday", required = false) String birthday,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "vendor", required = false) String vendor,
			@RequestParam(name = "vat", required = false) String vat, 
			@RequestParam(name = "address", required = false) String address, 
			@RequestParam(name = "sub", required = false) String submit,
			@RequestParam(name = "type", required = false) String sType,
			Model m, HttpServletResponse response) {

		if (submit == null) {
			//檢查帳號-一般
			if (sType.equals("form-a")) {
				SQLMemberID res = memberDao.searchMemberID(userID);
				if(res != null) {
					m.addAttribute("UserIDCk", "T");
				}else {
					m.addAttribute("UserIDCk", "F");
				}
				m.addAttribute("Type", "A");
			}
			//檢查帳號-企業
			if (sType.equals("form-b")) {
				SQLMemberID res = memberDao.searchMemberID(userID);
				if(res != null) {
					m.addAttribute("UserIDCk", "T");
				}else {
					m.addAttribute("UserIDCk", "F");
				}
				m.addAttribute("Type", "B");
			}
			return "member/NewMemberAll.jsp";
		}
		if(submit.equals("cancel")) {
			return "websitePage/homeWebsitePage.jsp";
		}
		//清除資料
		if (submit.equals("res")) {
			MemberDB.setUserID(null);
			MemberDB.setPassword(null);
			MemberDB.setPasswordck(null);
			MemberDB.setName(null);
			MemberDB.setBirthday(null);
			MemberDB.setEmail(null);
			MemberDB.setVendor(null);
			MemberDB.setPrincipal(null);
			MemberDB.setVat(null);
			MemberDB.setAddress(null);

			if (sType.equals("form-a")) {
				m.addAttribute("Type", "A");
			}
			if (sType.equals("form-b")) {
				m.addAttribute("Type", "B");
			}
			return "member/NewMemberAll.jsp";
		}
		if (submit.equals("modify")) {
			return "member/NewMemberAll.jsp";
		}
		else if (submit.equals("nextChack")) {
			//
			MemberDB.setUserID(userID);
			MemberDB.setPassword(userPaw);
			MemberDB.setPasswordck(userPawCk);
			MemberDB.setName(name);
			MemberDB.setBirthday(birthday);
			MemberDB.setEmail(email);
			//
			MemberDB.setVendor(vendor);
			MemberDB.setPrincipal(principal);
			MemberDB.setVat(vat);
			MemberDB.setAddress(address);
			// 確認帳號是否為空
			if ("".equals(userID) || "".equals(userPaw) || "".equals(userPawCk)) {
				return "member/NewMemberAll.jsp";
			}
			// 確認密碼兩次是否相同
			boolean ckPws = false;
			if (userPaw.equals(userPawCk)) {
				//密碼檢查
				int pwsL = userPaw.length();
				boolean tmp1 = false;
				boolean tmp2 = false;
				if (pwsL >= 6) {
		              for (int i = 0; i < pwsL; i++) {
		                char ch =userPaw.toUpperCase().charAt(i);
//		                char ch = temp.charAt(i);
		                if (ch >= 'A' && ch <= 'Z') {
		                  tmp1 = true;
		                }
		                if (ch >= '0' && ch <= '9') {
		                  tmp2 = true;
		                }
		              }
				}
				if(tmp1 && tmp2) {
					ckPws = true;
				}
			}
			// 確認帳號是否重複
			SQLMemberID res = memberDao.searchMemberID(userID);
			// 帳號不重複，密碼兩次相同
			if (res == null && ckPws) {
				if (sType.equals("form-a")) {
					m.addAttribute("Type", "A");
				}
				if (sType.equals("form-b")) {
					m.addAttribute("Type", "B");
				}
				return "member/NewMemberChackAll.jsp";
			} else {
				// session.setAttribute("ckUserID", "repeat");
				return "member/NewMemberAll.jsp";
			}
		} else if (submit.equals("submit")) {
			// 寫進sql
			// a:一般會員 b:企業會員 c:店長 d:員工
			if (sType.equals("form-a")) {
				SQLMemberID memID = new SQLMemberID(MemberDB.getUserID(), MemberDB.getPassword(), "a", null);
				memberDao.iniserMemberID(memID);
				SQLMemberData memData = new SQLMemberData(MemberDB.getUserID(), MemberDB.getName(), MemberDB.getBirthday(),MemberDB.getEmail());
				memberDao.iniserMemberData(memData);
			} else if (sType.equals("form-b")) {
				SQLMemberID memID = new SQLMemberID(MemberDB.getUserID(), MemberDB.getPassword(), "b", MemberDB.getVat());
				memberDao.iniserMemberID(memID);
				SQLMemberDataVendor memDataVender = new SQLMemberDataVendor(MemberDB.getUserID(), MemberDB.getVendor(), MemberDB.getPrincipal(), MemberDB.getAddress(), MemberDB.getEmail());
				memberDao.iniserMemberDataVendor(memDataVender);
			}
			MemberDB.setUserID(null);
			MemberDB.setPassword(null);
			MemberDB.setPasswordck(null);
			MemberDB.setName(null);
			MemberDB.setBirthday(null);
			MemberDB.setEmail(null);
			MemberDB.setVendor(null);
			MemberDB.setPrincipal(null);
			MemberDB.setVat(null);
			MemberDB.setAddress(null);

			return "websitePage/homeWebsitePage.jsp";
		}
		return "websitePage/homeWebsitePage.jsp";
	}
}
