package servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import po.XmglProgn;
import po.XmglProjb;
import po.XmglPromk;
import po.XmglProxq;
import service.GongNengService;
import service.ProjbService;
import service.PromkService;
import service.ProxqService;
import util.PageUtil;

public class GongNengServlet {
	
	
	//底层service方法 GongNengService
	
	private GongNengService gongNengService = new GongNengService();
	private ProjbService projbService = new ProjbService();
	private ProxqService proxqService = new ProxqService();
	private PromkService promkService = new PromkService();
	/**
	 * 点击“项目功能信息查看”触发
	 * 第一次显示到界面上时，在数据库内调用
	 * 查询数据库中的xmgl_progn表中的所有数据
	 * 进行分页显示
	 * 数据库内的跳转方式：gongNengServlet.do?方法=queryAllProGNInfo
	 * 查询后的跳转界面：files/xmglPrjShowAllGNInfo.jsp界面
	 * */
	
	public String queryAllProGNInfo(HttpServletRequest request,HttpServletResponse response){
		//获取当前页面页码值
		String curpage = request.getParameter("curpage");
		if(curpage == null){
			curpage = "1";
		}
		PageUtil util = gongNengService.getProngnPageInfo(Integer.parseInt(curpage));
		request.setAttribute("util",util);
		return "/files/xmglPrjShowAllGNInfo.jsp";
	}
	/**
	 * 在“xmglPrjShowAllGNInfo.jsp”点击"查看",获取到
	 * 相应的功能id，查询与该功能id相关的所有信息，返回功能对象
	 * 跳转回到"/jsps/showGnOne.jsp"界面进行显示
	 * 
	 * 在“xmglPrjShowAllGNInfo.jsp”点击"变更需求",获取到
	 * gnid跳转到“XmglXqmsBg.jsp”界面，进行变更需求
	 * caozuo == 1	
	 * 
	
	 **/
	public String getPrGnById(HttpServletRequest request,HttpServletResponse response){
		String gnid = request.getParameter("gnid");
		System.out.println(gnid+"<><><><><>");
		String caozuo = request.getParameter("caozuo");
		XmglProgn xmglProgn = gongNengService.getGnById(gnid);
		
		request.setAttribute("xmglProgn",xmglProgn );
		if(caozuo!=null&&caozuo.equals("1")){
			return "/files/XmglXqmsBg.jsp";
		}else if(caozuo!=null&&caozuo.equals("2")){
			System.out.println(xmglProgn.getPgName());
			System.out.println("------dsds------");
			return "/files/editXmglGnInfo.jsp";
		}else{
			return "/files/showGnOne.jsp";
		}
	}
	
	/**
	 * 在“XmglXqmsBg.jsp”界面点击“保存”，保存功能需求描述的更改
	 * 需要从界面上截取到的值：
	 * gnid
	 * needmiao
	 * */
	public String  updateXqms(HttpServletRequest request,HttpServletResponse response){
		String gnid = request.getParameter("gnid");
		String gnxqms = request.getParameter("needmiao");
		System.out.println("------功能id--"+gnid);
		System.out.println("-----功能需求描述---"+gnxqms);
		this.gongNengService.updateGnXqms(gnid, gnxqms);
		return this.queryAllProGNInfo(request, response);
	}
	
	
	/**
	 * 在“XmglXqmsBg.jsp”界面点击“删除所选择的功能”，
	 * 删除功能
	 * 需要从界面上截取到的值：
	 * hello---->功能id数组
	 * world---->复选框选择情况数组TRUE|FALSE
	 */
	public String deleteProGn(HttpServletRequest request,HttpServletResponse response){
		String[] gnids = request.getParameterValues("hello");
		String[] isdeltes = request.getParameterValues("world");
		for(int i = 0 ; i < gnids.length; i ++){
			System.out.println("功能id--------------"+gnids[i]);
			if(isdeltes[i].equals("yes")){
				this.gongNengService.deleteGnById(gnids[i]);
			}
		}
		return this.queryAllProGNInfo(request, response);
	}
	
