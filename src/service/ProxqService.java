package service;

import java.util.List;

import po.XmglProxq;
import util.PageUtil;
import dao.ProxqDao;

public class ProxqService {
	private ProxqDao dao = new ProxqDao();
	
	//根据需求id获取该需求的详细信息
	public XmglProxq getOneProxq(String pxid){
		return this.dao.getOneProxq(pxid);
	}
	/**
	 * 根据项目pjid查找项目下的所有需求
	 */
	public List<XmglProxq> getAllProxqsByPjid(String pjid){
		return this.dao.getAllProxqByPjis(pjid);
	}
	/**
	 * 将从xmgl_projb表中的所有项目基本信息放入到List<XmglProjb>集合中去并且
	 * 
	 * 分页显示：
	 * 
	 * */
	public	PageUtil getPageProXqInfo(int page){
		PageUtil pagerUtil = new PageUtil();
		//获取到要显示页面的消息总条数count
		int count = dao.getCount();
		//计算出页面的总页码数
		int totalPage = count/10 ;
		if(count%5 != 0){
			totalPage += 1 ;
		}
		//设置每页显示的数据条数
		int curPage = 10 ;
		//计算得出每页开始的信息条数和结束信息条数
		int beginIndex = (page-1)*curPage+1 ;
		int endIndex = page*curPage ;
		//调用PrjbInfoDao底层方法获取到每页要显示的数据
		List list = (List<XmglProxq>)dao.getPageProInfo(beginIndex, endIndex);
		/*将当前页码放入到pagerUtil下的currentPage属性中
		 *将表中的总信息条数放入到pagerUtil下的countPage属性中
		 *将表中根据表信息计算出得到的总页码数放入到pagerUtil下的pageNum属性中
		 *将页面上要显示的数据信息集合放入到pagerUtil下list集合中去
		 * */
		pagerUtil.setCount(count);
		pagerUtil.setCurpage(page);
		pagerUtil.setTotalPage(totalPage);
		pagerUtil.setList(list);
		return pagerUtil ;
	}
	/**根据需求的id获取到对应的需求所有信息，并且返回需求对象
	 * */
	public XmglProxq getPrXqById(String pxid){
		return dao.getOneProxq(pxid);
	}
	/**
	 * 修改需求
	 * updateTime更新时间
	 * xqid 需求id
	 * xqtitle 需求标题
	 * xqtext需求内容
	 * */
	public void editXqInfo(String updateTime,String xqid,String xqtitle,String xqtext){
		dao.editXqInfo(updateTime, xqid, xqtitle, xqtext);
	}
	/**添加需求*/
	public void addXQInfo(String title,String ms,String prjid,String time){
		dao.addXQInfo(title, ms, prjid, time);
	}
	 /**根据项目id删除单条项目记录*/
	 public void deleteProjb(String xqid){
		this.dao.deleteOne(xqid);
	 }
}
