package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglProjb;
import util.PageUtil;
import dao.ProjbDao;

public class ProjbService {
	private ProjbDao dao = new ProjbDao();
	//����һ���ͻ�����Ҫ����������
	public List<XmglProjb> getProByCid(String cid){
		return dao.getProjbBycname(cid);
	}
	//��ҳ��ѯ����
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
	//������Ŀid������Ŀ��ϸ��Ϣ
	public XmglProjb getOneProjb(String pjid){
		return this.dao.getOneProjb(pjid);
	}
	//������Ŀ���Ʋ�ѯ��Ŀ��ϸ��Ϣ
	public XmglProjb getOneProjbyName(String pjname){
		return this.dao.geProjbByName(pjname);
	}
	//������Ŀ��������
	public void updateOneProjb(String prno,String proname,String clientno,String promoney,String pronum,String proManager,String proidcomplete,String prozmoney,String probeginDate,String procompeteDate,String promission,String probeizhu){
		Date date = new Date() ;
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dates = sdf.format(date);
		this.dao.updateOne(prno, proname, clientno, promoney, pronum, proManager, proidcomplete, prozmoney, probeginDate, procompeteDate, promission, probeizhu,dates);
	}
	//������Ŀidɾ��������Ŀ��¼
	public void deleteProjb(String pjid){
		if(this.getOneProjb(pjid).getPjState().equals("�����")){
			this.dao.deleteOne(pjid);
		}
	}
	/**
	 *  ��ѯ������Ŀ����
	 */
	public List<XmglProjb> getAllProjb(){
		return this.dao.getAllProjb();			
	}
	/**
	 * �������Ŀ
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
