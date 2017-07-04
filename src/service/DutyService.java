package service;

import java.util.List;

import po.XmglDuty;
import util.PageUtil;
import dao.DutyDao;

public class DutyService {
	private DutyDao dao = new DutyDao();
	//根据主键id获取 关于这个职位的所有信息
	public XmglDuty getOneDuty(String did){
		return this.dao.queryOneByDid(did);
	}
	//删除职位信息
	public void deleteDuty(String did){
		this.dao.deleteOne(did);
	}
	//更新 或 新增 一条职位信息
	public void updateDuty(String did,String dname,String dtext,String dpid){
		XmglDuty duty = new XmglDuty();
		duty.setDid(did);
		duty.setDname(dname);
		duty.setDtext(dtext);
		duty.setDpid(dpid);
		if(duty.getDid().equals("")){//如果还没有did主键值，说明以前不存在，是新增数据
			this.dao.insertDuty(duty);
		}else{
			this.dao.update(duty);
		}
	}
	//分页查询
	public PageUtil getOnePageDuty(int curpage){
		int onePage = 5;
		int start = (curpage-1)*onePage+1;
		int end = curpage * onePage;
		List list = this.dao.getOnePage(start, end);
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
	//获取职位表中所有信息
	public List<XmglDuty> getAllDuty(){
		return this.dao.queryAllDuty();
	}
}
