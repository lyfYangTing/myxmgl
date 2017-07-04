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
	//发送信息功能 向消息表中增加数据
	public String sendMessage(HttpServletRequest req,HttpServletResponse resp){
		XmglUser user = (XmglUser)req.getSession().getAttribute("user");
		//获取发件人（即登录用户id）
		String ifjr = user.getUid();
		//获取收件人
		String isjrs = req.getParameter("name");
		String[] isjr = isjrs.split(",");
		//获取标题
		String ititle = req.getParameter("biaoti");
		//获取消息内容
		String itext = req.getParameter("textarea");
		for(int i=0;i<isjr.length;i++){
			service.insertOneMessage(ititle, ifjr, isjr[i], itext);
		}
	    return this.showAllUserInform(req, resp);
	}
	//显示多条消息记录
	public String showAllUserInform(HttpServletRequest req,HttpServletResponse resp){
		String caozuo = req.getParameter("caozuo");
		//1.代表查询的是该用户的
		XmglUser user = (XmglUser)req.getSession().getAttribute("user");
		//获取发件人（即登录用户id）
		String uid = user.getUid();
		String curpage = req.getParameter("page");
		if(curpage==null || curpage.equals("")){
			curpage = "1";
		}
		System.out.println("caozuo类型是=============>"+caozuo);
		PageUtil util = service.getUserAllInfo(uid, Integer.parseInt(curpage),caozuo);
		List<Object> list = util.getList();
		for(Object obj : list){
		    XmglInfo xmglInfo = (XmglInfo)obj;
			//发件人fjrid
		    UserService userService = new UserService();
			XmglUser fjrUser = userService.getOneUser(xmglInfo.getIfjr());
			//收件人id sjr   
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
	//删除单条消息记录
	public String deleteOneInform(HttpServletRequest req,HttpServletResponse resp){
		String iid = req.getParameter("id");
		service.deleteInform(iid);
		return this.showAllUserInform(req, resp);
	}
	//获取单条消息记录的详细信息
	public String showOneInform(HttpServletRequest req,HttpServletResponse resp){
		String iid = req.getParameter("id");
		String caozuo = req.getParameter("caozuo");
		XmglInfo xmglInfo = service.getOneInfo(iid);
		if(caozuo.equals("sjr") && xmglInfo.getIctime()==null){
			this.service.updateSjrTime(iid);
		}
		UserService userService = new UserService();
		XmglUser fjrUser = userService.getOneUser(xmglInfo.getIfjr());
		//收件人id sjr   
		XmglUser sjrUser = userService.getOneUser(xmglInfo.getIsjr());
		xmglInfo.setIsjr(sjrUser.getUname());
		xmglInfo.setIfjr(fjrUser.getUname());
		req.setAttribute("info", xmglInfo);
		return "/files/showOneInform.jsp";
	}
	//删除多条记录
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
