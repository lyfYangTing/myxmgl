package service;

import java.util.List;
import po.XmglProgn;
import util.PageUtil;
import dao.GongNengDao;

public class GongNengService {
	
	private GongNengDao gongNengDao = new GongNengDao();
	
	/** 查询所有的信息，用来进行分页显示*/
	public PageUtil getProngnPageInfo(int page){
		PageUtil pagerUtil = new PageUtil();
		//获取要显示消息所在表中的总数据
		int countPage = gongNengDao.getCount();
		//设置每页显示的数据条数
		int curpage = 10;
		//计算出总页码数，每页10条数据
		int pageNum = countPage/curpage;
		if(countPage%curpage!=0){
			pageNum +=1;
		}
		int beginIndex = (page-1)*curpage +1;
		int endIndex = page*curpage;
		List list = (List<XmglProgn>)gongNengDao.getPageProInfo(beginIndex, endIndex);
		pagerUtil.setCurpage(page);
		pagerUtil.setCount(countPage);
		pagerUtil.setList(list);
		pagerUtil.setTotalPage(pageNum);
		return pagerUtil;
	}
	
	/**根据功能id查询功能信息*/
	public XmglProgn getGnById(String gnid){
		return this.gongNengDao.getGnById(gnid);
	}
	/**查询一个模块下的所有 功能 根据pmid进行查询*/
	public List<XmglProgn> getGnByPmid(String pmid){
		return this.gongNengDao.getGnByPmid(pmid);
	}
	
	
	/**根据功能id，变更下面的功能需求描述列*/
	public void updateGnXqms(String gnid,String gnxqms){
		this.gongNengDao.updateGnXqms(gnid, gnxqms);
	}
	/**根据功能id，删除功能*/
	public void deleteGnById(String gnid){
		this.gongNengDao.deleteGnById(gnid);
	}
	/**增加功能*/
	public void addGn(XmglProgn xmglProgn){
		this.gongNengDao.addGn(xmglProgn);
	}
	/**编辑功能*/
	public void updateGn(XmglProgn xmglProgn) {
		this.gongNengDao.updateGn(xmglProgn);
	}
	
}
