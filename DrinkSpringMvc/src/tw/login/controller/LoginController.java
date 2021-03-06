package tw.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.login.bean.SQLMemberData;
import tw.login.bean.SQLMemberDataVendor;
import tw.login.bean.SQLMemberID;
import tw.login.dao.MemberDao;
import tw.mail.MailService;

@Controller
@SessionAttributes(names = { "UserID", "ClassMember", "Vat", "Longin" })
public class LoginController {

	@Autowired
	MemberDao memberDao;
	// mail
	MailService sendMailService = new MailService();
	//ModifyMemberController mMC = new ModifyMemberController(); 

	@RequestMapping(path = "/loginController", method = RequestMethod.POST)
	public String chackLogin(@RequestParam(name = "userID", required = false) String userID,
			@RequestParam(name = "password", required = false) String userPaw,
			@RequestParam(name = "remember_me", required = false) String rem_me,
			@RequestParam(name = "sub", required = false) String submit,
			@RequestParam(name = "type", required = false) String sType,
			@RequestParam(name = "birthday", required = false) String birthday,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "principal", required = false) String principal,
			@RequestParam(name = "vat", required = false) String vat, Model m, HttpServletResponse response,
			SessionStatus sessionStatus) { 
		if (submit == null) {
			if (sType.equals("form-a")) {
				m.addAttribute("Type", "A");
			}
			if (sType.equals("form-b")) {
				m.addAttribute("Type", "B");
			}
			return "login/ForgotPassword.jsp";
		}

		if (submit.equals("login")) {
			Map<String, String> errors = new HashMap<String, String>();
			m.addAttribute("errors", errors);

			if (userID == null || userID.length() == 0) {
				errors.put("er_usID", "???????????????");
			}

			if (userPaw == null || userPaw.length() == 0) {
				errors.put("er_pwd", "???????????????");
			}

			if (errors != null && !errors.isEmpty()) {
				return "login/LoginPage.jsp";
			}

			SQLMemberID res = memberDao.searchMemberID(userID);
			Cookie userIDCookie = null;
			Cookie userRe = null;

			if (res != null) {
				String pawString = res.getUserPaws();
				String classString = res.getClassMember();
				String vatString = res.getVAT();
				if (userPaw.equals(pawString)) {
					m.addAttribute("UserID", userID);// ??????
					m.addAttribute("ClassMember", classString);// ??????
					m.addAttribute("Vat", vatString);// ?????? ????????????null
					m.addAttribute("Longin", "success");// ??????????????????
					// ??????cookie
					if (rem_me != null) {
						userIDCookie = new Cookie("UserID", userID);
						userRe = new Cookie("remember_me", rem_me);
						userIDCookie.setMaxAge(60 * 60 * 24); // Store cookie for 24hr
						userRe.setMaxAge(60 * 60 * 24); // Store cookie for 24hr
						response.addCookie(userIDCookie);
						response.addCookie(userRe);
					}
					// ??????cookie
					if (rem_me == null) {
						userIDCookie = new Cookie("UserID", userID);
						userRe = new Cookie("remember_me", rem_me);
						userIDCookie.setMaxAge(0);
						userRe.setMaxAge(0);
						response.addCookie(userIDCookie);
						response.addCookie(userRe);
					}
					if( "a".equals(classString) ) {
						
						return "websitePage/homeWebsitePage.jsp";
						
					}else if( "b".equals(classString) ) {
						
						return "websitePage/enterpriseWebsitePage.jsp";
						
					}
					
					
				} else {
					errors.put("pwderror", "????????????");
					return "login/LoginPage.jsp";
				}
				
				
				
				if (classString.equals("fa")) {
					// ????????????????????? ?????? "Type_fg", "fg"//?????????????????????
					Map<String, String> userData = new HashMap<String, String>();
					SQLMemberID res1 = memberDao.searchMemberID(userID);
					SQLMemberData res2 = memberDao.searchMemberData(userID);
					userData.put("password", res1.getUserPaws());
					userData.put("name", res2.getName());
					userData.put("birthday", res2.getBirthday());
					userData.put("email", res2.getEmail());
					userData.put("bData", "success");
					m.addAttribute("userData", userData);
					m.addAttribute("Type_fg", "fg");
					 return "member/ModifyMember.jsp";
				} else if (classString.equals("fb")) {
					// ????????????????????? ??????
					Map<String, String> userData = new HashMap<String, String>();
					SQLMemberID res1 = memberDao.searchMemberID(userID);
					SQLMemberDataVendor res2 = memberDao.searchMemberDataVendor(userID);
					userData.put("password", res1.getUserPaws());
					userData.put("vat", res1.getVAT());
					userData.put("vendor", res2.getVendor());
					userData.put("principal", res2.getPrincipal());
					userData.put("address", res2.getAddress());
					userData.put("email", res2.getEmail());
					userData.put("bData", "success");
					m.addAttribute("userData", userData);
					m.addAttribute("Type_fg", "fg");
					 return "member/ModifyMemberVendor.jsp";
				}
				return "websitePage/homeWebsitePage.jsp";
			} else {
				// ??????????????????
				m.addAttribute("UserID", userID);
//				m.addAttribute("fal", "f");
				errors.put("pwderror", "????????????");
				return "login/LoginPage.jsp";
			}
		} else if (submit.equals("cancel")) {
			return "websitePage/homeWebsitePage.jsp";
		} else if (submit.equals("longout")) {
			sessionStatus.setComplete();// ??????session
			return "websitePage/homeWebsitePage.jsp";
		} else if (submit.equals("black")) {
			return "websitePage/homeWebsitePage.jsp";
		} else if (submit.equals("forgChack")) {
			String nPws = "";// ?????????
			String tmp = "";
			for (int i = 0; i < 6; i++) {
				int n = (int) Math.floor(Math.random() * 3) % 3;
				if (n == 1) {
					tmp = String.valueOf((char) Math.floor((Math.random() * 26) + 65));// ??????
				} else if (n == 2) {
					tmp = String.valueOf((char) Math.floor((Math.random() * 26) + 97));// ??????
				} else {
					tmp = String.valueOf((int) Math.floor(Math.random() * 9));// ??????
				}
				nPws += tmp;
			}

			Map<String, String> Message = new HashMap<String, String>();
			if (sType.equals("form-a")) {

				if ("".equals(userID) || "".equals(birthday) || "".equals(email)) {
//					m.addAttribute("forg_msg", "?????????????????????");
					m.addAttribute("Message", "err");
					return "login/ForgotPassword.jsp";
				}
				SQLMemberID res1 = memberDao.searchMemberID(userID);
				SQLMemberData res2 = memberDao.searchMemberData(userID);

				if (res1 == null || "".equals(birthday) || "".equals(email)) {

					m.addAttribute("Type", "A");
					m.addAttribute("Message", "err");
					return "login/ForgotPassword.jsp";
				}

				if (res1 != null) {
					// ????????????
					if (res2.getBirthday().equals(birthday) && res2.getEmail().equals(email)) {
						sendMailService.sendMail(email, nPws);// ???????????????
						m.addAttribute("Type", "A");
						m.addAttribute("Type_fg", "fg");
//						m.addAttribute("fg", "???????????????????????????");
						SQLMemberID sqlID = new SQLMemberID(userID, nPws, "fa", null);
						memberDao.updateMemberID(sqlID);
						return "login/ForgotPassword.jsp";
					}

					else {
						m.addAttribute("Type", "A");
						m.addAttribute("Message", "err");
						return "login/ForgotPassword.jsp";
					}
				}
			}
			if (sType.equals("form-b")) {
				if ("".equals(userID) || "".equals(vat) || "".equals(principal) || "".equals(email)) {
					m.addAttribute("Message", "err");
					return "login/ForgotPassword.jsp";
				}

				SQLMemberID res1 = memberDao.searchMemberID(userID);
				SQLMemberDataVendor res2 = memberDao.searchMemberDataVendor(userID);
				if (res1 == null || "".equals(vat) || "".equals(principal) || "".equals(email)) {
					m.addAttribute("Type", "B");
					m.addAttribute("Message", "err");
					return "login/ForgotPassword.jsp";
				} else if (res1 != null) {
					if (res1.getVAT().equals(vat) && res2.getPrincipal().equals(principal)
							&& res2.getEmail().equals(email)) {
						sendMailService.sendMail(email, nPws); // ???????????????
						SQLMemberID sqlID = new SQLMemberID(userID, nPws, "fb", vat);
						memberDao.updateMemberID(sqlID);

						m.addAttribute("Type", "B");
						m.addAttribute("Type_fg", "fg");
//						m.addAttribute("fg", "???????????????????????????");
						return "login/ForgotPassword.jsp";

					} else {
						m.addAttribute("Type", "B");
						m.addAttribute("Message", "err");
						return "login/ForgotPassword.jsp";
					}
				}
			}
		}
		return "websitePage/homeWebsitePage.jsp";
	}
}
