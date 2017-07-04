package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import dao.DutyDao;

import po.XmglDuty;
import po.XmglRole;
import po.XmglUser;
import service.DutyService;
import service.RoleService;
import service.UserService;
import util.PageUtil;

public class UserServlet {
	private UserService service = new UserService();
	//查询一个用户的所有信息
	public String getOneUserInfo(HttpServletRequest req,HttpServletResponse resp){
		String uuid = req.getParameter("uuid");
		String caozuo = req.getParameter("caozuo");
		XmglUser user = null;
		if(uuid==null && caozuo.equals("cha")){//显示用户自己的信息 可以修改一些数据
			user = (XmglUser)req.getSession().getAttribute("user");
			String pname = "我就是公司老大";
			if(!user.getUpid().equals("0")){
				pname = this.service.getOneUser(user.getUpid()).getUname();
			}
			user.setPname(pname);
			return "/files/showOwnUser.jsp";
		}else{//显示任意一个用户的基本信息
			user = this.service.getOneUser(uuid);
			if(user!=null){
				String pname = "我就是公司老大";
				System.out.println("pid=============>"+user.getUpid()+"====>"+user.getUname());
				if(user.getUpid()!=null&&!user.getUpid().equals("0")){
					pname = this.service.getOneUser(user.getUpid()).getUname();
				}
				user.setPname(pname);
			}
			req.setAttribute("user", user);
			if(caozuo.equals("update")){//当添加新用户 或  管理员更改用户信息时
				return "/files/addUser.jsp";
			}else{//进行用户详细信息显示时将跳转的页面
				return "/files/showOtherUser.jsp";
			}		
		}
	}
	
	//更新自己的基本信息
	public String updateUser(HttpServletRequest request,HttpServletResponse response){
		  //取值
		  String uaddress=request.getParameter("paddr");//居住地址
		  String utelephone=request.getParameter("ptelephone");//联系电话
		  String uemail=request.getParameter("pemail");//email
		  String upassword=request.getParameter("ppassword");//密码,用于用户登入
		  String ubank=request.getParameter("pbankName"); //银行名称
		  String ubankAccount=request.getParameter("pbankuser");//银行账号
		  String udescrible=request.getParameter("pdescription");//描述
		  XmglUser user=(XmglUser)request.getSession().getAttribute("user");
		  user.setUpassword(upassword);
		  user.setUemail(uemail);
		  user.setUtelephone(utelephone);
		  user.setUaddress(uaddress);
		  user.setUbank(ubank);
		  user.setUbankAccount(ubankAccount);
		  user.setUdescrible(udescrible);
		  UserService service=new UserService();
		  service.update(user);
	      return "/files/success.jsp";
    }
	//获取所有用户信息 为发送消息页面提供所有用户姓名
	public String getAllUsers(HttpServletRequest req,HttpServletResponse resp){
		List<XmglUser> list = service.getAllUsers();
		req.setAttribute("list", list);
		return "/files/sendInformation.jsp";
	}
	//获取所有员工基本信息 进行显示   （实现分页查询显示）
	public String getPageUsers(HttpServletRequest req,HttpServletResponse resp){
		String curpage = req.getParameter("curpage");
		if(curpage==null || curpage==null){
			curpage = "1";
		}
		PageUtil util = this.service.getOnePage(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		return "/files/showAllUsers.jsp";
	}
	//获取角色表中所有信息 获取所有职位的所有信息  添加用户时 需要将所有角色名称和职位信息传到  addUser.jsp页面
	public String getRolesAndDuty(HttpServletRequest req,HttpServletResponse resp){
		String caozuo = req.getParameter("caozuo");
		RoleService service = new RoleService();
		List<XmglRole> rolelist = service.getAllRoles();
		DutyDao dao = new DutyDao();
		List<XmglDuty> dutylist = dao.queryAllDuty();
		req.setAttribute("rolelist", rolelist);
		req.setAttribute("dutylist", dutylist);
	    return this.getOneUserInfo(req, resp);
	}
	//添加用户信息
	public String addUser(HttpServletRequest request,HttpServletResponse resp){
		XmglUser user=new XmglUser();//人员
		String uuid=request.getParameter("pno");//员工唯一编号
		System.out.println(uuid);
		String uname=request.getParameter("pname");//名字
		String edid=request.getParameter("zwno");//职位edid
		String ustaffType=request.getParameter("plei");//员工类型
		String uIDcard=request.getParameter("pid");//身份证号
		String usex=request.getParameter("psex");
		String uage=request.getParameter("page");
		String ubirthday=request.getParameter("pbirthday");
		String uaddress=request.getParameter("paddr");
		String utelephone=request.getParameter("ptelephone");
		String uemail=request.getParameter("pemail");
		String upassword=request.getParameter("ppassword");
		String ubank=request.getParameter("pbankName");
		String ubankAccount=request.getParameter("pbankuser");
		String ubasePay=request.getParameter("pfsalary");//基本工资
		String ubonus=request.getParameter("pgsalary");//奖金
		String ubuzhujin=request.getParameter("posalary");//补助金
		String entryDate=request.getParameter("pbydate");
		String udescrible=request.getParameter("pdescription");
		String uroid=request.getParameter("ispower");//角色
		String upid=request.getParameter("sjld");
		user.setEdid(edid);
		user.setEntryDate(entryDate);
		user.setUaddress(uaddress);
		user.setUage(Long.parseLong(uage));
		user.setUbank(ubank);
		user.setUbankAccount(ubankAccount);
		user.setUbasePay(Long.parseLong(ubasePay));
		user.setUbirthday(ubirthday);
		user.setUbonus(Long.parseLong(ubonus));
		user.setUbuzhujin(Long.parseLong(ubuzhujin));
		user.setUdescrible(udescrible);
		user.setUemail(uemail);
		user.setuIDcard(uIDcard);
		user.setUname(uname);
		user.setUpassword(upassword);
		user.setUroid(uroid);
		user.setUsex(usex);
		user.setUstaffType(ustaffType);
		user.setUtelephone(utelephone);
		user.setUid(uuid);
		user.setUpid(upid);
		UserService service=new UserService();
		service.update(user);
		return this.getPageUsers(request, resp);
	}
	//判断该用户id在表中是否已经存在
	public void isExit(HttpServletRequest request,HttpServletResponse resp) throws IOException{
		String uid = request.getParameter("uid");
		XmglUser user = service.getOneUser(uid);
		resp.setContentType("html/text;charset=GBK");
		PrintWriter out = resp.getWriter();
		boolean result = true;
		if(user==null){
			result = false;
		}
		JSONArray json = JSONArray.fromObject(result);
		out.println(json.toString());
		out.flush();
	}
	//根据用户提供的信息 查出其父级id 并查找出职位id=父级id的所有人
	public void getPUser(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String did = req.getParameter("did");
		DutyDao dao = new DutyDao();
		String pid = dao.queryOneByDid(did).getDpid();
		List<XmglUser> list = service.getAllUserByEdid(pid);
		resp.setContentType("html/text;charset=GBK");
		PrintWriter out = resp.getWriter();
		JSONArray json = JSONArray.fromObject(list);
		out.println(json.toString());
		out.flush();
	}
	//删除用户信息
	public String deleteUser(HttpServletRequest req,HttpServletResponse resp){
		String[] uuids = req.getParameterValues("hello");
		String[] isdeletes = req.getParameterValues("world");
		for(int i=0;i<uuids.length;i++){
			if(isdeletes[i].equals("yes")){
				this.service.deleteUser(uuids[i]);
			}
		}
		return this.getPageUsers(req, resp);
	}
}
