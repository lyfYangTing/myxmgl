package service;

import java.util.List;

import po.XmglProxq;
import util.PageUtil;
import dao.ProxqDao;

public class ProxqService {
	private ProxqDao dao = new ProxqDao();
	
	//��������id��ȡ���������ϸ��Ϣ
	public XmglProxq getOneProxq(String pxid){
		return this.dao.getOneProxq(pxid);
	}
	/**
	 * ������Ŀpjid������Ŀ�µ���������
	 */
	public List<XmglProxq> getAllProxqsByPjid(String pjid){
		return this.dao.getAllProxqByPjis(pjid);
	}
	/**
	 * ����xmgl_projb���е�������Ŀ������Ϣ���뵽List<XmglProjb>������ȥ����
	 * 
	 * ��ҳ��ʾ��
	 * 
	 * */
	public	PageUtil getPageProXqInfo(int page){
		PageUtil pagerUtil = new PageUtil();
		//��ȡ��Ҫ��ʾҳ�����Ϣ������count
		int count = dao.getCount();
		//�����ҳ�����ҳ����
		int totalPage = count/10 ;
		if(count%5 != 0){
			totalPage += 1 ;
		}
		//����ÿҳ��ʾ����������
		int curPage = 10 ;
		//����ó�ÿҳ��ʼ����Ϣ�����ͽ�����Ϣ����
		int beginIndex = (page-1)*curPage+1 ;
		int endIndex = page*curPage ;
		//����PrjbInfoDao�ײ㷽����ȡ��ÿҳҪ��ʾ������
		List list = (List<XmglProxq>)dao.getPageProInfo(beginIndex, endIndex);
		/*����ǰҳ����뵽pagerUtil�µ�currentPage������
		 *�����е�����Ϣ�������뵽pagerUtil�µ�countPage������
		 *�����и��ݱ���Ϣ������õ�����ҳ�������뵽pagerUtil�µ�pageNum������
		 *��ҳ����Ҫ��ʾ��������Ϣ���Ϸ��뵽pagerUtil��list������ȥ
		 * */
		pagerUtil.setCount(count);
		pagerUtil.setCurpage(page);
		pagerUtil.setTotalPage(totalPage);
		pagerUtil.setList(list);
		return pagerUtil ;
	}
	/**���������id��ȡ����Ӧ������������Ϣ�����ҷ����������
	 * */
	public XmglProxq getPrXqById(String pxid){
		return dao.getOneProxq(pxid);
	}
	/**
	 * �޸�����
	 * updateTime����ʱ��
	 * xqid ����id
	 * xqtitle �������
	 * xqtext��������
	 * */
	public void editXqInfo(String updateTime,String xqid,String xqtitle,String xqtext){
		dao.editXqInfo(updateTime, xqid, xqtitle, xqtext);
	}
	/**�������*/
	public void addXQInfo(String title,String ms,String prjid,String time){
		dao.addXQInfo(title, ms, prjid, time);
	}
	 /**������Ŀidɾ��������Ŀ��¼*/
	 public void deleteProjb(String xqid){
		this.dao.deleteOne(xqid);
	 }
}
