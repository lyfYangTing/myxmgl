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
     *ȫ��ͨ�飬�Է�ҳ��ʽ������ʾ
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
	 * ͨ����ѡ��������ɾ��
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
	 * ��������֮ǰ��Ҫ�����е���Ŀ �� ������������
	 */
	public String getAllProjbAndRwlx(HttpServletRequest request,HttpServletResponse response){
		//��ȡ���е���Ŀ     ������ҳ��������Ŀѡ�������б�����ʾ
		ProjbService pjService = new ProjbService();
		List<XmglProjb> list1 = pjService.getAllProjb();
		//��ȡ��������  ������ҳ��������������ѡ�������б�����ʾ
		RwlxService rwlx = new RwlxService();
		List<XmglRwlx> list2 = rwlx.getAllRwlx();
		request.setAttribute("pjlist", list1);
		request.setAttribute("rwlxlist", list2);
		return "/files/insertOneProjh.jsp";
	}
	/**
	 * �ڽ������ҳ��֮ǰ 1.��Ҫ��ȡ���������б�   2.��Ҫ������Ŀid��ȡִ�����б�   3.�����������id(pgid)��ȡǰ������
	 */
	public String getAllRwlxAndZxr(HttpServletRequest request,HttpServletResponse response){
		String pjid = request.getParameter("pjid");
		//��ȡ������Ŀid��ȡִ�����б� 1.���Ȼ�ȡ��Ŀ������Ϣ���󣬵õ���Ŀ������ 2.���ݾ����Ż�ȡ�����µ��ˣ������и���idΪ��Ŀ�����uid��������
		ProjbService pj =new ProjbService();
		UserService user = new UserService();
		List<XmglUser> list1 = user.getAllUserByPid(pj.getOneProjb(pjid).getPjUid());
		//��ȡ���������б�
		RwlxService rwlx = new RwlxService();
		List<XmglRwlx> list2 = rwlx.getAllRwlx();
		request.setAttribute("zxrlist", list1);
		request.setAttribute("rwlxlist", list2);
		return this.getOneProjh(request, response);
	}
	/**
	 * �鿴�ƻ�����ϸ����   1.���ڲ�ѯһ���ƻ�����ϸ��Ϣ ��Ҫ���ݼƻ�id(ppid)����üƻ�����ϸ��Ϣ���������󴫵�ҳ��
	 *              2.���ڸ���ǰ��ȡ�üƻ���������Ϣ  ���ݼƻ�id(ppid)����üƻ�����ϸ��Ϣ���������󴫵�ҳ��
	 *              3.���ݸ��������ĸ������� ���ݹ���id(pgid)��ȡǰ�������б�
	 */
	public String getOneProjh(HttpServletRequest request,HttpServletResponse response){
		String ppid = request.getParameter("ppid");
		String caozuo = request.getParameter("caozuo");
		XmglProplan plan = service.getOneProjh(ppid);
		//ǰ���������
		XmglProplan qzPlan = service.getOneProjh(plan.getPpQzId());
		plan.setQzPlan(qzPlan);
		request.setAttribute("xmglProplan", plan);
		if(caozuo.equals("cha")){//����������ϸ��Ϣ��ʾҳ��
			return "/files/showOneProjh.jsp";
		}else if(caozuo.equals("rwlb")){//��ʾ����������ϸ��Ϣ
			return "/files/showOneRwlb.jsp";
		}else{//�Ȼ�ȡ ���������ĸ������� ���ݹ���id(pgid)��ȡǰ�������б�
			List<XmglProplan> list = service.getAllProjhByPgid(plan.getPgId());
			System.out.println("�ù�����û��ǰ��������================��"+list.size());
			request.setAttribute("qzrwlist", list);
			return "/files/updateOneProjh.jsp";
		}
	}
	/**
	 * ajax ��һ������ ѡ����Ŀ���ȡ�����е�����  ��GongNengServlet�л�ȡ   
	 * �÷����� ��ȡ��Ŀ�е���Ŀ���� ����ȡ����Ŀ�����  ����
	 * @throws IOException 
	 */
	public void getAllProzxr(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("html/text;charset=GBK");
		String pjid = request.getParameter("pjid");
		ProjbService pj =new ProjbService();
		UserService user = new UserService();
		List<XmglUser> list1 = user.getAllUserByPid(pj.getOneProjb(pjid).getPjUid());
		System.out.println("��������");
		JSONArray json = JSONArray.fromObject(list1);
		PrintWriter out = response.getWriter();
		//�������ã��������в���Ҫ������ֵȫ�����˵�
		/*
		JsonConfig con = new JsonConfig();
		con.setExcludes(new String[]{"",""});
		JSONObject json = new JSONObject().fromObject(pu,con);
		*/
        out.println(json.toString());
		out.flush();
	}
	/**
	 * �ڶ�����������������ѡģ�飺��ȡģ�� ͨ��GongNengServlet�еķ������Ի�ȡ
	 * ����������������ģ��ѡ���ܣ���ȡ����
	 * @throws IOException 
	 */
	public void getAllProgn(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("html/text;charset=GBK");
		//��ȡģ��id
		String pmid = request.getParameter("pmid");
		//����ģ��id��������µ����й���
		GongNengService progn = new GongNengService();
		List<XmglProgn> list = progn.getGnByPmid(pmid);
		//д��ҳ��
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	/**
	 * ���Ĵ�������������ѡ���ܣ���ȡ�����µ���������
	 */
	public void getAllProjh(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("html/text;charset=GBK");
		//��ȡģ��id
		String pgid = request.getParameter("pgid");
		//����ģ��id��������µ����й���
		List<XmglProplan> list = service.getAllProjhByPgid(pgid);
		//д��ҳ��
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	/**
	 * ��������
	 */
	public String insertProjh(HttpServletRequest request,HttpServletResponse response){
		//ȡֵ
		String ppName=request.getParameter("jtitle");//�ƻ�����
		String ppQzId=request.getParameter("qzrw");//ǰ������
		String ppStartTime=request.getParameter("jrbegindate");//�ƻ���ʼʱ��
		String ppEndTime=request.getParameter("jrenddate");//�ƻ�����ʱ��
		String ppZxr=request.getParameter("jbyper");//����ִ����
		String ppYxj=request.getParameter("jmission");//���ȼ�
		String rwId=request.getParameter("jleixing");//��������
		String ppState=request.getParameter("iscomplete");//״̬
		String pgId=request.getParameter("gongneng");//����id
		String ppBeizhu=request.getParameter("jbeizhu");//��ע
		this.service.insert(ppName,ppQzId,ppStartTime,ppEndTime,ppZxr,ppYxj,rwId,ppState,pgId,ppBeizhu);
		return this.showOnePageProjh(request, response);
	}
	/**
	 * �ƻ�����£�ʵ�ֱ༭����
	 */
	public String updateProjh(HttpServletRequest request,HttpServletResponse response){
		String ppid = request.getParameter("ppid"); 
		String ppName=request.getParameter("jtitle");//�ƻ�����
		String ppQzId=request.getParameter("qzid");//ǰ������
		String ppsjStartTime=request.getParameter("jrbegindate");//ʵ�ʿ�ʼ��ʼʱ��
		String ppsjEndTime=request.getParameter("jrenddate");//ʵ�ʽ���ʱ��
		String ppZxr=request.getParameter("jbyper");//����ִ����
		String ppYxj=request.getParameter("jmission");//���ȼ�
		String rwId=request.getParameter("jleixing");//��������
		String ppState=request.getParameter("iscomplete");//״̬
		String ppshState = request.getParameter("isok");//���״̬
		String ppBeizhu=request.getParameter("jbeizhu");//��ע
		this.service.updateOneProjh(ppid, rwId, ppQzId, ppName, ppsjStartTime, ppsjEndTime, ppState, ppQzId, ppshState, ppBeizhu);
		return this.showOnePageProjh(request, response);
	}
	/**
	 * �������ܣ����±�������
	 */
	public String faJiHua(HttpServletRequest request,HttpServletResponse response){
		String pjid = request.getParameter("pjid");
		String ppRwfpr = ((XmglUser)request.getSession().getAttribute("user")).getUid();
		this.service.updateFrw(pjid,ppRwfpr);
		return this.showOnePageProjh(request, response);
	}
	/**
	 * �鿴����������Ϣ
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
