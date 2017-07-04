package service;

import java.util.List;
import po.XmglProgn;
import util.PageUtil;
import dao.GongNengDao;

public class GongNengService {
	
	private GongNengDao gongNengDao = new GongNengDao();
	
	/** ��ѯ���е���Ϣ���������з�ҳ��ʾ*/
	public PageUtil getProngnPageInfo(int page){
		PageUtil pagerUtil = new PageUtil();
		//��ȡҪ��ʾ��Ϣ���ڱ��е�������
		int countPage = gongNengDao.getCount();
		//����ÿҳ��ʾ����������
		int curpage = 10;
		//�������ҳ������ÿҳ10������
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
	
	/**���ݹ���id��ѯ������Ϣ*/
	public XmglProgn getGnById(String gnid){
		return this.gongNengDao.getGnById(gnid);
	}
	/**��ѯһ��ģ���µ����� ���� ����pmid���в�ѯ*/
	public List<XmglProgn> getGnByPmid(String pmid){
		return this.gongNengDao.getGnByPmid(pmid);
	}
	
	
	/**���ݹ���id���������Ĺ�������������*/
	public void updateGnXqms(String gnid,String gnxqms){
		this.gongNengDao.updateGnXqms(gnid, gnxqms);
	}
	/**���ݹ���id��ɾ������*/
	public void deleteGnById(String gnid){
		this.gongNengDao.deleteGnById(gnid);
	}
	/**���ӹ���*/
	public void addGn(XmglProgn xmglProgn){
		this.gongNengDao.addGn(xmglProgn);
	}
	/**�༭����*/
	public void updateGn(XmglProgn xmglProgn) {
		this.gongNengDao.updateGn(xmglProgn);
	}
	
}
