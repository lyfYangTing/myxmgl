package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import po.XmglProgn;
import po.XmglProjb;
import po.XmglProplan;
import po.XmglRwlx;
import po.XmglUser;
import service.GongNengService;
import service.ProjbService;
import service.ProjhService;
import service.RwlxService;
import service.UserService;
import util.PageUtil;

public class ProjhServlet {
	private ProjhService service = new ProjhService();
	
	/**
     *全表通查，以分页形式进行显示
     */
	public String showOnePageProjh(HttpServletRequest req,HttpServletResponse resp){
	    String curpage = req.getParameter("curpage");
	    if(curpage==null || curpage.equals("")){
	    	curpage="1";
	    }
	    PageUtil util = this.service.getOnePage(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		return "/files/showAllProjhs.jsp";
	}
	/**
	 * 通过多选进行批量删除
	 */
	public String deleteProjb(HttpServletRequest request,HttpServletResponse response){
		String[] pjids = request.getParameterValues("hello");
		String[] isdeletes = request.getParameterValues("world");
		for(int i=0;i<pjids.length;i++){
			if(isdeletes[i].equals("yes")){
				this.service.deleteProjh(pjids[i]);
			}
		}
		return this.showOnePageProjh(request, response);
	}
	/**
	 * 新增操作之前需要：所有的项目 和 所有任务类型
	 */
	public String getAllProjbAndRwlx(HttpServletRequest request,HttpServletResponse response){
		//获取所有的项目     用于在页面中在项目选择下拉列表中显示
		ProjbService pjService = new ProjbService();
		List<XmglProjb> list1 = pjService.getAllProjb();
		//获取所有任务  用于在页面中在任务类型选择下拉列表中显示
		RwlxService rwlx = new RwlxService();
		List<XmglRwlx> list2 = rwlx.getAllRwlx();
		request.setAttribute("pjlist", list1);
		request.setAttribute("rwlxlist", list2);
		return "/files/insertOneProjh.jsp";
	}
	/**
	 * 在进入更新页面之前 1.需要获取任务类型列表   2.还要根据项目id获取执行人列表   3.根据外键功能id(pgid)获取前置任务
	 */
	public String getAllRwlxAndZxr(HttpServletRequest request,HttpServletResponse response){
		String pjid = request.getParameter("pjid");
		//获取根据项目id获取执行人列表 1.首先获取项目基本信息对象，得到项目经理编号 2.根据经理编号获取其手下的人，即所有父级id为项目经理的uid的所有人
		ProjbService pj =new ProjbService();
		UserService user = new UserService();
		List<XmglUser> list1 = user.getAllUserByPid(pj.getOneProjb(pjid).getPjUid());
		//获取任务类型列表
		RwlxService rwlx = new RwlxService();
		List<XmglRwlx> list2 = rwlx.getAllRwlx();
		request.setAttribute("zxrlist", list1);
		request.setAttribute("rwlxlist", list2);
		return this.getOneProjh(request, response);
	}
	/**
	 * 查看计划的详细内容   1.用于查询一条计划的详细信息 需要根据计划id(ppid)查出该计划的详细信息，并将对象传到页面
	 *              2.用于更新前获取该计划的已有信息  根据计划id(ppid)查出该计划的详细信息，并将对象传到页面
	 *              3.根据该任务在哪个功能下 根据功能id(pgid)获取前置任务列表
	 */
	public String getOneProjh(HttpServletRequest request,HttpServletResponse response){
		String ppid = request.getParameter("ppid");
		String caozuo = request.getParameter("caozuo");
		XmglProplan plan = service.getOneProjh(ppid);
		//前置任务对象
		XmglProplan qzPlan = service.getOneProjh(plan.getPpQzId());
		plan.setQzPlan(qzPlan);
		request.setAttribute("xmglProplan", plan);
		if(caozuo.equals("cha")){//进入任务详细信息显示页面
			return "/files/showOneProjh.jsp";
		}else if(caozuo.equals("rwlb")){//显示个人任务详细信息
			return "/files/showOneRwlb.jsp";
		}else{//先获取 该任务在哪个功能下 根据功能id(pgid)获取前置任务列表
			List<XmglProplan> list = service.getAllProjhByPgid(plan.getPgId());
			System.out.println("该功能下没有前置任务吗？================》"+list.size());
			request.setAttribute("qzrwlist", list);
			return "/files/updateOneProjh.jsp";
		}
	}
	/**
	 * ajax 第一次联动 选择项目后获取到所有的需求  在GongNengServlet中获取   
	 * 该方法： 获取项目中的项目经理 并获取到项目经理的  手下
	 * @throws IOException 
	 */
	public void getAllProzxr(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("html/text;charset=GBK");
		String pjid = request.getParameter("pjid");
		ProjbService pj =new ProjbService();
		UserService user = new UserService();
		List<XmglUser> list1 = user.getAllUserByPid(pj.getOneProjb(pjid).getPjUid());
		System.out.println("到这了吗？");
		JSONArray json = JSONArray.fromObject(list1);
		PrintWriter out = response.getWriter();
		//过滤作用：将对象中不需要的属性值全部过滤掉
		/*
		JsonConfig con = new JsonConfig();
		con.setExcludes(new String[]{"",""});
		JSONObject json = new JSONObject().fromObject(pu,con);
		*/
        out.println(json.toString());
		out.flush();
	}
	/**
	 * 第二次联动：根据需求选模块：获取模块 通过GongNengServlet中的方法可以获取
	 * 第三次联动：根据模块选功能：获取功能
	 * @throws IOException 
	 */
	public void getAllProgn(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("html/text;charset=GBK");
		//获取模块id
		String pmid = request.getParameter("pmid");
		//根据模块id查出需求下的所有功能
		GongNengService progn = new GongNengService();
		List<XmglProgn> list = progn.getGnByPmid(pmid);
		//写回页面
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	/**
	 * 第四次联动：根据已选功能，获取功能下的所有任务
	 */
	public void getAllProjh(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("html/text;charset=GBK");
		//获取模块id
		String pgid = request.getParameter("pgid");
		//根据模块id查出需求下的所有功能
		List<XmglProplan> list = service.getAllProjhByPgid(pgid);
		//写回页面
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	/**
	 * 新增数据
	 */
	public String insertProjh(HttpServletRequest request,HttpServletResponse response){
		//取值
		String ppName=request.getParameter("jtitle");//计划标题
		String ppQzId=request.getParameter("qzrw");//前置任务
		String ppStartTime=request.getParameter("jrbegindate");//计划开始时间
		String ppEndTime=request.getParameter("jrenddate");//计划结束时间
		String ppZxr=request.getParameter("jbyper");//任务执行人
		String ppYxj=request.getParameter("jmission");//优先级
		String rwId=request.getParameter("jleixing");//任务类型
		String ppState=request.getParameter("iscomplete");//状态
		String pgId=request.getParameter("gongneng");//功能id
		String ppBeizhu=request.getParameter("jbeizhu");//备注
		this.service.insert(ppName,ppQzId,ppStartTime,ppEndTime,ppZxr,ppYxj,rwId,ppState,pgId,ppBeizhu);
		return this.showOnePageProjh(request, response);
	}
	/**
	 * 计划表更新：实现编辑功能
	 */
	public String updateProjh(HttpServletRequest request,HttpServletResponse response){
		String ppid = request.getParameter("ppid"); 
		String ppName=request.getParameter("jtitle");//计划标题
		String ppQzId=request.getParameter("qzid");//前置任务
		String ppsjStartTime=request.getParameter("jrbegindate");//实际开始开始时间
		String ppsjEndTime=request.getParameter("jrenddate");//实际结束时间
		String ppZxr=request.getParameter("jbyper");//任务执行人
		String ppYxj=request.getParameter("jmission");//优先级
		String rwId=request.getParameter("jleixing");//任务类型
		String ppState=request.getParameter("iscomplete");//状态
		String ppshState = request.getParameter("isok");//审核状态
		String ppBeizhu=request.getParameter("jbeizhu");//备注
		this.service.updateOneProjh(ppid, rwId, ppQzId, ppName, ppsjStartTime, ppsjEndTime, ppState, ppQzId, ppshState, ppBeizhu);
		return this.showOnePageProjh(request, response);
	}
	/**
	 * 发任务功能：更新表中数据
	 */
	public String faJiHua(HttpServletRequest request,HttpServletResponse response){
		String pjid = request.getParameter("pjid");
		String ppRwfpr = ((XmglUser)request.getSession().getAttribute("user")).getUid();
		this.service.updateFrw(pjid,ppRwfpr);
		return this.showOnePageProjh(request, response);
	}
	/**
	 * 查看个人任务信息
	 */
	public String showMyRenwu(HttpServletRequest request,HttpServletResponse response){
		String ppZxr = ((XmglUser)request.getSession().getAttribute("user")).getUid();
		String curpage = request.getParameter("curpage");
	    if(curpage==null || curpage.equals("")){
	    	curpage="1";
	    }
	    PageUtil util = this.service.getOnePageByZxr(ppZxr, Integer.parseInt(curpage));
	    request.setAttribute("util", util);
		return "/files/showMyRw.jsp";
	}
}
