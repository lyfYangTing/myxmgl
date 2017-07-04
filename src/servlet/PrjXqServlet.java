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
	 * �������Ŀ������Ϣ�鿴��������
	 * ��һ����ʾ�������ϵ�ʱ�������ݿ��ڵ���  prjXqServlet.do?op=queryAllProXqInfo
	 * ��ѯ���ݿ��е�xmgl_proxq���е�������Ŀ������Ϣ��������ʾ��xmglProXqInfo.jspҳ����ȥ��
	 * */
			
	public String queryAllProXqInfo(HttpServletRequest request,HttpServletResponse response){
		/*��ȡ��ǰҳ��ҳ�� */
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
	 * ������Ŀid��ѯ����������л�����Ϣ
	 * ���ҷ��ص�/jsps/xmglPrjXqOne.jspҳ�������ʾ
	 * 
	 * 
	 *caozuo = null----> 
	 *ǰ������������id�Ǵӽ����Ͻ��д��ݵ�xqid
	 * xmglProXqInfo.jspҳ���ϵ���༭�����ִ�б༭�����ܼ�������
	 * ����Ҫ��������id��ѯ����Ķ��󣬽������Լ������������ҵ�����ʾ��xmglPrjXqEditINfo.jsp����
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
	 * ������Ҫ�䶯��Ԫ���У�
	 * 1�����������Է����仯
	 * 2�������������Է����仯
	 * 3���������󣬸���ʱ��ᷢ���仯
	 * ���ĺ���ת�ص�����������"/jsps/xmglProXqInfo.jsp"
	 * */
	public String editXqInfo(HttpServletRequest request,HttpServletResponse response){
		//����id
		String xqid = request.getParameter("xqid");
		//��������
		String xqms = request.getParameter("neirong");
		System.out.println("��������=========================>"+xqms);
		//�������
		String xqtitle = request.getParameter("title");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String updateTime = sdf.format(date);
		System.out.println("�������ʱ��------"+updateTime);
		prjXqService.editXqInfo(updateTime, xqid, xqtitle, xqms);
		return this.queryAllProXqInfo(request, response);
	}
	
	
	/**
	 * �������
	 * ǰ���������ĸ���Ŀ�µ�����,����Ŀid			"proname"
	 * �����ݿ�����ӵ������У�
	 * ����id----->Ϊ��dao�ײ��Զ����ɵ�
	 * �������---->��xmglPrjXqAddInfo.jsp�����ϻ�ȡ�� "title"
	 * ��������---->��xmglPrjXqAddInfo.jsp�����ϻ�ȡ�� "ms"
	 * */
	
	public String addXQInfo(HttpServletRequest request,HttpServletResponse response){
		//�������
		String xqtitle = request.getParameter("title");
		//��������
		String xqms = request.getParameter("ms");
		//��Ŀid
		String prjid = request.getParameter("proname");
		//����ʱ��,����ʱ��
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		prjXqService.addXQInfo(xqtitle, xqms, prjid, time);
		return this.queryAllProXqInfo(request, response);
	}
	
	/**
	 * ��"/jsps/xmglProXqInfo.jsp"���������津����������������
	 * ��ȡ��������Ŀ,
	 * ���ص������Ŀ����
	 * xmglPrjXqAddInfo.jsp����
	 * */
	public String getAllPrjInfo(HttpServletRequest request,HttpServletResponse response){
		ProjbService prjbInfoService = new ProjbService();
		List<XmglProjb> listPrjb = prjbInfoService.getAllProjb();
		request.setAttribute("listPrjb", listPrjb);
		return "/files/xmglPrjXqAddInfo.jsp";
	}
	/**��"/jsps/xmglProXqInfo.jsp"���������津���������ɾ����ѡ����
	 * ɾ����ѡ����
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
