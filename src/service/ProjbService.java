package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglProjb;
import util.PageUtil;
import dao.ProjbDao;

public class ProjbService {
	private ProjbDao dao = new ProjbDao();
	//查找一个客户所需要的所有数据
	public List<XmglProjb> getProByCid(String cid){
		return dao.getProjbBycname(cid);
	}
	//分页查询功能
	public PageUtil getOnePage(int curpage){
		int onePage = 5;
		int start = (curpage-1)*onePage+1;
		int end = curpage * onePage;
		List list = this.dao.getOtherProjb(start, end);
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
	//根据项目id查找项目详细信息
	public XmglProjb getOneProjb(String pjid){
		return this.dao.getOneProjb(pjid);
	}
	//根据项目名称查询项目详细信息
	public XmglProjb getOneProjbyName(String pjname){
		return this.dao.geProjbByName(pjname);
	}
	//更新项目基本数据
	public void updateOneProjb(String prno,String proname,String clientno,String promoney,String pronum,String proManager,String proidcomplete,String prozmoney,String probeginDate,String procompeteDate,String promission,String probeizhu){
		Date date = new Date() ;
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dates = sdf.format(date);
		this.dao.updateOne(prno, proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, probeginDate, procompeteDate, promission, probeizhu,dates);
	}
	//根据项目id删除单条项目记录
	public void deleteProjb(String pjid){
		if(this.getOneProjb(pjid).getPjState().equals("已完成")){
			this.dao.deleteOne(pjid);
		}
	}
	/**
	 *  查询所有项目数据
	 */
	public List<XmglProjb> getAllProjb(){
		return this.dao.getAllProjb();			
	}
	/**
	 * 添加新项目
	 * */
	public void insertPrjInfo(String proname,String clientno,String promoney,
			String pronum,String proManager,String proidcomplete,String prozmoney,	
			String probeginDate,String procompeteDate,String promission,String probeizhu){
			Date date = new Date() ;
			SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dates = sdf.format(date);
			this.dao.insertPrjInfo(proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, probeginDate, procompeteDate, promission, probeizhu,dates);
	}
}
