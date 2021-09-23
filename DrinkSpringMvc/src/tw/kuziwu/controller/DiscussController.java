package tw.kuziwu.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.kuziwu.model.DiscussBean;
import tw.kuziwu.model.DiscussService;

@Controller

public class DiscussController {

	@Autowired
	private DiscussService discussService;

//		@RequestMapping(path = "/membersEntry.controller", method = RequestMethod.GET)
//		public String processShowForm(Model m) {
//			DiscussBean mem1 = new DiscussBean();
//			//Members mem1 = new Members("jack", "male", 26);
//			m.addAttribute("DiscussBean", mem1);
//			return "DiscussPage";
//		}
		
		@RequestMapping(path = "/DiscussController", method = RequestMethod.GET)
		public String processFormAction(@ModelAttribute(name="shopName") String shopName,
				@ModelAttribute(name="drink") String drink,
				@ModelAttribute(name="drinkstar") int drinkstar,
				@ModelAttribute(name="drinkDiscuss") String drinkDiscuss){
		DiscussBean discussBean = new DiscussBean();
		System.out.println(shopName+"  "+drink+"  "+drinkstar+"  "+drinkDiscuss);
		discussBean.setShopName(shopName);
		discussBean.setDrink(drink);
		discussBean.setDrinkstar(drinkstar);
		discussBean.setDrinkDiscuss(drinkDiscuss);
		discussService.insertDiscuss(discussBean);
		
			return "/DiscussPage2Controller";
		}
	}
	

