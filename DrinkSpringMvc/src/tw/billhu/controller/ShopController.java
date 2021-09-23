package tw.billhu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.billhu.model.Orderss;
import tw.billhu.model.OrderssDao;
import tw.billhu.model.OrderssItem;
import tw.billhu.model.OrderssItemDao;
import tw.billhu.model.Prouct;
import tw.billhu.model.ProuctDao;
import tw.billhu.model.ShopCarBean;

@Controller
@SessionAttributes(names = { "prouct", "car", "allProuctTotal", "allQty" })
public class ShopController {
	@Autowired
	private ProuctDao prouctDao;
	@Autowired
	private OrderssDao orderssDao;
	@Autowired
	private OrderssItemDao orderssitemDao;
	
	@RequestMapping(path = "/initShopCar.controller",method = RequestMethod.GET)
	public String initShopCar(ModelMap m) {
		List<Prouct> prouct = prouctDao.getAllProuct();
		m.addAttribute("prouct", prouct);
		return "/ShopCar/ShopCar.jsp";
		
	}

	@RequestMapping(path = "/ShopCar.controller", method = RequestMethod.GET)
	public String procssShopAction(HttpServletRequest request, HttpServletResponse response, ModelMap m) throws ParseException {
		List<ShopCarBean> car = (List<ShopCarBean>) m.getAttribute("car");
		String todo = request.getParameter("todo");

		if (todo == null) {
			return "/ShopCar/ShopCar.jsp";
		} else if (todo.equals("add")) {
			String[] wo = request.getParameter("prouct").split("-");
			int proid = Integer.parseInt(wo[0]);
			int storeID = Integer.parseInt(wo[1]);
			String prouctName = wo[2];
			double price = Double.parseDouble(wo[3]);
			int qty = Integer.parseInt(request.getParameter("qty"));
			String ice = request.getParameter("ice");
			String sugar = request.getParameter("sugar");
			ShopCarBean newShoppCar = new ShopCarBean(storeID, proid, prouctName, qty, price, ice, sugar);

			if (car == null) {

				car = new ArrayList<>();
				car.add(newShoppCar);
				m.addAttribute("car", car);
			} else {
				boolean found = false;

				Iterator iter = car.iterator();
				while (!found && iter.hasNext()) {

					ShopCarBean oldcar = (ShopCarBean) iter.next();
					if (oldcar.getProuctID() == newShoppCar.getProuctID()
							&& oldcar.getIce().equals(newShoppCar.getIce())
							&& oldcar.getSugar().equals(newShoppCar.getSugar())) {
						int newqty = Integer.parseInt(request.getParameter("newqty"));
						oldcar.setQty(oldcar.getQty() + newShoppCar.getQty());
						found = true;
					}
				}
				if (!found) {
					car.add(newShoppCar);
				}
			}
			return "/ShopCar/ShopCar.jsp";
		} else if (todo.equals("remove")) {
			int carIndex = Integer.parseInt(request.getParameter("cartIndex"));
			car.remove(carIndex);
			return "/ShopCar/ShopCar.jsp";
		} else if (todo.equals("checkout")) {
			double total = 0;
			int allQty = 0;
			for (ShopCarBean item : car) {
				total += item.getPrice() * item.getQty();
				allQty += item.getQty();
			}
			m.addAttribute("allProuctTotal", total);
			m.addAttribute("allQty", allQty);

			return "/ShopCar/CheckOut.jsp";

		} else if (todo.equals("confim")) {
			int customerID = 1001;
			double total = 0;
			int storeID = 0;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());

			Date date = sdf.parse(timeStamp);

			for (ShopCarBean item : car) {
				total += item.total();
				storeID += item.getStoreID();
			}
			Orderss order = new Orderss(customerID, storeID, date, total);
			orderssDao.InsertOrderss(order);

            int orderID= orderssDao.getOrderssID(customerID, total);
            for (ShopCarBean item : car) {
            	OrderssItem orderssItem=new OrderssItem(orderID, item.getProuctName(), item.getPrice(), item.getQty(), item.total());
            	orderssitemDao.InserOrderssItem(orderssItem);
          }
			m.remove(car);

			return "/ShopCar/Confim.jsp";

		} else if (todo.equals("cancal")) {
			m.remove(car);

			return "/ShopCar/Cancal.jsp";
		}
		return null;
	}
}
