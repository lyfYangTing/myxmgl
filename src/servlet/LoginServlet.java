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
		//ȡֵ��ȡ��ҳ�洫�������û�����Ա��Ψһ��ţ� ����  ��֤��
		String username = req.getParameter("textfield");
		String password = req.getParameter("textfield2");
		String checkCode = req.getParameter("textfield3");
		//��֤��֤�����ȷ��
		String correctCode = (String)req.getSession().getAttribute("check_code");
		System.out.println(correctCode+"------>"+checkCode);
		if(!correctCode.equals(checkCode)){
			System.out.println("��֤�����");
			req.setAttribute("info", "3");
			return "/index.jsp";
		}
		//��֤�û��������� 
		UserService service = new UserService();
		XmglUser user = service.login(username, password);
		if(user!=null){
			System.out.println("��¼�ɹ�");
			req.getSession().setAttribute("user", user);
			FunService fun = new FunService();
			List<XmglFunc> list = fun.getAllFuncs(user.getUroid());
			req.getSession().setAttribute("list", list);
			return "/MyJsp.jsp";
		}else{
			System.out.println("��¼ʧ��");
			req.setAttribute("result", "�û������������");
			return "/index.jsp";
		}
	}
	
	public String exit(HttpServletRequest req,HttpServletResponse resp){
		return "/index.jsp";
	}
}

