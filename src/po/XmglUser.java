package po;
/**
 * 
 * @author Administrator 用户基本数据表
 *
 */
public class XmglUser {
	private String uid;  //员工唯一编号(用户表主键)not null
	private String uname; //用户名（登录名&员工真实姓名）not null
	private String upassword; //密码 not null
	private String usex; //性别0：代表男,1:代表女not null
	private Long uage; //not null,年龄
	private String ubirthday; //出生日期 ,not null
	private String uIDcard; //身份证号码,not null
	private String uemail; //电子邮箱	
	private String utelephone;  //电话号码
	private String uaddress; //居住地址
	private String edid; //职位 not null ,外键  eduty(edid)
	private String ubank; //银行名称
	private String ustaffType; //员工类型（实习 0，在职1等）,not null
	private String ubankAccount; //银行账户(用来打工资)
	private Long ubasePay; //基本工资 not null
	private Long ubonus;   //奖金 not null
	private Long ubuzhujin;  //补助金 not null
	private String entryDate;  //入职日期 ,not null
	private String uroid;  //当前角色(外键) ，not null
	private String udescrible;   //备注
	private String upid;   //写自己的直属上级的uid
	private XmglRole role; //角色对象
	private String pname;  //上级领导名字
	private XmglDuty duty;  //职位对象
	
	public XmglRole getRole() {
		return role;
	}
	public void setRole(XmglRole role) {
		this.role = role;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public XmglDuty getDuty() {
		return duty;
	}
	public void setDuty(XmglDuty duty) {
		this.duty = duty;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public Long getUage() {
		return uage;
	}
	public void setUage(Long uage) {
		this.uage = uage;
	}
	public String getUbirthday() {
		return ubirthday;
	}
	public void setUbirthday(String ubirthday) {
		this.ubirthday = ubirthday;
	}
	public String getuIDcard() {
		return uIDcard;
	}
	public void setuIDcard(String uIDcard) {
		this.uIDcard = uIDcard;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUtelephone() {
		return utelephone;
	}
	public void setUtelephone(String utelephone) {
		this.utelephone = utelephone;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getEdid() {
		return edid;
	}
	public void setEdid(String edid) {
		this.edid = edid;
	}
	public String getUbank() {
		return ubank;
	}
	public void setUbank(String ubank) {
		this.ubank = ubank;
	}
	public String getUstaffType() {
		return ustaffType;
	}
	public void setUstaffType(String ustaffType) {
		this.ustaffType = ustaffType;
	}
	public String getUbankAccount() {
		return ubankAccount;
	}
	public void setUbankAccount(String ubankAccount) {
		this.ubankAccount = ubankAccount;
	}
	public Long getUbasePay() {
		return ubasePay;
	}
	public void setUbasePay(Long ubasePay) {
		this.ubasePay = ubasePay;
	}
	public Long getUbonus() {
		return ubonus;
	}
	public void setUbonus(Long ubonus) {
		this.ubonus = ubonus;
	}
	public Long getUbuzhujin() {
		return ubuzhujin;
	}
	public void setUbuzhujin(Long ubuzhujin) {
		this.ubuzhujin = ubuzhujin;
	}
	public String getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
	public String getUroid() {
		return uroid;
	}
	public void setUroid(String uroid) {
		this.uroid = uroid;
	}
	public String getUdescrible() {
		return udescrible;
	}
	public void setUdescrible(String udescrible) {
		this.udescrible = udescrible;
	}
	public String getUpid() {
		return upid;
	}
	public void setUpid(String upid) {
		this.upid = upid;
	}
	

}
