package po;

/**
                    ������Ϣ��
*/
public class XmglGz {
	private String gid; //����
	private String uid; //��� xmgl_user(uid)	��ȡ�������ʣ����𣬲�����
	private String grantTime; //����ʱ��
	private String gdescrible; //����
	private int ubasepay ;  //��������
	private int ubonus ;   // ����
	private int ubuzhujin ;  //������
	private int gotherAward; //�ܹ���
	private int gkouChu; //�����۳����
	private int sal ;//ʵ������
	private String uname ;  //������
	private String year ;//��
	private String month ;//��
	private String createTime;//����ʱ��
	private Long sumSal ;//�ܹ���
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
	private String state ; //״̬
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
