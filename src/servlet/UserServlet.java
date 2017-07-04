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
	//��ѯһ���û���������Ϣ
	public String getOneUserInfo(HttpServletRequest req,HttpServletResponse resp){
		String uuid = req.getParameter("uuid");
		String caozuo = req.getParameter("caozuo");
		XmglUser user = null;
		if(uuid==null && caozuo.equals("cha")){//��ʾ�û��Լ�����Ϣ �����޸�һЩ����
			user = (XmglUser)req.getSession().getAttribute("user");
			String pname = "�Ҿ��ǹ�˾�ϴ�";
			if(!user.getUpid().equals("0")){
				pname = this.service.getOneUser(user.getUpid()).getUname();
			}
			user.setPname(pname);
			return "/files/showOwnUser.jsp";
		}else{//��ʾ����һ���û��Ļ�����Ϣ
			user = this.service.getOneUser(uuid);
			if(user!=null){
				String pname = "�Ҿ��ǹ�˾�ϴ�";
				System.out.println("pid=============>"+user.getUpid()+"====>"+user.getUname());
				if(user.getUpid()!=null&&!user.getUpid().equals("0")){
					pname = this.service.getOneUser(user.getUpid()).getUname();
				}
				user.setPname(pname);
			}
			req.setAttribute("user", user);
			if(caozuo.equals("update")){//��������û� ��  ����Ա�����û���Ϣʱ
				return "/files/addUser.jsp";
			}else{//�����û���ϸ��Ϣ��ʾʱ����ת��ҳ��
				return "/files/showOtherUser.jsp";
			}		
		}
	}
	
	//�����Լ��Ļ�����Ϣ
	public String updateUser(HttpServletRequest request,HttpServletResponse response){
		  //ȡֵ
		  String uaddress=request.getParameter("paddr");//��ס��ַ
		  String utelephone=request.getParameter("ptelephone");//��ϵ�绰
		  String uemail=request.getParameter("pemail");//email
		  String upassword=request.getParameter("ppassword");//����,�����û�����
		  String ubank=request.getParameter("pbankName"); //��������
		  String ubankAccount=request.getParameter("pbankuser");//�����˺�
		  String udescrible=request.getParameter("pdescription");//����
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
	//��ȡ�����û���Ϣ Ϊ������Ϣҳ���ṩ�����û�����
	public String getAllUsers(HttpServletRequest req,HttpServletResponse resp){
		List<XmglUser> list = service.getAllUsers();
		req.setAttribute("list", list);
		return "/files/sendInformation.jsp";
	}
	//��ȡ����Ա��������Ϣ ������ʾ   ��ʵ�ַ�ҳ��ѯ��ʾ��
	public String getPageUsers(HttpServletRequest req,HttpServletResponse resp){
		String curpage = req.getParameter("curpage");
		if(curpage==null || curpage==null){
			curpage = "1";
		}
		PageUtil util = this.service.getOnePage(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		return "/files/showAllUsers.jsp";
	}
	//��ȡ��ɫ����������Ϣ ��ȡ����ְλ��������Ϣ  ����û�ʱ ��Ҫ�����н�ɫ���ƺ�ְλ��Ϣ����  addUser.jspҳ��
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
	//����û���Ϣ
	public String addUser(HttpServletRequest request,HttpServletResponse resp){
		XmglUser user=new XmglUser();//��Ա
		String uuid=request.getParameter("pno");//Ա��Ψһ���
		System.out.println(uuid);
		String uname=request.getParameter("pname");//����
		String edid=request.getParameter("zwno");//ְλedid
		String ustaffType=request.getParameter("plei");//Ա������
		String uIDcard=request.getParameter("pid");//���֤��
		String usex=request.getParameter("psex");
		String uage=request.getParameter("page");
		String ubirthday=request.getParameter("pbirthday");
		String uaddress=request.getParameter("paddr");
		String utelephone=request.getParameter("ptelephone");
		String uemail=request.getParameter("pemail");
		String upassword=request.getParameter("ppassword");
		String ubank=request.getParameter("pbankName");
		String ubankAccount=request.getParameter("pbankuser");
		String ubasePay=request.getParameter("pfsalary");//��������
		String ubonus=request.getParameter("pgsalary");//����
		String ubuzhujin=request.getParameter("posalary");//������
		String entryDate=request.getParameter("pbydate");
		String udescrible=request.getParameter("pdescription");
		String uroid=request.getParameter("ispower");//��ɫ
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
	//�жϸ��û�id�ڱ����Ƿ��Ѿ�����
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
	//�����û��ṩ����Ϣ ����丸��id �����ҳ�ְλid=����id��������
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
	//ɾ���û���Ϣ
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
