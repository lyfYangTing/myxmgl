package service;

import java.util.List;

import po.XmglRwlx;

import dao.RwlxDao;

public class RwlxService {
	private RwlxDao dao = new RwlxDao();
	
	public List<XmglRwlx> getAllRwlx(){
		return this.dao.getAllRwlx();
	}
	
	public XmglRwlx getOneRwlx(String rwid){
		return this.dao.getOneRwlx(rwid);
	}
}
