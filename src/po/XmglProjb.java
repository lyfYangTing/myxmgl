package po;

public class XmglProjb {

	/**
	 * 项目基本信息表
	 */
	private String pjId;//主键
	private String pjName;//项目名称
	private Long pjMoney;//项目金额
	private Long pjDeveloperTotal;//开发人数
	private String pjCid;//所属单位      外键customer(cid)  客户id
	private String pjUid;//项目经理      外键xmgl_user(uid)
	private String pjState;//完成状态 0：未开始 1：进行中 2：已完成
	private Long pjYszcb;//预算总成本
	private Long pjSjzcb;//实际总成本
	private String pjKfdate;//计划开发日期
	private String pjWcdate;//计划完成日期
	private String pjYxj;//优先级
	private String pjBz;//备注
	private String pjLxsj;//立项时间 新增操作时系统自动产生
	private String pjUpdateTime;//更新时间
	private String pjSjkfTime;//实际开发时间
	private String pjSjwcTime;//实际完成时间
	
	
	private XmglCustomer xmglCustomer;//客户
	private XmglUser xmglUser;//项目负责人
	
	
	
	public Long getPjSjzcb() {
		return pjSjzcb;
	}
	public void setPjSjzcb(Long pjSjzcb) {
		this.pjSjzcb = pjSjzcb;
	}
	public XmglUser getXmglUser() {
		return xmglUser;
	}
	public void setXmglUser(XmglUser xmglUser) {
		this.xmglUser = xmglUser;
	}
	public XmglCustomer getXmglCustomer() {
		return xmglCustomer;
	}
	public void setXmglCustomer(XmglCustomer xmglCustomer) {
		this.xmglCustomer = xmglCustomer;
	}
	public String getPjId() {
		return pjId;
	}
	public void setPjId(String pjId) {
		this.pjId = pjId;
	}
	public String getPjName() {
		return pjName;
	}
	public void setPjName(String pjName) {
		this.pjName = pjName;
	}
	public Long getPjMoney() {
		return pjMoney;
	}
	public void setPjMoney(Long pjMoney) {
		this.pjMoney = pjMoney;
	}
	public Long getPjDeveloperTotal() {
		return pjDeveloperTotal;
	}
	public void setPjDeveloperTotal(Long pjDeveloperTotal) {
		this.pjDeveloperTotal = pjDeveloperTotal;
	}
	public String getPjCid() {
		return pjCid;
	}
	public void setPjCid(String pjCid) {
		this.pjCid = pjCid;
	}
	public String getPjUid() {
		return pjUid;
	}
	public void setPjUid(String pjUid) {
		this.pjUid = pjUid;
	}
	public String getPjState() {
		return pjState;
	}
	public void setPjState(String pjState) {
		this.pjState = pjState;
	}
	public Long getPjYszcb() {
		return pjYszcb;
	}
	public void setPjYszcb(Long pjYszcb) {
		this.pjYszcb = pjYszcb;
	}
	public String getPjKfdate() {
		return pjKfdate;
	}
	public void setPjKfdate(String pjKfdate) {
		this.pjKfdate = pjKfdate;
	}
	public String getPjWcdate() {
		return pjWcdate;
	}
	public void setPjWcdate(String pjWcdate) {
		this.pjWcdate = pjWcdate;
	}
	public String getPjYxj() {
		return pjYxj;
	}
	public void setPjYxj(String pjYxj) {
		this.pjYxj = pjYxj;
	}
	public String getPjBz() {
		return pjBz;
	}
	public void setPjBz(String pjBz) {
		this.pjBz = pjBz;
	}
	public String getPjLxsj() {
		return pjLxsj;
	}
	public void setPjLxsj(String pjLxsj) {
		this.pjLxsj = pjLxsj;
	}
	public String getPjUpdateTime() {
		return pjUpdateTime;
	}
	public void setPjUpdateTime(String pjUpdateTime) {
		this.pjUpdateTime = pjUpdateTime;
	}
	public String getPjSjkfTime() {
		return pjSjkfTime;
	}
	public void setPjSjkfTime(String pjSjkfTime) {
		this.pjSjkfTime = pjSjkfTime;
	}
	public String getPjSjwcTime() {
		return pjSjwcTime;
	}
	public void setPjSjwcTime(String pjSjwcTime) {
		this.pjSjwcTime = pjSjwcTime;
	}
	
	
}
