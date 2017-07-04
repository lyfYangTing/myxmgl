package service;

import java.util.List;

import po.XmglRole;

import dao.RoleDao;

public class RoleService {
	
	private RoleDao dao = new RoleDao();
	//获取全部的角色信息
	public List<XmglRole> getAllRoles(){
		return this.dao.getAllRoles();
	}
	//根据角色id查找出角色完整信息
	public XmglRole getOneRole(String roid){
		return this.dao.getRole(roid);
	}
	//添加新的角色
	public void insertRole(String roname,String rtext){
		XmglRole role = new XmglRole();
		role.setRoname(roname);
		role.setRtext(rtext);
		dao.insert(role);
	}
	//更新角色基本信息
	public void updateRole(String roid,String roname,String rtext){
		XmglRole role = new XmglRole();
		role.setRoid(roid);
		role.setRoname(roname);
		role.setRtext(rtext);
		dao.update(role);
	}
	//获取即将新创建的角色id
	public int getNewRoid(){
		return this.dao.getNewRoid();
	}
	//删除角色
	public void delete(String[] roids){
		for(int i=0;i<roids.length;i++){
			this.dao.deleteRole(roids[i]);
		}
	}
}
