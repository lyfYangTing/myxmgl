package servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglCustomer;

import service.CustomerService;
import util.PageUtil;

public class CustomerServlet {
	private CustomerService service = new CustomerService();
	//查询所有客户信息
	public String showAllcustomers(HttpServletRequest req,HttpServletResponse resp){
		String curPage = req.getParameter("curPage");
		if(curPage==null){
			curPage = "1";
		}
		PageUtil util = service.getAnyCustomers(Integer.parseInt(curPage));
		req.setAttribute("util", util);
		req.setAttribute("curpage", curPage);
		return "/files/showAllCustomers.jsp";
	}
	//单条数据查询
	public String queryOne(HttpServletRequest req,HttpServletResponse resp){
		//取值 取到超链接传过来的cid
		String cid = req.getParameter("cid");
		String option = req.getParameter("option");//用来判断是查看操作还是编辑操作
		//调 
		XmglCustomer customer = service.getOneCustomer(cid);
		req.setAttribute("customer", customer);
		if(option.equals("1")){
			return "/files/showOneCustomer.jsp";
		}else{
			return "/files/addkehu.jsp";
		}
	}
	//通过公司名称查找公司详细信息
	public String getCustomerByName(HttpServletRequest req,HttpServletResponse resp){
		//取值 取到超链接传过来的cname
		String clientname = req.getParameter("clientname");
		//调 
		List<XmglCustomer> customer = service.getCustomersByName(clientname);
		req.setAttribute("customer", customer);
		return "/files/showCustomersByName.jsp";
	}
	//删除客户信息
	public String deleteCus(HttpServletRequest req,HttpServletResponse resp){
		//取出所有checkbox组件《====》与hidden隐藏域传过来hello->通过cid world->存放的是关于多选框是否被选中的标识 value='yes'表示多选框被选中可以进行删除操作
		//cids isdelete 一一对应的关系
		String[] cids = req.getParameterValues("hello");
		String[] isdelete = req.getParameterValues("world");
		for(int i=0;i<cids.length;i++){
			//判断该该条记录是否能被删除 已知cid
			if(isdelete[i].equals("yes")){
				service.delete(cids[i]);
			}
		}
		return this.showAllcustomers(req, resp);
	}
	//插入一条数据    新增加更新
	public String insertOne(HttpServletRequest req,HttpServletResponse resp){
		//取值
		String cname = req.getParameter("clientname");
		String clxr = req.getParameter("cper");
		String ctel = req.getParameter("ctel");
		String caddress = req.getParameter("caddr");
		String cbj=req.getParameter("cbackground");
		String cid = req.getParameter("cid");
		System.out.println("cid===========>"+cid);
		if(!cid.equals("")){
			System.out.println("正在执行更新操作");
			service.update(cid,cname, clxr, ctel, caddress, cbj);
		}else{
			System.out.println("正在执行新增操作");
			service.insert(cname, clxr, ctel, caddress, cbj);
		}
		return this.showAllcustomers(req, resp);
	}
}
