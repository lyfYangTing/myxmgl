package servlet;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglProjb;
import po.XmglProxq;
import service.ProjbService;
import service.ProxqService;
import util.PageUtil;

public class PrjXqServlet {
	
	private ProxqService prjXqService = new ProxqService();
	/**
	 * 点击“项目基本信息查看”触发；
	 * 第一次显示到界面上的时，在数据库内调用  prjXqServlet.do?op=queryAllProXqInfo
	 * 查询数据库中的xmgl_proxq表中的所有项目基本信息，并且显示到xmglProXqInfo.jsp页面上去。
	 * */
			
	public String queryAllProXqInfo(HttpServletRequest request,HttpServletResponse response){
		/*获取当前页面页码 */
		String curpage = request.getParameter("curpage");
		System.out.println("curpage----------->"+curpage);
		if(curpage==null){
			curpage = "1";
		}
		PageUtil util = prjXqService.getPageProXqInfo(Integer.parseInt(curpage));
		request.setAttribute("util", util);
		return "/files/xmglProXqInfo.jsp";
	}
	/**caozuo!=null---->
	 * 根据项目id查询到需求的所有基本信息
	 * 并且返回到/jsps/xmglPrjXqOne.jsp页面进行显示
	 * 
	 * 
	 *caozuo = null----> 
	 *前置条件：需求id是从界面上进行传递的xqid
	 * xmglProXqInfo.jsp页面上点击编辑组件，执行编辑需求功能及需求变更
	 * 首先要根据需求id查询需求的对象，将标题以及需求描述查找到，显示到xmglPrjXqEditINfo.jsp界面
	 * */
	public String getPrJbById(HttpServletRequest request,HttpServletResponse response){
		String xqId = request.getParameter("xqid");
		XmglProxq xmglProxq = prjXqService.getPrXqById(xqId);
		request.setAttribute("xmglProxq", xmglProxq);
		String caozuo  = request.getParameter("caozuo");
		if(caozuo!=null){
			return "/files/xmglPrjXqOne.jsp";			
		}else{
			return "/files/xmglPrjXqEditINfo.jsp";
		}
	}
	/**
	 * 需求变更要变动的元素有：
	 * 1，需求标题可以发生变化
	 * 2，需求描述可以发生变化
	 * 3，点击保存后，更改时间会发生变化
	 * 更改后跳转回到需求主界面"/jsps/xmglProXqInfo.jsp"
	 * */
	public String editXqInfo(HttpServletRequest request,HttpServletResponse response){
		//需求id
		String xqid = request.getParameter("xqid");
		//需求描述
		String xqms = request.getParameter("neirong");
		System.out.println("有内容吗？=========================>"+xqms);
		//需求标题
		String xqtitle = request.getParameter("title");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String updateTime = sdf.format(date);
		System.out.println("需求更改时间------"+updateTime);
		prjXqService.editXqInfo(updateTime, xqid, xqtitle, xqms);
		return this.queryAllProXqInfo(request, response);
	}
	
	
	/**
	 * 添加需求
	 * 前置条件：哪个项目下的需求,即项目id			"proname"
	 * 向数据库内添加的内容有：
	 * 需求id----->为在dao底层自动生成的
	 * 需求标题---->从xmglPrjXqAddInfo.jsp界面上获取到 "title"
	 * 需求描述---->从xmglPrjXqAddInfo.jsp界面上获取到 "ms"
	 * */
	
	public String addXQInfo(HttpServletRequest request,HttpServletResponse response){
		//需求标题
		String xqtitle = request.getParameter("title");
		//需求描述
		String xqms = request.getParameter("ms");
		//项目id
		String prjid = request.getParameter("proname");
		//创建时间,更改时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		prjXqService.addXQInfo(xqtitle, xqms, prjid, time);
		return this.queryAllProXqInfo(request, response);
	}
	
	/**
	 * 在"/jsps/xmglProXqInfo.jsp"需求主界面触发，点击“添加需求”
	 * 获取到所有项目,
	 * 返回到添加项目界面
	 * xmglPrjXqAddInfo.jsp界面
	 * */
	public String getAllPrjInfo(HttpServletRequest request,HttpServletResponse response){
		ProjbService prjbInfoService = new ProjbService();
		List<XmglProjb> listPrjb = prjbInfoService.getAllProjb();
		request.setAttribute("listPrjb", listPrjb);
		return "/files/xmglPrjXqAddInfo.jsp";
	}
	/**在"/jsps/xmglProXqInfo.jsp"需求主界面触发，点击“删除所选需求”
	 * 删除所选需求
	 * */
	public String deleteProjb(HttpServletRequest request,HttpServletResponse response){
		String[] xqids = request.getParameterValues("hello");
		String[] isdeletes = request.getParameterValues("world");
		for(int i=0;i<xqids.length;i++){
			if(isdeletes[i].equals("yes")){
				this.prjXqService.deleteProjb(xqids[i]);
			}
		}
		return this.queryAllProXqInfo(request, response);
	 }
}
