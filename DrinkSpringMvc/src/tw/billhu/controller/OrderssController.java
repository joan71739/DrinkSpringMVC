package tw.billhu.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.billhu.model.Orderss;
import tw.billhu.model.OrderssDao;

@Controller
public class OrderssController {
	@Autowired
	private OrderssDao orderDao;

	@RequestMapping(path = "/selectAllOrderss.controller", method = RequestMethod.GET)
	protected String processSelectAllOrderssAction(HttpServletRequest request, HttpServletResponse response)
			throws SQLException {

		List<Orderss> all = orderDao.getAllOrderss();

		request.setAttribute("order", all);

		return "ShopCar/SelectOrd.jsp";

	}
    @RequestMapping(path = "/selectOrderss.controller",method=RequestMethod.GET)
	public String processSelectOrderssAction(HttpServletRequest request, HttpServletResponse response) {
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		List<Orderss> all;
		try {
			all = orderDao.getOrderss(begin, end);
			request.removeAttribute("order");
			request.setAttribute("order", all);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return "ShopCar/SelectOrd.jsp";

	}

}
