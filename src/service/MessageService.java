package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglInfo;
import util.PageUtil;
import dao.MessageDao;

public class MessageService {
	private MessageDao dao = new MessageDao();
	
	//向消息表中进行数据插入
	public void insertOneMessage(String ititle,String ifjr,String isjr,String itext){
		XmglInfo info = new XmglInfo();
		info.setItitle(ititle);
		info.setIfjr(ifjr);
		info.setIsjr(isjr);
		info.setItext(itext);
		//系统当前时间即为发件时间
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		info.setIftime(catime);
		this.dao.insertMessage(info);
	}
	//向消息表中更新查看时间（收件人第一次查看消息）
	public void updateSjrTime(String iid){
		//系统当前时间即为查看时间
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		this.dao.updateChaTime(iid, catime);
	}
	//查询该用户下的（收件人或发件人是自己的）
	public PageUtil getUserAllInfo(String uid,int page,String caozuo){
		PageUtil util = new PageUtil();
		//一个页面显示五条记录
		int onePage = 5;
		//求出查询的起始值start 和 终止值 end
		int start = (page-1)*onePage+1;
		int end = page * onePage;
		List list = null;
		int count = 0;
		if(caozuo.equals("sfjr")){
			//查出在该页面上显示的所有数据
			list = dao.getInformsByIid(uid, start, end);
			System.out.println("我走了最综合的一个=============>"+list.size());
			//查出满足条件可显示的数据一共有多少条
			count = dao.getCountsByUid(uid);
		}else if(caozuo.equals("sjr")){
			list = dao.getsjrInformsByIid(uid, start, end);
			count = dao.getsjrCounts(uid);
			System.out.println("我走了收件者的方向=============>"+list.size());
		}else{
			list = dao.getfjrInformsByIid(uid, start, end);
			count = dao.getfjrCounts(uid);
			System.out.println("我走了发件者的方向=============>"+list.size());
		}
		//算出总页面数
		int totalPage = count/onePage;
		if(count%onePage!=0){
			totalPage++;
		}
		util.setCount(count);
		util.setList(list);
		util.setTotalPage(totalPage);
		return util;
	}
	//删除消息表中的数据
	public void deleteInform(String iid){
		this.dao.deleteMessage(iid);
	}
	//根据iid查找该消息的详细信息
	public XmglInfo getOneInfo(String iid){
		return this.dao.getOneInfoByIid(iid);
	}
//	//查询该用户收到的所有消息
//	public List<XmglInfo> getUsersjrInfo(String uid){
//		return this.dao.getUsersjrInfo(uid);
//	}
//	//查询该用户发出的所有消息
//	public PageUtil getUserfjrInfo(String uid){
//		return this.dao.getUserfjrInfo(uid);
//	}
}
