package service;

import java.util.List;

import po.XmglFunc;

import dao.FunDao;

public class FunService {
	private FunDao dao = new FunDao();
	
	//����roid ��ȡ��ɫ�µ�����Ȩ��
	public List<XmglFunc> getAllFuncs(String roid){
		return dao.getAllFuncsByRoid(roid);
	}
	//��ȡȨ�ޱ��е���������
	public List<XmglFunc> getAllFunctions(){
		return dao.getAllFuncs();
	}
	//���ӽ�ɫ�е�Ȩ��
	public void insertFuncs(String roid,String[] funs){
		dao.deleteFuncs(roid);
		if(funs!=null){
			for(int i=0;i<funs.length;i++){
				this.dao.insertFunc(roid, funs[i]);
			}
		}
	}
}
