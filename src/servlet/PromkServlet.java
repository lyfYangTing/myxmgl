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
     *ȫ��ͨ�飬�Է�ҳ��ʽ������ʾ
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
	 * ��pmid��ȡģ����ϸ����
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
	 * ��ȡ��Ŀ�������е���������
	 */
	public String getAllProjb(HttpServletRequest req,HttpServletResponse resp){ 
		ProjbService projb = new ProjbService();
		List<XmglProjb> list = projb.getAllProjb();
		req.setAttribute("list", list);
		return this.showOnePromk(req, resp);
	}
	
	/**
	 * ͨ����ѡ��������ɾ��
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
	 * ajax ͨ����Ŀid�ҳ�������Ŀ�µ�����    
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
	 * ���²��� ��������
	 */
	public String updateProxq(HttpServletRequest request,HttpServletResponse response){
		String pmid = request.getParameter("pmid");//����id
		String moname =request.getParameter("moname");//ģ������
		String mobiaozhi = request.getParameter("mobiaozhi");//ģ���ʶ
		String prono = request.getParameter("prono");//������Ŀ
		String nno =request.getParameter("nno");//��������
		String modmission = request.getParameter("modmission");//���ȼ�
		String moddescription = request.getParameter("moddescription");//ģ������
		String modneedDescription = request.getParameter("modneedDescription");//��������
		XmglPromk promk = this.service.getOnePromk(pmid);
		if(promk==null){//ִ������
			System.out.println("============>ִ��������������");
			this.service.insertPromk(moname,mobiaozhi,prono,nno,modmission,moddescription,modneedDescription);
		}else{//ִ�и��²���
			this.service.updatePromk(pmid,moname,mobiaozhi,prono,nno,modmission,moddescription,modneedDescription);
		}
		return this.showOnePagePromk(request, response);
	}
	/**
	 * ����������������
	 */
	public String updateProxqms(HttpServletRequest request,HttpServletResponse response){
		String pmid = request.getParameter("pmid");
		System.out.println("��pmid============>"+pmid);
		String modneedDescription = request.getParameter("modneedDescription");
		this.service.updateProxq(pmid, modneedDescription);
		return this.showOnePagePromk(request, response);
	}
}
