package tw.kuziwu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.kuziwu.model.DiscussBean;
import tw.kuziwu.model.DiscussService;


@Controller
public class DiscussPage2Controller {
	@Autowired
	private DiscussService discussService;
	@RequestMapping(path = "/DiscussPage2Controller", method = RequestMethod.GET)
	public String discuss2(Model m) {
	DiscussBean discussBean = new DiscussBean();
	List<DiscussBean> discussBeanList = discussService.queryAllDiscuss();
	m.addAttribute("discussAll", discussBeanList);
	
	return "/Discuss/DiscussPage2.jsp";
	}
	
}
