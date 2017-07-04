package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import po.XmglCustomer;
import po.XmglProjb;
import po.XmglUser;

import service.CustomerService;
import service.ProjbService;
import service.UserService;
import util.PageUtil;

public class ProjbServlet {
	private ProjbService service = new ProjbService(); 
	
	//全表通查，以分页形式进行显示
	public String showOnePageProjb(HttpServletRequest req,HttpServletResponse resp){
		String tz = req.getParameter("tz");
	    String curpage = req.getParameter("curpage");
	    if(curpage==null || curpage.equals("")){
	    	curpage="1";
	    }
	    PageUtil util = this.service.getOnePage(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		if(tz==null || tz.equals("")){
			return "/files/showAllProjbs.jsp";
		}else{
			return "/files/showAllCosts.jsp";
		}
	}
	//根据pjid查到该用户的详细信息进行显示    规定一个caozuo用来判断查完单条数据向哪个页面跳转（showOneProjb.jsp显示项目详细信息页面）
	public String getOneProjb(HttpServletRequest req,HttpServletResponse resp){
		String caozuo = req.getParameter("caozuo");
		//caozuo=cha(跳转到showOneProjb.jsp页面) caozuo=update or caozuo=insert 跳转到更新（新增）页面
		String pjid = req.getParameter("pjid");
		String pjname = req.getParameter("proname");
		System.out.println("pjname===============>"+pjname);
		XmglProjb xmglProjb = null;
		//用来传该用户的详细信息
		if(pjname!=null && !pjname.equals("")){
			System.out.println("跳这个通过项目名称找项目的方法了吗？");
			xmglProjb = this.service.getOneProjbyName(pjname);
		}else{
			xmglProjb = this.service.getOneProjb(pjid);
		}
		 
		//req.setAttribute("xmglProjb", xmglProjb);
		if(caozuo.equals("cha")){
			req.setAttribute("xmglProjb", xmglProjb);
			return "/files/showOneProjb.jsp";
		}else if(caozuo.equals("update")){
			req.setAttribute("xmglProjb", xmglProjb);
			return "/files/updateOneProjb.jsp";
		}else{
			return "/files/insertOneProjb.jsp";
		}
	}
	//新增(修改)页面需要的数据  需要一个项目负责人（项目经理。。。） 需要选择客户（要客户表中所有信息） 在这个方法中获取负责人  客户  开发人数
	public String getCustomerAndUsers(HttpServletRequest req,HttpServletResponse resp){
		//存放客户的所有信息
		CustomerService customer = new CustomerService();
		List<XmglCustomer> list1 = customer.getAllcustomers();
		req.setAttribute("listCustomer", list1);
		//存放所有        职位是项目经理edid=5 并且 在系统中的角色是基层管理即uroid=3的所有人员的信息
		UserService user = new UserService(); 
		List<XmglUser> list2 = user.getAllXmjl("5", "3");
		req.setAttribute("listXmglUser", list2);
		return this.getOneProjb(req, resp);
	}
	//更新项目基本信息
	public String updateProjb(HttpServletRequest req,HttpServletResponse resp){
		String prno = req.getParameter("prno");//项目编号
		String proname = req.getParameter("proname");//项目名称
		String clientno = req.getParameter("clientno");//客户cid
		String promoney = req.getParameter("promoney");//项目金额
		String pronum = req.getParameter("pronum");//开发人数
		String proManager = req.getParameter("proManager");//项目经理
		String proidcomplete =req.getParameter("proidcomplete");//项目状态
		String prozmoney = req.getParameter("prozmoney");//实际总成本
		String probeginDate = req.getParameter("probeginDate");//实际开发日期
		String procompeteDate = req.getParameter("procompeteDate");//实际完成日期
		String promission = req.getParameter("promission");//优先级
		String probeizhu = req.getParameter("probeizhu");//备注
		this.service.updateOneProjb(prno, proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, probeginDate, procompeteDate, promission, probeizhu);
		return this.showOnePageProjb(req, resp);
	}
	//获取项目经理手下所带领的所有人   需要先选项目经理
	public void getAllSubUser(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String prno = req.getParameter("pno");
		UserService service = new UserService();
		List<XmglUser> list = service.getAllUserByPid(prno);
		resp.setContentType("html/text;charset=GBK");
		PrintWriter out = resp.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	//删除项目
	public String deleteProjb(HttpServletRequest request,HttpServletResponse response){
		String[] pjids = request.getParameterValues("hello");
		String[] isdeletes = request.getParameterValues("world");
		for(int i=0;i<pjids.length;i++){
			if(isdeletes[i].equals("yes")){
				this.service.deleteProjb(pjids[i]);
			}
		}
		return this.showOnePageProjb(request, response);
	}

	/** 
	 * "jsps/xmglPrjAddInfo.jsp"页面上点击"添加项目"功能，进行添加项目
	 * 需要添加到xmgl_projb表中的属性有：
	 * 项目名称---proname
	 * 项目金额---promoney
	 * 项目经理---proManager
	 * 预算总成本---proyszmoney
	 * 计划完成日期---projhcompeteDate
	 * 所属单位---clientno
	 * 开发人数---pronum
	 * 完成状态---proidcomplete
	 * 计划开发日期---projhbeginDate
	 * 优先级---promission
	 * 备注---probeizhu
	 * */
	public String insertPrjInfo(HttpServletRequest req,HttpServletResponse response){
		String proname = req.getParameter("proname");//项目名称
		String clientno = req.getParameter("clientno");//客户cid
		String promoney = req.getParameter("promoney");//项目金额
		String pronum = req.getParameter("pronum");//开发人数
		String proManager = req.getParameter("proManager");//项目经理
		String proidcomplete =req.getParameter("proidcomplete");//项目状态
		String prozmoney = req.getParameter("proyszmoney");//预算总成本
		String projhbeginDate = req.getParameter("projhbeginDate");//计划开发日期
		String projhcompeteDate = req.getParameter("projhcompeteDate");//计划完成日期
		String promission = req.getParameter("promission");//优先级
		String probeizhu = req.getParameter("probeizhu");//备注
		this.service.insertPrjInfo(proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, projhbeginDate, projhcompeteDate, promission, probeizhu);
		return this.showOnePageProjb(req, response);
	}
}
