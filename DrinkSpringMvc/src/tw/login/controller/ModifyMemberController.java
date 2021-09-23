package tw.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import tw.login.bean.SQLMemberData;
import tw.login.bean.SQLMemberDataVendor;
import tw.login.bean.SQLMemberID;
import tw.login.dao.MemberDao;

@Controller
public class ModifyMemberController { 
	
	@Autowired
	MemberDao memberDao;

	@RequestMapping(path = "/getMemberData", method = RequestMethod.GET)
	public String getMembetData(@RequestParam(name = "userID", required = false) String userID,
			@RequestParam(name = "pws", required = false) String userPaw,
			@RequestParam(name = "passwordck", required = false) String userPawCk,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "birthday", required = false) String birthday,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "vat", required = false) String vat,
			@RequestParam(name = "sub", required = false) String submit, Model m, HttpServletResponse response,
			HttpServletRequest request) {

		String usID = (String) request.getSession().getAttribute("UserID");
		String usClass = (String) request.getSession().getAttribute("ClassMember");
		Map<String, String> userData = new HashMap<String, String>();
		if ("a".equals(usClass) || "fa".equals(usClass)) {
			userData = getMemberMap(usID);
			m.addAttribute("userData", userData);
			return "member/ModifyFirstMember.jsp";
		} else if ("b".equals(usClass) || "fb".equals(usClass)) {
			userData = getMemberMapVendor(usID);
			m.addAttribute("userData", userData);
			return "member/ModifyFirstMemberVendor.jsp";
		}

		return "member/ModifyFirstMember.jsp";
	}

	@RequestMapping(path = "/modifyMenberController", method = RequestMethod.POST)
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
			@RequestParam(name = "type", required = false) String sType, Model m, HttpServletResponse response,
			HttpServletRequest request, HttpSession sion) {
		String usID = (String) request.getSession().getAttribute("UserID");
		if (submit.equals("modifySubmit")) {

			boolean ckPws = false;
			if (userPaw.equals(userPawCk)) {
				ckPws = true;
			}
			if (!ckPws) {
				return "member/ModifyMember.jsp";
			}
			SQLMemberID memID = new SQLMemberID(userID, userPaw, "a", null);
			memberDao.updateMemberID(memID);
			SQLMemberData memData = new SQLMemberData(userID, name, birthday, email);
			memberDao.updateMemberData(memData);
			m.addAttribute("Type_fg", null);
			return "websitePage/homeWebsitePage.jsp";

		} else if (submit.equals("modify")) {
			Map<String, String> userData = new HashMap<String, String>();
			String usClass = (String) request.getSession().getAttribute("ClassMember");
			if ("a".equals(usClass) || "fa".equals(usClass)) {
				userData = getMemberMap(usID);
				m.addAttribute("userData", userData);
				return "member/ModifyMember.jsp";
			} else if ("b".equals(usClass) || "fb".equals(usClass)) {
				userData = getMemberMapVendor(usID);
				m.addAttribute("userData", userData);
				return "member/ModifyMemberVendor.jsp";
			}
		} else if (submit.equals("delete")) {
			m.addAttribute("Delete", "delete");
			return "member/ModifyFirstMember.jsp";

		} else if (submit.equals("deleteCk")) {
			memberDao.deleteMemberID(usID);
			memberDao.deleteMemberData(usID);
//			sion.isComplete();
			sion.invalidate();
			return "websitePage/homeWebsitePage.jsp";

		} else if (submit.equals("cancel") || submit.equals("cancelCk")) {
			m.addAttribute("Delete", "");
			return "websitePage/homeWebsitePage.jsp";
		}
		// 企業
		if (submit.equals("modifyVendor")) {
			Map<String, String> userData = new HashMap<String, String>();
			String usClass = (String) request.getSession().getAttribute("ClassMember");
			if ("a".equals(usClass) || "fa".equals(usClass)) {
				userData = getMemberMap(usID);
				m.addAttribute("userData", userData);
				return "member/ModifyMember.jsp";
			} else if ("b".equals(usClass) || "fb".equals(usClass)) {
				userData = getMemberMapVendor(usID);
				m.addAttribute("userData", userData);
				return "member/ModifyMemberVendor.jsp";
			}
		} else if (submit.equals("modifyVendorSubmit")) {

			boolean ckPws = false;
			if (userPaw.equals(userPawCk)) {
				ckPws = true;
			}
			if (!ckPws) {
				return "member/ModifyMemberVendor.jsp";
			}
			SQLMemberID memID = new SQLMemberID(userID, userPaw, "b", vat);
			memberDao.updateMemberID(memID);
			SQLMemberDataVendor memDataVender = new SQLMemberDataVendor(userID, vat, principal, address, email);
			memberDao.updateMemberDataVendor(memDataVender);
			m.addAttribute("Type_fg", null);
			return "websitePage/enterpriseWebsitePage.jsp";

		} else if (submit.equals("deleteVendor")) {
			m.addAttribute("Delete", "delete");
			return "member/ModifyFirstMemberVendor.jsp";

		} else if (submit.equals("deleteVendorCk")) {
			memberDao.deleteMemberID(usID);
			memberDao.deleteMemberDataVendor(usID);
//			sion.isComplete();
			sion.invalidate();
			return "websitePage/homeWebsitePage.jsp";

		} else if (submit.equals("cancelVendor") || submit.equals("cancelVenCk")) {
			m.addAttribute("Delete", "");
			return "websitePage/enterpriseWebsitePage.jsp";
		}
		return "";
	}

	// 取得一般會員資料
	public Map<String, String> getMemberMap(String uID) {
		Map<String, String> userData = new HashMap<String, String>();
		SQLMemberID res1 = memberDao.searchMemberID(uID);
		SQLMemberData res2 = memberDao.searchMemberData(uID);
		userData.put("password", res1.getUserPaws());
		userData.put("name", res2.getName());
		userData.put("birthday", res2.getBirthday());
		userData.put("email", res2.getEmail());
		userData.put("bData", "success");
		return userData;

	}

	// 取得企業會員資料
	public Map<String, String> getMemberMapVendor(String uID) {
		Map<String, String> userData = new HashMap<String, String>();
		SQLMemberID res1 = memberDao.searchMemberID(uID);
		SQLMemberDataVendor res2 = memberDao.searchMemberDataVendor(uID);
		userData.put("password", res1.getUserPaws());
		userData.put("vat", res1.getVAT());
		userData.put("vendor", res2.getVendor());
		userData.put("principal", res2.getPrincipal());
		userData.put("address", res2.getAddress());
		userData.put("email", res2.getEmail());
		userData.put("bData", "success");
		return userData;
	}
}
