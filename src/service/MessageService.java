package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglInfo;
import util.PageUtil;
import dao.MessageDao;

public class MessageService {
	private MessageDao dao = new MessageDao();
	
	//����Ϣ���н������ݲ���
	public void insertOneMessage(String ititle,String ifjr,String isjr,String itext){
		XmglInfo info = new XmglInfo();
		info.setItitle(ititle);
		info.setIfjr(ifjr);
		info.setIsjr(isjr);
		info.setItext(itext);
		//ϵͳ��ǰʱ�伴Ϊ����ʱ��
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		info.setIftime(catime);
		this.dao.insertMessage(info);
	}
	//����Ϣ���и��²鿴ʱ�䣨�ռ��˵�һ�β鿴��Ϣ��
	public void updateSjrTime(String iid){
		//ϵͳ��ǰʱ�伴Ϊ�鿴ʱ��
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String catime = sdf.format(date);
		this.dao.updateChaTime(iid, catime);
	}
	//��ѯ���û��µģ��ռ��˻򷢼������Լ��ģ�
	public PageUtil getUserAllInfo(String uid,int page,String caozuo){
		PageUtil util = new PageUtil();
		//һ��ҳ����ʾ������¼
		int onePage = 5;
		//�����ѯ����ʼֵstart �� ��ֵֹ end
		int start = (page-1)*onePage+1;
		int end = page * onePage;
		List list = null;
		int count = 0;
		if(caozuo.equals("sfjr")){
			//����ڸ�ҳ������ʾ����������
			list = dao.getInformsByIid(uid, start, end);
			System.out.println("���������ۺϵ�һ��=============>"+list.size());
			//���������������ʾ������һ���ж�����
			count = dao.getCountsByUid(uid);
		}else if(caozuo.equals("sjr")){
			list = dao.getsjrInformsByIid(uid, start, end);
			count = dao.getsjrCounts(uid);
			System.out.println("�������ռ��ߵķ���=============>"+list.size());
		}else{
			list = dao.getfjrInformsByIid(uid, start, end);
			count = dao.getfjrCounts(uid);
			System.out.println("�����˷����ߵķ���=============>"+list.size());
		}
		//�����ҳ����
		int totalPage = count/onePage;
		if(count%onePage!=0){
			totalPage++;
		}
		util.setCount(count);
		util.setList(list);
		util.setTotalPage(totalPage);
		return util;
	}
	//ɾ����Ϣ���е�����
	public void deleteInform(String iid){
		this.dao.deleteMessage(iid);
	}
	//����iid���Ҹ���Ϣ����ϸ��Ϣ
	public XmglInfo getOneInfo(String iid){
		return this.dao.getOneInfoByIid(iid);
	}
//	//��ѯ���û��յ���������Ϣ
//	public List<XmglInfo> getUsersjrInfo(String uid){
//		return this.dao.getUsersjrInfo(uid);
//	}
//	//��ѯ���û�������������Ϣ
//	public PageUtil getUserfjrInfo(String uid){
//		return this.dao.getUserfjrInfo(uid);
//	}
}
