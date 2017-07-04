package servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglFunc;
import po.XmglUser;

import service.FunService;
import service.UserService;

public class LoginServlet {
	public String login(HttpServletRequest req,HttpServletResponse resp){
		//取值，取从页面传过来的用户名（员工唯一编号） 密码  验证码
		String username = req.getParameter("textfield");
		String password = req.getParameter("textfield2");
		String checkCode = req.getParameter("textfield3");
		//验证验证码的正确性
		String correctCode = (String)req.getSession().getAttribute("check_code");
		System.out.println(correctCode+"------>"+checkCode);
		if(!correctCode.equals(checkCode)){
			System.out.println("验证码错误！");
			req.setAttribute("info", "3");
			return "/index.jsp";
		}
		//验证用户名，密码 
		UserService service = new UserService();
		XmglUser user = service.login(username, password);
		if(user!=null){
			System.out.println("登录成功");
			req.getSession().setAttribute("user", user);
			FunService fun = new FunService();
			List<XmglFunc> list = fun.getAllFuncs(user.getUroid());
			req.getSession().setAttribute("list", list);
			return "/MyJsp.jsp";
		}else{
			System.out.println("登录失败");
			req.setAttribute("result", "用户名或密码错误！");
			return "/index.jsp";
		}
	}
	
	public String exit(HttpServletRequest req,HttpServletResponse resp){
		return "/index.jsp";
	}
}

