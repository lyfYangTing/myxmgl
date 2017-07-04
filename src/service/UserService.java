package service;

import java.util.List;

import po.XmglUser;
import util.PageUtil;
import dao.UserDao;

public class UserService {
	private UserDao dao = new UserDao();
	//登录功能
	public XmglUser login(String username,String password){
		XmglUser user = dao.getOneUser(username);
		if(user!=null){
			if(user.getUpassword().equals(password)){
				return user;
			}
		}
		return null;
	}
	//根据职位 和 系统中的角色进行人员筛选
	public List<XmglUser> getAllXmjl(String edid,String uroid){
		return this.dao.getAllXmjl(edid, uroid); 
	}
	//根据员工的职位id 查询该岗位的所有工作人员
	public List<XmglUser> getAllUserByEdid(String edid){
		return this.dao.getAllUserByDid(edid);
	}
	//根据员工唯一编号获取人员详细信息
	public XmglUser getOneUser(String username){
		return dao.getOneUser(username);
	}
	//更新用户信息
	public void update(XmglUser user){
		this.dao.update(user);
	}
	//删除一条用户信息
	public void deleteUser(String uuid){
		this.dao.delete(uuid);
	}
	//获取所有用户信息
	public List<XmglUser> getAllUsers(){
		return this.dao.getAllUsers();
	}
	//查找一个领导下（upid）的所有人
	public List<XmglUser> getAllUserByPid(String upid){
		return this.dao.getAllUserByPid(upid);
	}
	//分页查询
	public PageUtil getOnePage(int curpage){
		int onePage = 5;
		int start = (curpage-1)*onePage+1;
		int end = curpage * onePage;
		List list = this.dao.getOtherUsers(start, end);
		int count = this.dao.getCount();
		int totalPage = count/onePage;
		if(count%onePage!=0){
			totalPage++;
		}
		PageUtil page = new PageUtil();
		page.setCount(count);
		page.setCurpage(curpage);
		page.setList(list);
		page.setTotalPage(totalPage);
		return page;
	}
}
