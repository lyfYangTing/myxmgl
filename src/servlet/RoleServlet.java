package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import po.XmglFunc;
import po.XmglRole;
import service.FunService;
import service.RoleService;

public class RoleServlet {
	private RoleService service = new RoleService();
	private FunService func = new FunService();

	public String getAllRoles(HttpServletRequest req,HttpServletResponse resp){
		List<XmglRole> list = service.getAllRoles();
		List<XmglFunc> listfunAll = func.getAllFunctions();
		String pd = req.getParameter("w");
		req.setAttribute("listAll", listfunAll);
		req.setAttribute("rolelist", list);
		if(pd==null || pd.equals("0")){
			return "/files/showAllFunction.jsp";
		}else if(pd.equals("1")){
			return "/files/addRole.jsp";
		}else{
			return "/files/showAllRoles.jsp";
		}
	}
	//ajax ҳ��ˢ�� ���ᷢ��ҳ����ת
	public void getAllFuncs(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String roid = req.getParameter("roid");
		List<XmglFunc> funOther = func.getAllFuncs(roid);
		resp.setContentType("html/text;charset=GBK");//��д����ַ����涨ΪGBK��
		PrintWriter out = resp.getWriter();
		JSONArray array = JSONArray.fromObject(funOther);
		System.out.println(array);
		out.println(array.toString());
		out.flush();
	}
	//��ӽ�ɫ �� ����Ȩ��
	public String addRoleAndFunc(HttpServletRequest req,HttpServletResponse resp){
	    String roname = req.getParameter("juename");
	    String robz = req.getParameter("juebeizhu");
	    String[] funcs = req.getParameterValues("func");
	    int roid = service.getNewRoid();
	    service.insertRole(roname, robz);
	    //����Ȩ��
	    func.insertFuncs(String.valueOf(roid), funcs);
	    return this.getAllRoles(req, resp);
	}
	//���½�ɫ�µ�Ȩ��
	public String updateFuncs(HttpServletRequest req,HttpServletResponse resp){
		String roid = req.getParameter("roid");
		String[] funcs = req.getParameterValues("fun");
		func.insertFuncs(roid, funcs);
		return this.getAllRoles(req, resp);
	}
	//ɾ����ɫ
	public String deleteRole(HttpServletRequest req,HttpServletResponse resp){
		String[] roids = req.getParameterValues("tt1");
		service.delete(roids);
		return this.getAllRoles(req, resp);
	}
}
