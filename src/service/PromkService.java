package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglPromk;
import util.PageUtil;
import dao.PromkDao;

public class PromkService {
	private PromkDao dao = new PromkDao();
	//��ҳ��ѯ����
	public PageUtil getOnePage(int curpage){
		int onePage = 5;
		int start = (curpage-1)*onePage+1;
		int end = curpage * onePage;
		List list = this.dao.getOtherPromk(start, end);
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
	public XmglPromk getOnePromk(String pmid){
		return this.dao.getOnePromk(pmid);
	}
	/**
	 *��������ɾ��ģ�� 
	 */
	public void deletePromk(String pmid){
		this.dao.deleteOne(pmid);
	}
	/**
	 * ִ��ģ����Ϣ������
	 */
	public void insertPromk(String moname,String mobiaozhi,String prono,String nno,String modmission,String moddescription,String modneedDescription){
		XmglPromk promk = new XmglPromk();
		promk.setPmBiaoShi(mobiaozhi);
		promk.setPmKms(moddescription);
		promk.setPmName(moname);
		promk.setPmXqms(modneedDescription);
		promk.setPmYxj(modmission);
		promk.setPxId(nno);
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		promk.setTxCreateTime(catime);
		this.dao.insertOnePromk(promk);
	}
	/**
	 * ִ��ģ����Ϣ�ĸ���
	 */
	public void updatePromk(String pmid,String moname,String mobiaozhi,String prono,String nno,String modmission,String moddescription,String modneedDescription){
		XmglPromk promk = this.dao.getOnePromk(pmid);
		promk.setPmBiaoShi(mobiaozhi);
		promk.setPmKms(moddescription);
		promk.setPmName(moname);
		promk.setPmXqms(modneedDescription);
		promk.setPmYxj(modmission);
		promk.setPxId(nno);
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		promk.setUpdateTime(catime);
		this.dao.updateOnePromk(promk);
	}
	/**
	 * ����ִ��ģ���е���������
	 */
	public void updateProxq(String pmid,String modneedDescription){
		XmglPromk promk = this.dao.getOnePromk(pmid);
		promk.setPmXqms(modneedDescription);
		this.dao.updateOnePromk(promk);
	}
	/**
	 * ��������id�ҳ������µ����й���
	 */
	public List<XmglPromk> getAllMkByXqId(String xqid) {
		return this.dao.getAllMkByXqId(xqid);
	}
}
