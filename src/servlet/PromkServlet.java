package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import po.XmglProjb;
import po.XmglPromk;
import po.XmglProxq;

import service.ProjbService;
import service.PromkService;
import service.ProxqService;
import util.PageUtil;


public class PromkServlet {
	private PromkService service = new PromkService();
    /**
     *全表通查，以分页形式进行显示
     */
	public String showOnePagePromk(HttpServletRequest req,HttpServletResponse resp){
	    String curpage = req.getParameter("curpage");
	    if(curpage==null || curpage.equals("")){
	    	curpage="1";
	    }
	    PageUtil util = this.service.getOnePage(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		return "/files/showAllPromks.jsp";
	}
	/**
	 * 由pmid获取模块详细内容
	 */
	public String showOnePromk(HttpServletRequest req,HttpServletResponse resp){
		String caozuo = req.getParameter("caozuo");
		String pmid = req.getParameter("pmid");
		XmglPromk promk = this.service.getOnePromk(pmid);
		req.setAttribute("promk", promk);
		if(caozuo==null){
			return "/files/insertOnePromk.jsp";
		}else if(caozuo.equals("update")){
			return "/files/updateOnePromk.jsp";
		}else if(caozuo.equals("updatexq")){
			return "/files/updateMkxq.jsp";
		}else{
			return "/files/showOnePromk.jsp";
		}
	}
	/**
	 * 获取项目基本表中的所有内容
	 */
	public String getAllProjb(HttpServletRequest req,HttpServletResponse resp){ 
		ProjbService projb = new ProjbService();
		List<XmglProjb> list = projb.getAllProjb();
		req.setAttribute("list", list);
		return this.showOnePromk(req, resp);
	}
	
	/**
	 * 通过多选进行批量删除
	 */
	public String deleteProjb(HttpServletRequest request,HttpServletResponse response){
		String[] pmids = request.getParameterValues("hello");
		String[] isdeletes = request.getParameterValues("world");
		for(int i=0;i<pmids.length;i++){
			if(isdeletes[i].equals("yes")){
				this.service.deletePromk(pmids[i]);
			}
		}
		return this.showOnePagePromk(request, response);
	}
	/**
	 * ajax 通过项目id找出所有项目下的需求    
	 * @throws IOException 
	 */
	public void getAllxq(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String pjid = request.getParameter("pjid");
		ProxqService proxq = new ProxqService();
		List<XmglProxq> list = proxq.getAllProxqsByPjid(pjid);
		response.setContentType("html/text;charset=GBK");
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	/**
	 * 更新操作 更新需求
	 */
	public String updateProxq(HttpServletRequest request,HttpServletResponse response){
		String pmid = request.getParameter("pmid");//需求id
		String moname =request.getParameter("moname");//模块名字
		String mobiaozhi = request.getParameter("mobiaozhi");//模块标识
		String prono = request.getParameter("prono");//所属项目
		String nno =request.getParameter("nno");//所属需求
		String modmission = request.getParameter("modmission");//优先级
		String moddescription = request.getParameter("moddescription");//模块描述
		String modneedDescription = request.getParameter("modneedDescription");//需求描述
		XmglPromk promk = this.service.getOnePromk(pmid);
		if(promk==null){//执行新增
			System.out.println("============>执行新增操作了吗");
			this.service.insertPromk(moname,mobiaozhi,prono,nno,modmission,moddescription,modneedDescription);
		}else{//执行更新操作
			this.service.updatePromk(pmid,moname,mobiaozhi,prono,nno,modmission,moddescription,modneedDescription);
		}
		return this.showOnePagePromk(request, response);
	}
	/**
	 * 单独更新需求描述
	 */
	public String updateProxqms(HttpServletRequest request,HttpServletResponse response){
		String pmid = request.getParameter("pmid");
		System.out.println("是pmid============>"+pmid);
		String modneedDescription = request.getParameter("modneedDescription");
		this.service.updateProxq(pmid, modneedDescription);
		return this.showOnePagePromk(request, response);
	}
}
