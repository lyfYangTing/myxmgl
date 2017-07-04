package service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglCustomer;
import po.XmglProjb;
import util.PageUtil;

import dao.CustomerDao;

public class CustomerService {
	private CustomerDao dao = new CustomerDao();
	//��ȡ�ͻ��������й�˾����Ϣ
	public List<XmglCustomer> getAllcustomers(){
		return dao.getAllCustomers();
	}
	//��ȡ������˾��Ϣ
	public XmglCustomer getOneCustomer(String cid){
		return dao.getOneCustomers(cid);
	}
	//ͨ�����ֲ�ѯ��˾��Ϣ
	public List<XmglCustomer> getCustomersByName(String cname){
		return dao.getCustomersByName(cname);
	}
	//ɾ����˾��Ϣ
	public void delete(String cid){
		//��Ҫ�����жϣ�ֻ�е��ù�˾û����Ŀ��������ʱ��Ϣ�ſ��Ա�ɾ��
		ProjbService projb = new ProjbService();
		dao.delete(cid);	
	}
	//���¹�˾��Ϣ  �����޸Ĳ���
	public void update(String cid,String cname,String clxr,String cdel,String caddress,String cbj){
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		dao.update(cid, cname, clxr, cdel, caddress, catime, cbj);
	}
	//����һ��������
	public void insert(String cname,String clxr,String ctel,String caddress,String cbj){
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		dao.insert(cname, clxr, ctel, caddress, catime, cbj);
	}
	//��ҳ����
	public PageUtil getAnyCustomers(int page){
		PageUtil util = new PageUtil();
		int onePage = 5;
		int start = (page-1)*onePage + 1;
		int end = page * onePage;
		//����ת�����Ӹ��� ���� String s = String.valueOf(end)
		List list = dao.getCustomersByCid(start,end);
		int count = dao.getCounts();
		int pagetotal = count/onePage;
		if(count%onePage!=0){
			pagetotal++;
		}
		util.setCount(count);
		util.setList(list);
		util.setTotalPage(pagetotal);
		return util;
	}
}
