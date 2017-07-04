package service;

import java.util.List;

import po.XmglRole;

import dao.RoleDao;

public class RoleService {
	
	private RoleDao dao = new RoleDao();
	//��ȡȫ���Ľ�ɫ��Ϣ
	public List<XmglRole> getAllRoles(){
		return this.dao.getAllRoles();
	}
	//���ݽ�ɫid���ҳ���ɫ������Ϣ
	public XmglRole getOneRole(String roid){
		return this.dao.getRole(roid);
	}
	//����µĽ�ɫ
	public void insertRole(String roname,String rtext){
		XmglRole role = new XmglRole();
		role.setRoname(roname);
		role.setRtext(rtext);
		dao.insert(role);
	}
	//���½�ɫ������Ϣ
	public void updateRole(String roid,String roname,String rtext){
		XmglRole role = new XmglRole();
		role.setRoid(roid);
		role.setRoname(roname);
		role.setRtext(rtext);
		dao.update(role);
	}
	//��ȡ�����´����Ľ�ɫid
	public int getNewRoid(){
		return this.dao.getNewRoid();
	}
	//ɾ����ɫ
	public void delete(String[] roids){
		for(int i=0;i<roids.length;i++){
			this.dao.deleteRole(roids[i]);
		}
	}
}
