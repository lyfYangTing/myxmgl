package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglPromk;
import util.PageUtil;
import dao.PromkDao;

public class PromkService {
	private PromkDao dao = new PromkDao();
	//分页查询功能
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
	//根据项目id查找项目详细信息
	public XmglPromk getOnePromk(String pmid){
		return this.dao.getOnePromk(pmid);
	}
	/**
	 *根据主键删除模块 
	 */
	public void deletePromk(String pmid){
		this.dao.deleteOne(pmid);
	}
	/**
	 * 执行模块信息的新增
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
	 * 执行模块信息的更新
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
	 * 单独执行模块中的需求描述
	 */
	public void updateProxq(String pmid,String modneedDescription){
		XmglPromk promk = this.dao.getOnePromk(pmid);
		promk.setPmXqms(modneedDescription);
		this.dao.updateOnePromk(promk);
	}
	/**
	 * 根据需求id找出需求下的所有功能
	 */
	public List<XmglPromk> getAllMkByXqId(String xqid) {
		return this.dao.getAllMkByXqId(xqid);
	}
}
