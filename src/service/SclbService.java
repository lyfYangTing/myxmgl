package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.XmglSclb;

import util.PageUtil;
import dao.SclbDao;

public class SclbService {
	private SclbDao dao = new SclbDao();
	
	//分页查询功能
	public PageUtil getOnePage(int curpage){
		int onePage = 5;
		int start = (curpage-1)*onePage+1;
		int end = curpage * onePage;
		List list = this.dao.getOtherSclb(start, end);
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
	//根据scid获取该记录的详细信息
	public  XmglSclb getOneSclb(String scid){
		return this.dao.getOneSclb(scid);
	}
	//根据scid删除表中的该条记录
	public void deleteOne(String scid){
		this.dao.deleteSclb(scid);
	}
	//根据文件名获取文件记录
	public XmglSclb getOneSclbByName(String scFileName){
		return this.dao.getOneByName(scFileName);
	}
	//上传文件后向数据库中插入数据
	public void insert(String suffix,String scr,String pjid,String ext,int fileSize){
		XmglSclb sclb = new XmglSclb();
		sclb.setScFile(String.valueOf(fileSize));
		sclb.setScFileName(suffix);
		sclb.setScFileType(ext);
		sclb.setSuoShuXiangMu(pjid);
		sclb.setScUser(scr);
		Date date = new Date() ;
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
		String scTime = sdf.format(date);
		sclb.setScTime(scTime);
		this.dao.insert(sclb);
	}
}
