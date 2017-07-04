package servlet;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglGz;
import service.GzService;
import util.PageUtil;

public class GzServlet {
	
	private GzService gzService  = new GzService();
	
	public String queryAllGz(HttpServletRequest request ,HttpServletResponse response){
		String page = request.getParameter("page");
		if(page ==null || page.equals("")){
			page = "1";
		}
		PageUtil  util = (PageUtil)gzService.queryAllGz(Integer.parseInt(page));
		System.out.println("-------------------"+util.getList().size());
		request.setAttribute("util",util);
		return "/files/salMessage.jsp";
	}
	
	
	//查看工资
	public  String loadGz(HttpServletRequest request ,HttpServletResponse response){
		String gid = request.getParameter("gid");
		XmglGz  xmglGz = gzService.loadGz(gid);
		System.out.println(xmglGz);
		request.setAttribute("xmglGz", xmglGz);
		return "/files/chakanSal.jsp";
	}
	
	
	//按年月查询工资
	public String load(HttpServletRequest request ,HttpServletResponse response){
		String year = request.getParameter("nianfen");
		String month = request.getParameter("yuefen");
		List<XmglGz> list = gzService.load(year, month);
		request.setAttribute("list",list);
		return "/files/tiaojianSalMessage.jsp";
	}
	
	//发送工资
	public  String sendGz(HttpServletRequest request ,HttpServletResponse response){
		String gid = request.getParameter("gid");
		XmglGz  xmglGz = gzService.loadGz(gid);
		System.out.println(xmglGz);
		request.setAttribute("xmglGz", xmglGz);
		return "/files/sendSal.jsp";
	}
	
	
	//确认发送
	public String updateSal(HttpServletRequest request ,HttpServletResponse response){
		String gid = request.getParameter("gid");
		String sumSal = request.getParameter("sumSal");
		Date date = new Date();
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dates = sdf.format(date); 
		XmglGz xmglGz = new XmglGz();
		xmglGz.setGrantTime(dates);
		xmglGz.setState("已发放");
		xmglGz.setSumSal(Long.parseLong(sumSal));
		System.out.println(gid);
		gzService.update(xmglGz, gid);
		return this.queryAllGz(request, response);
	}
	
	public String renyuanSendGz(HttpServletRequest request,HttpServletResponse response){
		String  gotherAward = request.getParameter("posalary");
		String  gdescrible  = request.getParameter("sdescription");
		String  ubonus = request.getParameter("pgsalary");
		String gkouChu = request.getParameter("skou");
		String  year = request.getParameter("year");
		String  month = request.getParameter("month");
		String  uid = request.getParameter("pid");
		
		Date date = new Date();
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dates = sdf.format(date); 
		System.out.println(uid);
		XmglGz xmglGz = new XmglGz();
		xmglGz.setUid(uid);
		xmglGz.setGotherAward(Integer.parseInt(gotherAward));
		xmglGz.setGdescrible(gdescrible);
		xmglGz.setUbonus(Integer.parseInt(ubonus));
		xmglGz.setMonth(month);
		xmglGz.setYear(year);
		xmglGz.setCreateTime(dates);
		xmglGz.setGkouChu(Integer.parseInt(gkouChu));
		gzService.insert(xmglGz);
		return this.queryAllGz(request, response) ;
	}
}
