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
	
	
	//�ײ�service���� GongNengService
	
	private GongNengService gongNengService = new GongNengService();
	private ProjbService projbService = new ProjbService();
	private ProxqService proxqService = new ProxqService();
	private PromkService promkService = new PromkService();
	/**
	 * �������Ŀ������Ϣ�鿴������
	 * ��һ����ʾ��������ʱ�������ݿ��ڵ���
	 * ��ѯ���ݿ��е�xmgl_progn���е���������
	 * ���з�ҳ��ʾ
	 * ���ݿ��ڵ���ת��ʽ��gongNengServlet.do?����=queryAllProGNInfo
	 * ��ѯ�����ת���棺files/xmglPrjShowAllGNInfo.jsp����
	 * */
	
	public String queryAllProGNInfo(HttpServletRequest request,HttpServletResponse response){
		//��ȡ��ǰҳ��ҳ��ֵ
		String curpage = request.getParameter("curpage");
		if(curpage == null){
			curpage = "1";
		}
		PageUtil util = gongNengService.getProngnPageInfo(Integer.parseInt(curpage));
		request.setAttribute("util",util);
		return "/files/xmglPrjShowAllGNInfo.jsp";
	}
	/**
	 * �ڡ�xmglPrjShowAllGNInfo.jsp�����"�鿴",��ȡ��
	 * ��Ӧ�Ĺ���id����ѯ��ù���id��ص�������Ϣ�����ع��ܶ���
	 * ��ת�ص�"/jsps/showGnOne.jsp"���������ʾ
	 * 
	 * �ڡ�xmglPrjShowAllGNInfo.jsp�����"�������",��ȡ��
	 * gnid��ת����XmglXqmsBg.jsp�����棬���б������
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
	 * �ڡ�XmglXqmsBg.jsp�������������桱�����湦�����������ĸ���
	 * ��Ҫ�ӽ����Ͻ�ȡ����ֵ��
	 * gnid
	 * needmiao
	 * */
	public String  updateXqms(HttpServletRequest request,HttpServletResponse response){
		String gnid = request.getParameter("gnid");
		String gnxqms = request.getParameter("needmiao");
		System.out.println("------����id--"+gnid);
		System.out.println("-----������������---"+gnxqms);
		this.gongNengService.updateGnXqms(gnid, gnxqms);
		return this.queryAllProGNInfo(request, response);
	}
	
	
	/**
	 * �ڡ�XmglXqmsBg.jsp����������ɾ����ѡ��Ĺ��ܡ���
	 * ɾ������
	 * ��Ҫ�ӽ����Ͻ�ȡ����ֵ��
	 * hello---->����id����
	 * world---->��ѡ��ѡ���������TRUE|FALSE
	 */
	public String deleteProGn(HttpServletRequest request,HttpServletResponse response){
		String[] gnids = request.getParameterValues("hello");
		String[] isdeltes = request.getParameterValues("world");
		for(int i = 0 ; i < gnids.length; i ++){
			System.out.println("����id--------------"+gnids[i]);
			if(isdeltes[i].equals("yes")){
				this.gongNengService.deleteGnById(gnids[i]);
			}
		}
		return this.queryAllProGNInfo(request, response);
	}
	
	/**
	 * �ڡ�xmglPrjShowAllGNInfo.jsp�����"�������"
	 * ��ת��"addXmglPrjGnInfo.jsp"
	 * 
	 * ��Ҫ�õ���ֵ��
	 * XmglProjbList--------->���е���Ŀ����
	 * XmglPromkList--------->���е�ģ�鼯��{�������ѡ����Ŀ֮�󴥷��¼�Ӧ��ajax��ȡ����}
	 * xmglProxqList--------->���е����󼯺�{�������ѡ��ģ��󴥷��¼�Ӧ��ajax��ȡ����}
	 * ע�������ʶû������д��
	 * ����ִ�е�һ����
	 * ��������Ŀ�ļ�����Ϣ�����ݵ���jsps/addPrjShowAllGNInfo.jsp��
	 */
	public String getAllProjbs(HttpServletRequest request,HttpServletResponse response){
		 
		 List<XmglProjb> xmglProjbList=projbService.getAllProjb();
		request.setAttribute("xmglProjbList", xmglProjbList);
		return "/files/addXmglPrjGnInfo.jsp";
	}
	/**
	 * ִ�еڶ�����
	 * ��ȡ����Ŀ�󣬽���Ŀid���ݵ���̨����ѯ����Ӧ��Ŀ�µ���������
	 * ��Ҫ�ӡ�addXmglPrjGnInfo.jsp����ȡ��ֵ��
	 * pno----->��Ŀid
	 * @throws IOException 
	 * */
	public void getAllProxqs(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=gbk");
		String pjid = request.getParameter("pno");
		 List<XmglProxq> xmglProxqList = proxqService.getAllProxqsByPjid(pjid);
		PrintWriter out = response.getWriter();
//		����ҳ����ַ���
		JSONArray json = JSONArray.fromObject(xmglProxqList);
		out.println(json);
		out.flush();
	}
	/**
	 * ִ�е�������
	 * ��ȡ������id���в���ģ��
	 * ��Ҫ�ӡ�addXmglPrjGnInfo.jsp����ȡ��ֵ��
	 * xqno---->����id
	 * @throws IOException 
	 * */
	public void getAllProMks(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=gbk");
		String xqid = request.getParameter("xqno");
		List<XmglPromk> xmglPromkList = promkService.getAllMkByXqId(xqid);
	
		PrintWriter out = response.getWriter();
		//����ҳ����ַ���
		JSONArray json = JSONArray.fromObject(xmglPromkList);
		for (XmglPromk xmglPromk:xmglPromkList) {
			System.out.println(xmglPromk.getPmName()+"------------------");
		}
		out.println(json);
		out.flush();
	}
	/**
	 * ִ�е��Ĳ���
	 * ��ȡ��Ҫ��ӵ�ֵ
	 * ��Ҫ�ӡ�addXmglPrjGnInfo.jsp����ȡ��ֵ��
	 * prmkid------>ģ��id
	 * gname---->��������
	 * miao---->��������
	 * miss--->���ȼ� 
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
	/**�༭����
	 * ��������===��gname
	 * ����id====��gnid
	 * ��������===��miao
	 * �������ȼ�===��miss
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
