package service;

import java.util.List;

import po.XmglUser;
import util.PageUtil;
import dao.UserDao;

public class UserService {
	private UserDao dao = new UserDao();
	//��¼����
	public XmglUser login(String username,String password){
		XmglUser user = dao.getOneUser(username);
		if(user!=null){
			if(user.getUpassword().equals(password)){
				return user;
			}
		}
		return null;
	}
	//����ְλ �� ϵͳ�еĽ�ɫ������Աɸѡ
	public List<XmglUser> getAllXmjl(String edid,String uroid){
		return this.dao.getAllXmjl(edid, uroid); 
	}
	//����Ա����ְλid ��ѯ�ø�λ�����й�����Ա
	public List<XmglUser> getAllUserByEdid(String edid){
		return this.dao.getAllUserByDid(edid);
	}
	//����Ա��Ψһ��Ż�ȡ��Ա��ϸ��Ϣ
	public XmglUser getOneUser(String username){
		return dao.getOneUser(username);
	}
	//�����û���Ϣ
	public void update(XmglUser user){
		this.dao.update(user);
	}
	//ɾ��һ���û���Ϣ
	public void deleteUser(String uuid){
		this.dao.delete(uuid);
	}
	//��ȡ�����û���Ϣ
	public List<XmglUser> getAllUsers(){
		return this.dao.getAllUsers();
	}
	//����һ���쵼�£�upid����������
	public List<XmglUser> getAllUserByPid(String upid){
		return this.dao.getAllUserByPid(upid);
	}
	//��ҳ��ѯ
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
