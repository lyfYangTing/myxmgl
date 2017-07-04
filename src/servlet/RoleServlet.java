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
	//ajax 页面刷新 不会发生页面跳转
	public void getAllFuncs(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String roid = req.getParameter("roid");
		List<XmglFunc> funOther = func.getAllFuncs(roid);
		resp.setContentType("html/text;charset=GBK");//将写会的字符集规定为GBK的
		PrintWriter out = resp.getWriter();
		JSONArray array = JSONArray.fromObject(funOther);
		System.out.println(array);
		out.println(array.toString());
		out.flush();
	}
	//添加角色 并 赋予权限
	public String addRoleAndFunc(HttpServletRequest req,HttpServletResponse resp){
	    String roname = req.getParameter("juename");
	    String robz = req.getParameter("juebeizhu");
	    String[] funcs = req.getParameterValues("func");
	    int roid = service.getNewRoid();
	    service.insertRole(roname, robz);
	    //新增权限
	    func.insertFuncs(String.valueOf(roid), funcs);
	    return this.getAllRoles(req, resp);
	}
	//更新角色下的权限
	public String updateFuncs(HttpServletRequest req,HttpServletResponse resp){
		String roid = req.getParameter("roid");
		String[] funcs = req.getParameterValues("fun");
		func.insertFuncs(roid, funcs);
		return this.getAllRoles(req, resp);
	}
	//删除角色
	public String deleteRole(HttpServletRequest req,HttpServletResponse resp){
		String[] roids = req.getParameterValues("tt1");
		service.delete(roids);
		return this.getAllRoles(req, resp);
	}
}
