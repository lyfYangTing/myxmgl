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
	
	//ȫ��ͨ�飬�Է�ҳ��ʽ������ʾ
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
	//����pjid�鵽���û�����ϸ��Ϣ������ʾ    �涨һ��caozuo�����жϲ��굥���������ĸ�ҳ����ת��showOneProjb.jsp��ʾ��Ŀ��ϸ��Ϣҳ�棩
	public String getOneProjb(HttpServletRequest req,HttpServletResponse resp){
		String caozuo = req.getParameter("caozuo");
		//caozuo=cha(��ת��showOneProjb.jspҳ��) caozuo=update or caozuo=insert ��ת�����£�������ҳ��
		String pjid = req.getParameter("pjid");
		String pjname = req.getParameter("proname");
		System.out.println("pjname===============>"+pjname);
		XmglProjb xmglProjb = null;
		//���������û�����ϸ��Ϣ
		if(pjname!=null && !pjname.equals("")){
			System.out.println("�����ͨ����Ŀ��������Ŀ�ķ�������");
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
	//����(�޸�)ҳ����Ҫ������  ��Ҫһ����Ŀ�����ˣ���Ŀ���������� ��Ҫѡ��ͻ���Ҫ�ͻ�����������Ϣ�� ����������л�ȡ������  �ͻ�  ��������
	public String getCustomerAndUsers(HttpServletRequest req,HttpServletResponse resp){
		//��ſͻ���������Ϣ
		CustomerService customer = new CustomerService();
		List<XmglCustomer> list1 = customer.getAllcustomers();
		req.setAttribute("listCustomer", list1);
		//�������        ְλ����Ŀ����edid=5 ���� ��ϵͳ�еĽ�ɫ�ǻ������uroid=3��������Ա����Ϣ
		UserService user = new UserService(); 
		List<XmglUser> list2 = user.getAllXmjl("5", "3");
		req.setAttribute("listXmglUser", list2);
		return this.getOneProjb(req, resp);
	}
	//������Ŀ������Ϣ
	public String updateProjb(HttpServletRequest req,HttpServletResponse resp){
		String prno = req.getParameter("prno");//��Ŀ���
		String proname = req.getParameter("proname");//��Ŀ����
		String clientno = req.getParameter("clientno");//�ͻ�cid
		String promoney = req.getParameter("promoney");//��Ŀ���
		String pronum = req.getParameter("pronum");//��������
		String proManager = req.getParameter("proManager");//��Ŀ����
		String proidcomplete =req.getParameter("proidcomplete");//��Ŀ״̬
		String prozmoney = req.getParameter("prozmoney");//ʵ���ܳɱ�
		String probeginDate = req.getParameter("probeginDate");//ʵ�ʿ�������
		String procompeteDate = req.getParameter("procompeteDate");//ʵ���������
		String promission = req.getParameter("promission");//���ȼ�
		String probeizhu = req.getParameter("probeizhu");//��ע
		this.service.updateOneProjb(prno, proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, probeginDate, procompeteDate, promission, probeizhu);
		return this.showOnePageProjb(req, resp);
	}
	//��ȡ��Ŀ���������������������   ��Ҫ��ѡ��Ŀ����
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
	//ɾ����Ŀ
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
	 * "jsps/xmglPrjAddInfo.jsp"ҳ���ϵ��"�����Ŀ"���ܣ����������Ŀ
	 * ��Ҫ��ӵ�xmgl_projb���е������У�
	 * ��Ŀ����---proname
	 * ��Ŀ���---promoney
	 * ��Ŀ����---proManager
	 * Ԥ���ܳɱ�---proyszmoney
	 * �ƻ��������---projhcompeteDate
	 * ������λ---clientno
	 * ��������---pronum
	 * ���״̬---proidcomplete
	 * �ƻ���������---projhbeginDate
	 * ���ȼ�---promission
	 * ��ע---probeizhu
	 * */
	public String insertPrjInfo(HttpServletRequest req,HttpServletResponse response){
		String proname = req.getParameter("proname");//��Ŀ����
		String clientno = req.getParameter("clientno");//�ͻ�cid
		String promoney = req.getParameter("promoney");//��Ŀ���
		String pronum = req.getParameter("pronum");//��������
		String proManager = req.getParameter("proManager");//��Ŀ����
		String proidcomplete =req.getParameter("proidcomplete");//��Ŀ״̬
		String prozmoney = req.getParameter("proyszmoney");//Ԥ���ܳɱ�
		String projhbeginDate = req.getParameter("projhbeginDate");//�ƻ���������
		String projhcompeteDate = req.getParameter("projhcompeteDate");//�ƻ��������
		String promission = req.getParameter("promission");//���ȼ�
		String probeizhu = req.getParameter("probeizhu");//��ע
		this.service.insertPrjInfo(proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, projhbeginDate, projhcompeteDate, promission, probeizhu);
		return this.showOnePageProjb(req, response);
	}
}
