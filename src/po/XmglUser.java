package po;
/**
 * 
 * @author Administrator �û��������ݱ�
 *
 */
public class XmglUser {
	private String uid;  //Ա��Ψһ���(�û�������)not null
	private String uname; //�û�������¼��&Ա����ʵ������not null
	private String upassword; //���� not null
	private String usex; //�Ա�0��������,1:����Ůnot null
	private Long uage; //not null,����
	private String ubirthday; //�������� ,not null
	private String uIDcard; //���֤����,not null
	private String uemail; //��������	
	private String utelephone;  //�绰����
	private String uaddress; //��ס��ַ
	private String edid; //ְλ not null ,���  eduty(edid)
	private String ubank; //��������
	private String ustaffType; //Ա�����ͣ�ʵϰ 0����ְ1�ȣ�,not null
	private String ubankAccount; //�����˻�(��������)
	private Long ubasePay; //�������� not null
	private Long ubonus;   //���� not null
	private Long ubuzhujin;  //������ not null
	private String entryDate;  //��ְ���� ,not null
	private String uroid;  //��ǰ��ɫ(���) ��not null
	private String udescrible;   //��ע
	private String upid;   //д�Լ���ֱ���ϼ���uid
	private XmglRole role; //��ɫ����
	private String pname;  //�ϼ��쵼����
	private XmglDuty duty;  //ְλ����
	
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
