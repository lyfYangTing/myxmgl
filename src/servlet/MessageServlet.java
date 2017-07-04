package servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglInfo;
import po.XmglUser;
import service.MessageService;
import service.UserService;
import util.PageUtil;

public class MessageServlet {
	private MessageService service = new MessageService();
	//������Ϣ���� ����Ϣ������������
	public String sendMessage(HttpServletRequest req,HttpServletResponse resp){
		XmglUser user = (XmglUser)req.getSession().getAttribute("user");
		//��ȡ�����ˣ�����¼�û�id��
		String ifjr = user.getUid();
		//��ȡ�ռ���
		String isjrs = req.getParameter("name");
		String[] isjr = isjrs.split(",");
		//��ȡ����
		String ititle = req.getParameter("biaoti");
		//��ȡ��Ϣ����
		String itext = req.getParameter("textarea");
		for(int i=0;i<isjr.length;i++){
			service.insertOneMessage(ititle, ifjr, isjr[i], itext);
		}
	    return this.showAllUserInform(req, resp);
	}
	//��ʾ������Ϣ��¼
	public String showAllUserInform(HttpServletRequest req,HttpServletResponse resp){
		String caozuo = req.getParameter("caozuo");
		//1.�����ѯ���Ǹ��û���
		XmglUser user = (XmglUser)req.getSession().getAttribute("user");
		//��ȡ�����ˣ�����¼�û�id��
		String uid = user.getUid();
		String curpage = req.getParameter("page");
		if(curpage==null || curpage.equals("")){
			curpage = "1";
		}
		System.out.println("caozuo������=============>"+caozuo);
		PageUtil util = service.getUserAllInfo(uid, Integer.parseInt(curpage),caozuo);
		List<Object> list = util.getList();
		for(Object obj : list){
		    XmglInfo xmglInfo = (XmglInfo)obj;
			//������fjrid
		    UserService userService = new UserService();
			XmglUser fjrUser = userService.getOneUser(xmglInfo.getIfjr());
			//�ռ���id sjr   
			XmglUser sjrUser = userService.getOneUser(xmglInfo.getIsjr());
			xmglInfo.setIsjr(sjrUser.getUname());
			xmglInfo.setIfjr(fjrUser.getUname());
		}
		req.setAttribute("util", util);
		req.setAttribute("curpage", curpage);
		if(caozuo.equals("fjr")){
			return "/files/showFjrInform.jsp";
		}else if(caozuo.equals("sfjr")){
			return "/files/showAllInform.jsp";
		}else{
			return "/files/showSjrInform.jsp";
		}
		
	}
	//ɾ��������Ϣ��¼
	public String deleteOneInform(HttpServletRequest req,HttpServletResponse resp){
		String iid = req.getParameter("id");
		service.deleteInform(iid);
		return this.showAllUserInform(req, resp);
	}
	//��ȡ������Ϣ��¼����ϸ��Ϣ
	public String showOneInform(HttpServletRequest req,HttpServletResponse resp){
		String iid = req.getParameter("id");
		String caozuo = req.getParameter("caozuo");
		XmglInfo xmglInfo = service.getOneInfo(iid);
		if(caozuo.equals("sjr") && xmglInfo.getIctime()==null){
			this.service.updateSjrTime(iid);
		}
		UserService userService = new UserService();
		XmglUser fjrUser = userService.getOneUser(xmglInfo.getIfjr());
		//�ռ���id sjr   
		XmglUser sjrUser = userService.getOneUser(xmglInfo.getIsjr());
		xmglInfo.setIsjr(sjrUser.getUname());
		xmglInfo.setIfjr(fjrUser.getUname());
		req.setAttribute("info", xmglInfo);
		return "/files/showOneInform.jsp";
	}
	//ɾ��������¼
	public String deleteSomeInform(HttpServletRequest req,HttpServletResponse resp){
		String[] iids = req.getParameterValues("hello");
		String[] isDelete = req.getParameterValues("world");
		for(int i=0;i<iids.length;i++){
			if(isDelete[i].equals("yes")){
				service.deleteInform(iids[i]);
			}
		}
		return this.showAllUserInform(req, resp);
	}
	
}
