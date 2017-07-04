package po;


/**
 * 项目计划表
 * */
public class XmglProplan {
	//新增操作时直接添加的数据
	private String ppId;//计划表主键
	private String ppName;//计划标题
	private String ppStartTime; //计划开始时间     在执行新增计划操作时添加的数据
	
	private String ppEndTime;//计划结束时间              在执行新增计划操作时添加的数据
	private String ppZxr;//任务执行人  (项目经理下的所有小弟 pid=项目经理的uid) xmgl_user(uid)
	private String ppYxj;//优先级 0:暂不1:一般 2:需要3:急4:很急
	private String rwId;//外键 xmgl_rwlx(rwid)  页面显示任务类型名称
	private String ppQzId;   //前置任务ID; 没有前置任务时 该id值为0
	private String pgId;//外键功能xmgl_progn(pgid) //通过这个关联可以查出项目经理
	private String ppsCreateTime;//计划创建时间   在执行新增计划操作时添加的数据
	private String ppBeizhu;//计划备注
	private String flag;//是否显示  “yes”显示代表其前置任务已完成  任务完成后将不会在员工任务列表中进行显示
	                   //“no”不会在员工列表中进行显示,代表其任务状态为已完成 或其 前置任务还未完成  
	private String ppState;//计划执行状态	
	
	//修改操作时主要操作的数据    仅供显示时使用  数据不会写进数据库
	private XmglRwlx rwlx;
	private XmglProgn progn;//功能对象  直接在dao层mapper方法中的时候
	private XmglProplan qzPlan;//前置任务对象  在进入更新页面之前的servlet层给其赋值  在rowMapper中赋值会死循环
	private XmglUser user;//任务执行人对象   在rowMapper中赋值
	private int projecttime;//工期     在rowMapper中赋值    计划结束时间-计划开始时间
	private String isOver;//是否超期   在rowMapper中赋值    实际结束时间>计划结束时间
	private int isOverdate;//超期天数   在rowMapper中赋值   实际结束时间-计划结束时间
	
	private String ppsjStartTime;//实际开始时间   在执行更新操作时添加
	private String ppsjEndTime;//实际结束时间         在执行更新操作时添加
	private String ppshState;//审核状态
    //分配任务时主要操作的数据
	private String ppRwfpr;//任务分配人id uid外键 就是可以点击发放按钮的登录用户
	//在service层产生 并添加到数据库中
	private String ppsRwGrantTime;//计划发放时间   项目经理发放任务时添加
	private String ppffState;//发放状态（已发放  未发放）

	public String getPpffState() {
		return ppffState;
	}
	public void setPpffState(String ppffState) {
		this.ppffState = ppffState;
	}
	public XmglRwlx getRwlx() {
		return rwlx;
	}
	public void setRwlx(XmglRwlx rwlx) {
		this.rwlx = rwlx;
	}
	public int getProjecttime() {
		return projecttime;
	}
	public void setProjecttime(int projecttime) {
		this.projecttime = projecttime;
	}
	public String getIsOver() {
		return isOver;
	}
	public void setIsOver(String isOver) {
		this.isOver = isOver;
	}
	public int getIsOverdate() {
		return isOverdate;
	}
	public void setIsOverdate(int isOverdate) {
		this.isOverdate = isOverdate;
	}
	public String getPpsRwGrantTime() {
		return ppsRwGrantTime;
	}
	public void setPpsRwGrantTime(String ppsRwGrantTime) {
		this.ppsRwGrantTime = ppsRwGrantTime;
	}
	public String getPpshState() {
		return ppshState;
	}
	public void setPpshState(String ppshState) {
		this.ppshState = ppshState;
	}
	public String getPpsjStartTime() {
		return ppsjStartTime;
	}
	public void setPpsjStartTime(String ppsjStartTime) {
		this.ppsjStartTime = ppsjStartTime;
	}
	public String getPpsjEndTime() {
		return ppsjEndTime;
	}
	public void setPpsjEndTime(String ppsjEndTime) {
		this.ppsjEndTime = ppsjEndTime;
	}
	public String getPpState() {
		return ppState;
	}
	public void setPpState(String ppState) {
		this.ppState = ppState;
	}
	public String getPpsCreateTime() {
		return ppsCreateTime;
	}
	public void setPpsCreateTime(String ppsCreateTime) {
		this.ppsCreateTime = ppsCreateTime;
	}
	public String getPpBeizhu() {
		return ppBeizhu;
	}
	public void setPpBeizhu(String ppBeizhu) {
		this.ppBeizhu = ppBeizhu;
	}
	public XmglUser getUser() {
		return user;
	}
	public void setUser(XmglUser user) {
		this.user = user;
	}
	public XmglProplan getQzPlan() {
		return qzPlan;
	}
	public void setQzPlan(XmglProplan qzPlan) {
		this.qzPlan = qzPlan;
	}
	public XmglProgn getProgn() {
		return progn;
	}
	public void setProgn(XmglProgn progn) {
		this.progn = progn;
	}
	public String getPpId() {
		return ppId;
	}
	public void setPpId(String ppId) {
		this.ppId = ppId;
	}
	public String getPpName() {
		return ppName;
	}
	public void setPpName(String ppName) {
		this.ppName = ppName;
	}
	public String getPpStartTime() {
		return ppStartTime;
	}
	public void setPpStartTime(String ppStartTime) {
		this.ppStartTime = ppStartTime;
	}
	public String getPpEndTime() {
		return ppEndTime;
	}
	public void setPpEndTime(String ppEndTime) {
		this.ppEndTime = ppEndTime;
	}
	public String getPpZxr() {
		return ppZxr;
	}
	public void setPpZxr(String ppZxr) {
		this.ppZxr = ppZxr;
	}
	public String getPpYxj() {
		return ppYxj;
	}
	public void setPpYxj(String ppYxj) {
		this.ppYxj = ppYxj;
	}
	public String getRwId() {
		return rwId;
	}
	public void setRwId(String rwId) {
		this.rwId = rwId;
	}
	public String getPgId() {
		return pgId;
	}
	public void setPgId(String pgId) {
		this.pgId = pgId;
	}
	public String getPpRwfpr() {
		return ppRwfpr;
	}
	public void setPpRwfpr(String ppRwfpr) {
		this.ppRwfpr = ppRwfpr;
	}
	public String getPpQzId() {
		return ppQzId;
	}
	public void setPpQzId(String ppQzId) {
		this.ppQzId = ppQzId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
}
