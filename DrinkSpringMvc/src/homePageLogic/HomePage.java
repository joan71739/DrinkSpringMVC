package homePageLogic;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/HomePage")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HomePage() {
        super();
        // TODO Auto-generated constructor stub
    }


	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 設定編碼
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		
		// 取得帳號資料
		HttpSession session = request.getSession(true);
		String UserID = (String)session.getAttribute("UserID");
		String ClassMember = (String)session.getAttribute("ClassMember");
		String Vat = (String)session.getAttribute("Vat");
		String Longin = (String)session.getAttribute("Longin");
		
		
		System.out.println("ClassMember="+ClassMember);
		
		// 判斷登入的類型
		if( Longin == null || ClassMember.equals("a") ) { // 未登入 和 一般會員登入
			
			request.getRequestDispatcher("websitePage/homeWebsitePage.jsp").forward(request, response);
			return;
			
		}else if( ClassMember.equals("b") ) { // 企業會員登入
			
			request.getRequestDispatcher("websitePage/enterpriseWebsitePage.jsp").forward(request, response);
			return;
			
		}else if( ClassMember.equals("c") || ClassMember.equals("d") ) { // 店家會員登入
			
			request.getRequestDispatcher("websitePage/storeWebsitePage.jsp").forward(request, response);
			return;
			
		}else { // 預期外的結果
			
			System.out.println("預期外的結果");
			// 待補
			
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
