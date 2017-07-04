package servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglDuty;

import service.DutyService;
import util.PageUtil;

public class DutyServlet {
	private DutyService service = new DutyService();
	//ʵ�ַ�ҳ��ѯ��ʾ
	public String showOnePageDuty(HttpServletRequest req,HttpServletResponse resp){
		String curpage = req.getParameter("curpage");
		if(curpage==null || curpage.equals("")){
			curpage="1";
		}
	    PageUtil util = this.service.getOnePageDuty(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		return "/files/showAllDuty.jsp";
	}
	//���� �� ��������
	public String updateDuty(HttpServletRequest req,HttpServletResponse resp){
		String did = req.getParameter("did");
		String dname = req.getParameter("dname");
		String dtext = req.getParameter("dtext");
		String dpid = req.getParameter("dpid");
		System.out.println("����Servlet����==========="+did+"===>"+dname+"==>"+dtext+"==>"+dpid);
		this.service.updateDuty(did, dname, dtext, dpid);
		return this.showOnePageDuty(req, resp);
	}
	//ɾ���û�����
	public String deleteDuty(HttpServletRequest req,HttpServletResponse resp){
		String[] dids = req.getParameterValues("hello");
		String[] isdelete = req.getParameterValues("world");
		for(int i=0;i<dids.length;i++){
			if(isdelete[i].equals("yes")){
				this.service.deleteDuty(dids[i]);
			}
		}
		return this.showOnePageDuty(req, resp);
	}
	//��ѯ��������
	public String getOneDuty(HttpServletRequest req,HttpServletResponse resp){
		String did = req.getParameter("did");
		String caozuo = req.getParameter("caozuo");
		if(did!=null){
			XmglDuty duty = this.service.getOneDuty(did);
			String dpname = "���ְλ��";
			if(!duty.getDpid().equals("0")){
				dpname = this.service.getOneDuty(duty.getDpid()).getDname();
			}
			duty.setDpname(dpname);
			req.setAttribute("duty", duty);
		}
		if(caozuo.equals("cha")){
			return "/files/showOneDuty.jsp";
		}else{
			return "/files/updateDuty.jsp";
		}
	}
	//��ȡ����ְλ���е���Ϣ �ɴ˻�ȡҪ���µ��û���Ϣ���õ�������ְλ�б�
	public String getAllDuty(HttpServletRequest req,HttpServletResponse resp){
		List<XmglDuty> list = this.service.getAllDuty();
		req.setAttribute("list", list);
		return this.getOneDuty(req, resp);
	}
}
