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
	 * 获取计划表中的所有数据
	 */
	public List<XmglProplan> getAllProjh(){
		return this.dao.getAllProplan();
	}
	/**
	 * 根据功能id(pgid)获取功能下的所有计划
	 */
	public List<XmglProplan> getAllProjhByPgid(String pgid){
		return this.dao.getAllProplanByPgid(pgid);
	}
	/**
	 * 根据计划主键ppid获取该计划详细信息
	 */
	public XmglProplan getOneProjh(String ppid){
		return this.dao.getOneProjh(ppid);
	}
	/**
	 * 分页查询表中所有数据
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
	 * 分页查询个人任务信息列表
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
	 *根据主键删除一条计划记录 
	 */
	public void deleteProjh(String ppid){
		this.dao.deleteOne(ppid);
	}
	/**
	 * 新增操作
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
		//初始化任务状态  刚创建任务时  任务发放状态应为“未发放”
		plan.setPpffState("未发放");
		//生成计划创建时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ppsCreateTime = sdf.format(date);
		plan.setPpsCreateTime(ppsCreateTime);
		this.dao.insertOne(plan);
	}
	/**
	 * 执行编辑功能时 可更新的数据
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
		//已完成的 或  前置任务未完成的任务均不会在任务列表中显示  是否显示（flag）的属性设为"no" 则不会在员工任务列表中的出现
		//判断任务状态  任务未完成且前置任务已完成  flag属性值为"yes"时，才会在员工列表中出现
		if(plan.getPpState().equals("已完成")){
			plan.setFlag("no");
			//获取所有前置计划为该计划的所有计划  将该计划的ppid传到一个可以更改是否显示属性值的方法（用来找到所有的以该计划为前置计划的计划，并更新他们的flag属性值）
			this.updateFlag(ppid);
		}
        this.dao.update(plan);
	}
	/**
	 * 更新任务显示状态
	 */
	public void updateFlag(String ppid){
		//获取前置计划为ppid计划的所有计划
		List<XmglProplan> list = this.dao.getAllByqzid(ppid);
		for(XmglProplan plan:list){
			plan.setFlag("yes");
			this.dao.update(plan);
		}
	}
	/**
	 * 实现发任务功能
	 */
	public void updateFrw(String ppid,String ppRwfpr){
		XmglProplan plan = this.dao.getOneProjh(ppid);
		/*
		 * String ppRwfpr//任务分配人   根据功能id获取项目基本信息中的项目经理
		 * String ppsRwGrantTime;//计划发放时间   项目经理发放任务时添加
           String flag;//是否显示 先判断其是否有前置任务 没有flag=‘yes’有前置任务且前置任务状态不是‘已完成’则flag=‘no’
		   String ppffState//修改发放状态
		 */
		plan.setPpRwfpr(ppRwfpr);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ppsRwGrantTime = sdf.format(date);
		//更新发放时间和发放状态
		plan.setPpsRwGrantTime(ppsRwGrantTime);
		plan.setPpffState("已发放");
		if(plan.getPpQzId().equals("0")){//前置任务id=0说明没有前置任务  flag="yes"
			plan.setFlag("yes");
		}else{
			//获取其前置任务的flag值 flag为"yes"表示该计划还未完成  则自己的计划flag=‘no’
			XmglProplan qzPlan = this.dao.getOneProjh(plan.getPpQzId());
			String qzFlag = qzPlan.getFlag();//获取前置任务的flag标识
			if(qzFlag.equals("yes")){
				plan.setFlag("no");
			}else{
				plan.setFlag("yes");
			}
		}
		this.dao.update(plan);
	}
}
