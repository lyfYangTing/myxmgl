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
	//获取客户表中所有公司的信息
	public List<XmglCustomer> getAllcustomers(){
		return dao.getAllCustomers();
	}
	//获取单个公司信息
	public XmglCustomer getOneCustomer(String cid){
		return dao.getOneCustomers(cid);
	}
	//通过名字查询公司信息
	public List<XmglCustomer> getCustomersByName(String cname){
		return dao.getCustomersByName(cname);
	}
	//删除公司信息
	public void delete(String cid){
		//需要进行判断，只有当该公司没有项目正在运行时信息才可以被删除
		ProjbService projb = new ProjbService();
		dao.delete(cid);	
	}
	//更新公司信息  进行修改操作
	public void update(String cid,String cname,String clxr,String cdel,String caddress,String cbj){
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		dao.update(cid, cname, clxr, cdel, caddress, catime, cbj);
	}
	//插入一条新数据
	public void insert(String cname,String clxr,String ctel,String caddress,String cbj){
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		dao.insert(cname, clxr, ctel, caddress, catime, cbj);
	}
	//分页技术
	public PageUtil getAnyCustomers(int page){
		PageUtil util = new PageUtil();
		int onePage = 5;
		int start = (page-1)*onePage + 1;
		int end = page * onePage;
		//数字转换成子父串 方法 String s = String.valueOf(end)
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
