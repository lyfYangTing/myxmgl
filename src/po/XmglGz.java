package po;

/**
                    工资信息表
*/
public class XmglGz {
	private String gid; //主键
	private String uid; //外键 xmgl_user(uid)	获取基本工资，奖金，补助金
	private String grantTime; //发放时间
	private String gdescrible; //描述
	private int ubasepay ;  //基本工资
	private int ubonus ;   // 奖金
	private int ubuzhujin ;  //补助金
	private int gotherAward; //总工资
	private int gkouChu; //处罚扣除金额
	private int sal ;//实发工资
	private String uname ;  //发款人
	private String year ;//年
	private String month ;//月
	private String createTime;//创建时间
	private Long sumSal ;//总工资
	public Long getSumSal() {
		return sumSal;
	}
	public void setSumSal(Long sumSal) {
		this.sumSal = sumSal;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	private String state ; //状态
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUbasepay() {
		return ubasepay;
	}
	public void setUbasepay(int ubasepay) {
		this.ubasepay = ubasepay;
	}
	public int getUbonus() {
		return ubonus;
	}
	public void setUbonus(int ubonus) {
		this.ubonus = ubonus;
	}
	public int getUbuzhujin() {
		return ubuzhujin;
	}
	public void setUbuzhujin(int ubuzhujin) {
		this.ubuzhujin = ubuzhujin;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	private XmglUser xmglUser ;
	private String sendName ;
	
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public XmglUser getXmglUser() {
		return xmglUser;
	}
	public void setXmglUser(XmglUser xmglUser) {
		this.xmglUser = xmglUser;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getGrantTime() {
		return grantTime;
	}
	public void setGrantTime(String grantTime) {
		this.grantTime = grantTime;
	}
	public String getGdescrible() {
		return gdescrible;
	}
	public void setGdescrible(String gdescrible) {
		this.gdescrible = gdescrible;
	}
	public int getGotherAward() {
		return gotherAward;
	}
	public void setGotherAward(int gotherAward) {
		this.gotherAward = gotherAward;
	}
	public int getGkouChu() {
		return gkouChu;
	}
	public void setGkouChu(int gkouChu) {
		this.gkouChu = gkouChu;
	}
}