	/**
	 * 在“xmglPrjShowAllGNInfo.jsp”点击"添加需求"
	 * 跳转到"addXmglPrjGnInfo.jsp"
	 * 
	 * 需要用到的值：
	 * XmglProjbList--------->所有的项目集合
	 * XmglPromkList--------->所有的模块集合{这个是在选择项目之后触发事件应用ajax获取到的}
	 * xmglProxqList--------->所有的需求集合{这个是在选择模块后触发事件应用ajax获取到的}
	 * 注：需求标识没有做，写死
	 * 首先执行第一步：
	 * 将所有项目的集合信息，传递到“jsps/addPrjShowAllGNInfo.jsp”
	 */
	public String getAllProjbs(HttpServletRequest request,HttpServletResponse response){
		 
		 List<XmglProjb> xmglProjbList=projbService.getAllProjb();
		request.setAttribute("xmglProjbList", xmglProjbList);
		return "/files/addXmglPrjGnInfo.jsp";
	}
	/**
	 * 执行第二步：
	 * 获取到项目后，将项目id传递到后台，查询到对应项目下的所有需求
	 * 需要从“addXmglPrjGnInfo.jsp”获取的值：
	 * pno----->项目id
	 * @throws IOException 
	 * */
	public void getAllProxqs(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=gbk");
		String pjid = request.getParameter("pno");
		 List<XmglProxq> xmglProxqList = proxqService.getAllProxqsByPjid(pjid);
		PrintWriter out = response.getWriter();
//		设置页面的字符集
		JSONArray json = JSONArray.fromObject(xmglProxqList);
		out.println(json);
		out.flush();
	}
	/**
	 * 执行第三步：
	 * 获取到需求id进行查找模块
	 * 需要从“addXmglPrjGnInfo.jsp”获取的值：
	 * xqno---->需求id
	 * @throws IOException 
	 * */
	public void getAllProMks(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=gbk");
		String xqid = request.getParameter("xqno");
		List<XmglPromk> xmglPromkList = promkService.getAllMkByXqId(xqid);
	
		PrintWriter out = response.getWriter();
		//设置页面的字符集
		JSONArray json = JSONArray.fromObject(xmglPromkList);
		for (XmglPromk xmglPromk:xmglPromkList) {
			System.out.println(xmglPromk.getPmName()+"------------------");
		}
		out.println(json);
		out.flush();
	}
	/**
	 * 执行第四不：
	 * 获取到要添加的值
	 * 需要从“addXmglPrjGnInfo.jsp”获取的值：
	 * prmkid------>模块id
	 * gname---->功能名称
	 * miao---->功能描述
	 * miss--->优先级 
	 * */
	public String addProGN(HttpServletRequest request,HttpServletResponse response){

		String prmkid = request.getParameter("prmkid");
		String gname = request.getParameter("gname");
		String miao = request.getParameter("miao");
		String miss = request.getParameter("miss");
		XmglProgn xmglProgn = new XmglProgn();
		xmglProgn.setPgName(gname);
		xmglProgn.setPgText(miao);
		xmglProgn.setGnyxj(miss);
		xmglProgn.setPmId(prmkid);
		gongNengService.addGn(xmglProgn);
		return this.queryAllProGNInfo(request, response);
	}
	/**编辑功能
	 * 功能名称===》gname
	 * 功能id====》gnid
	 * 功能描述===》miao
	 * 功能优先级===》miss
	 * */
	public String updateProGN(HttpServletRequest request,HttpServletResponse response){
		String gname = request.getParameter("gname");
		String miao = request.getParameter("miao");
		String miss = request.getParameter("miss");
		String gnid = request.getParameter("gnid");
		System.out.println("----------------");
		XmglProgn xmglProgn = new XmglProgn();
		xmglProgn.setPgName(gname);
		xmglProgn.setPgText(miao);
		xmglProgn.setGnyxj(miss);
		xmglProgn.setPgId(gnid);
		gongNengService.updateGn(xmglProgn);
		System.out.println("----------------"+gname+"------"+gnid);
		return this.queryAllProGNInfo(request, response);
	}
	
}
