package service;

import java.util.List;

import po.XmglGz;
import util.PageUtil;
import dao.GzDao;

public class GzService {
	
	private GzDao gzDao = new GzDao();
	
	public PageUtil queryAllGz(int page){
		int count = gzDao.count();
		int totalPage = count/5 ;
		if(count%5 != 0){
			totalPage += 1 ;
		}
		int curPage = 5 ;
		int beginIndex = (page-1)*curPage+1 ;
		int endIndex = page*curPage ;
		List list = (List<XmglGz>)gzDao.queryAllGz(beginIndex,endIndex);
		PageUtil util = new PageUtil();
		util.setCount(count);
		util.setTotalPage(totalPage);
		util.setList(list);
		return util ;
	}
	public XmglGz  loadGz(String gid){
		return (XmglGz)gzDao.loadGz(gid);
	}
	
	public void insert(XmglGz xmglGz){
		gzDao.insert(xmglGz);
	}
	
	public void update(XmglGz  xmglGz,String  gid){
		gzDao.update(xmglGz, gid);	
		
	}
	
	public List<XmglGz>  load(String year ,String month){
		return (List<XmglGz>)gzDao.load(year, month);
	}
}
