package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglProplan;
import util.PageUtil;

import dao.ProjhDao;

public class ProjhService {
	private ProjhDao dao = new ProjhDao();
	
	/**
	 * ��ȡ�ƻ����е���������
	 */
	public List<XmglProplan> getAllProjh(){
		return this.dao.getAllProplan();
	}
	/**
	 * ���ݹ���id(pgid)��ȡ�����µ����мƻ�
	 */
	public List<XmglProplan> getAllProjhByPgid(String pgid){
		return this.dao.getAllProplanByPgid(pgid);
	}
	/**
	 * ���ݼƻ�����ppid��ȡ�üƻ���ϸ��Ϣ
	 */
	public XmglProplan getOneProjh(String ppid){
		return this.dao.getOneProjh(ppid);
	}
	/**
	 * ��ҳ��ѯ������������
	 */
	public PageUtil getOnePage(int curpage){
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
	/**
	 * ��ҳ��ѯ����������Ϣ�б�
	 */
	public PageUtil getOnePageByZxr(String ppzxr,int curpage){
		int onePage = 5;
		int start = (curpage-1)*onePage+1;
		int end = curpage * onePage;
		List list = this.dao.getOnePageByZxr(ppzxr, start, end);
		int count = this.dao.getCountByZxr(ppzxr);
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
	/**
	 *��������ɾ��һ���ƻ���¼ 
	 */
	public void deleteProjh(String ppid){
		this.dao.deleteOne(ppid);
	}
	/**
	 * ��������
	 */
	public void insert(String ppName,String ppQzId,String ppStartTime,String ppEndTime,String ppZxr,String ppYxj,String rwId,String ppState,String pgId,String ppBeizhu){
		XmglProplan plan = new XmglProplan();
		plan.setPpName(ppName);
		plan.setPpQzId(ppQzId);
		plan.setPpStartTime(ppStartTime);
		plan.setPpEndTime(ppEndTime);
		plan.setPpZxr(ppZxr);
		plan.setPpYxj(ppYxj);
		plan.setRwId(rwId);
		plan.setPpState(ppState);
		plan.setPgId(pgId);
		plan.setPpBeizhu(ppBeizhu);
		//��ʼ������״̬  �մ�������ʱ  ���񷢷�״̬ӦΪ��δ���š�
		plan.setPpffState("δ����");
		//���ɼƻ�����ʱ��
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ppsCreateTime = sdf.format(date);
		plan.setPpsCreateTime(ppsCreateTime);
		this.dao.insertOne(plan);
	}
	/**
	 * ִ�б༭����ʱ �ɸ��µ�����
	 */
	public void updateOneProjh(String ppid,String rwid,String ppQzid,String ppname,String ppsjStartTime,String ppsjEndTime,String ppState,String ppQzId,String ppshState,String ppBeizhu){
		XmglProplan plan = this.dao.getOneProjh(ppid);
		plan.setRwId(rwid);
		plan.setPpQzId(ppQzId);
		plan.setPpName(ppname);
		plan.setPpsjStartTime(ppsjStartTime);
		plan.setPpsjEndTime(ppsjEndTime);
		plan.setPpState(ppState);
		plan.setPpQzId(ppQzId);
		plan.setPpshState(ppshState);
		plan.setPpBeizhu(ppBeizhu);
		//����ɵ� ��  ǰ������δ��ɵ�����������������б�����ʾ  �Ƿ���ʾ��flag����������Ϊ"no" �򲻻���Ա�������б��еĳ���
		//�ж�����״̬  ����δ�����ǰ�����������  flag����ֵΪ"yes"ʱ���Ż���Ա���б��г���
		if(plan.getPpState().equals("�����")){
			plan.setFlag("no");
			//��ȡ����ǰ�üƻ�Ϊ�üƻ������мƻ�  ���üƻ���ppid����һ�����Ը����Ƿ���ʾ����ֵ�ķ����������ҵ����е��Ըüƻ�Ϊǰ�üƻ��ļƻ������������ǵ�flag����ֵ��
			this.updateFlag(ppid);
		}
        this.dao.update(plan);
	}
	/**
	 * ����������ʾ״̬
	 */
	public void updateFlag(String ppid){
		//��ȡǰ�üƻ�Ϊppid�ƻ������мƻ�
		List<XmglProplan> list = this.dao.getAllByqzid(ppid);
		for(XmglProplan plan:list){
			plan.setFlag("yes");
			this.dao.update(plan);
		}
	}
	/**
	 * ʵ�ַ�������
	 */
	public void updateFrw(String ppid,String ppRwfpr){
		XmglProplan plan = this.dao.getOneProjh(ppid);
		/*
		 * String ppRwfpr//���������   ���ݹ���id��ȡ��Ŀ������Ϣ�е���Ŀ����
		 * String ppsRwGrantTime;//�ƻ�����ʱ��   ��Ŀ����������ʱ���
           String flag;//�Ƿ���ʾ ���ж����Ƿ���ǰ������ û��flag=��yes����ǰ��������ǰ������״̬���ǡ�����ɡ���flag=��no��
		   String ppffState//�޸ķ���״̬
		 */
		plan.setPpRwfpr(ppRwfpr);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ppsRwGrantTime = sdf.format(date);
		//���·���ʱ��ͷ���״̬
		plan.setPpsRwGrantTime(ppsRwGrantTime);
		plan.setPpffState("�ѷ���");
		if(plan.getPpQzId().equals("0")){//ǰ������id=0˵��û��ǰ������  flag="yes"
			plan.setFlag("yes");
		}else{
			//��ȡ��ǰ�������flagֵ flagΪ"yes"��ʾ�üƻ���δ���  ���Լ��ļƻ�flag=��no��
			XmglProplan qzPlan = this.dao.getOneProjh(plan.getPpQzId());
			String qzFlag = qzPlan.getFlag();//��ȡǰ�������flag��ʶ
			if(qzFlag.equals("yes")){
				plan.setFlag("no");
			}else{
				plan.setFlag("yes");
			}
		}
		this.dao.update(plan);
	}
}
