package service;

import java.util.List;

import po.XmglFunc;

import dao.FunDao;

public class FunService {
	private FunDao dao = new FunDao();
	
	//根据roid 获取角色下的所有权限
	public List<XmglFunc> getAllFuncs(String roid){
		return dao.getAllFuncsByRoid(roid);
	}
	//获取权限表中的所有数据
	public List<XmglFunc> getAllFunctions(){
		return dao.getAllFuncs();
	}
	//增加角色中的权限
	public void insertFuncs(String roid,String[] funs){
		dao.deleteFuncs(roid);
		if(funs!=null){
			for(int i=0;i<funs.length;i++){
				this.dao.insertFunc(roid, funs[i]);
			}
		}
	}
}
