package service;

import java.util.List;

import po.XmglDuty;
import util.PageUtil;
import dao.DutyDao;

public class DutyService {
	private DutyDao dao = new DutyDao();
	//��������id��ȡ �������ְλ��������Ϣ
	public XmglDuty getOneDuty(String did){
		return this.dao.queryOneByDid(did);
	}
	//ɾ��ְλ��Ϣ
	public void deleteDuty(String did){
		this.dao.deleteOne(did);
	}
	//���� �� ���� һ��ְλ��Ϣ
	public void updateDuty(String did,String dname,String dtext,String dpid){
		XmglDuty duty = new XmglDuty();
		duty.setDid(did);
		duty.setDname(dname);
		duty.setDtext(dtext);
		duty.setDpid(dpid);
		if(duty.getDid().equals("")){//�����û��did����ֵ��˵����ǰ�����ڣ�����������
			this.dao.insertDuty(duty);
		}else{
			this.dao.update(duty);
		}
	}
	//��ҳ��ѯ
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
	//��ȡְλ����������Ϣ
	public List<XmglDuty> getAllDuty(){
		return this.dao.queryAllDuty();
	}
}
