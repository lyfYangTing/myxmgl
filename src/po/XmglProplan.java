package po;


/**
 * ��Ŀ�ƻ���
 * */
public class XmglProplan {
	//��������ʱֱ����ӵ�����
	private String ppId;//�ƻ�������
	private String ppName;//�ƻ�����
	private String ppStartTime; //�ƻ���ʼʱ��     ��ִ�������ƻ�����ʱ��ӵ�����
	
	private String ppEndTime;//�ƻ�����ʱ��              ��ִ�������ƻ�����ʱ��ӵ�����
	private String ppZxr;//����ִ����  (��Ŀ�����µ�����С�� pid=��Ŀ�����uid) xmgl_user(uid)
	private String ppYxj;//���ȼ� 0:�ݲ�1:һ�� 2:��Ҫ3:��4:�ܼ�
	private String rwId;//��� xmgl_rwlx(rwid)  ҳ����ʾ������������
	private String ppQzId;   //ǰ������ID; û��ǰ������ʱ ��idֵΪ0
	private String pgId;//�������xmgl_progn(pgid) //ͨ������������Բ����Ŀ����
	private String ppsCreateTime;//�ƻ�����ʱ��   ��ִ�������ƻ�����ʱ��ӵ�����
	private String ppBeizhu;//�ƻ���ע
	private String flag;//�Ƿ���ʾ  ��yes����ʾ������ǰ�����������  ������ɺ󽫲�����Ա�������б��н�����ʾ
	                   //��no��������Ա���б��н�����ʾ,����������״̬Ϊ����� ���� ǰ������δ���  
	private String ppState;//�ƻ�ִ��״̬	
	
	//�޸Ĳ���ʱ��Ҫ����������    ������ʾʱʹ��  ���ݲ���д�����ݿ�
	private XmglRwlx rwlx;
	private XmglProgn progn;//���ܶ���  ֱ����dao��mapper�����е�ʱ��
	private XmglProplan qzPlan;//ǰ���������  �ڽ������ҳ��֮ǰ��servlet����丳ֵ  ��rowMapper�и�ֵ����ѭ��
	private XmglUser user;//����ִ���˶���   ��rowMapper�и�ֵ
	private int projecttime;//����     ��rowMapper�и�ֵ    �ƻ�����ʱ��-�ƻ���ʼʱ��
	private String isOver;//�Ƿ���   ��rowMapper�и�ֵ    ʵ�ʽ���ʱ��>�ƻ�����ʱ��
	private int isOverdate;//��������   ��rowMapper�и�ֵ   ʵ�ʽ���ʱ��-�ƻ�����ʱ��
	
	private String ppsjStartTime;//ʵ�ʿ�ʼʱ��   ��ִ�и��²���ʱ���
	private String ppsjEndTime;//ʵ�ʽ���ʱ��         ��ִ�и��²���ʱ���
	private String ppshState;//���״̬
    //��������ʱ��Ҫ����������
	private String ppRwfpr;//���������id uid��� ���ǿ��Ե�����Ű�ť�ĵ�¼�û�
	//��service����� ����ӵ����ݿ���
	private String ppsRwGrantTime;//�ƻ�����ʱ��   ��Ŀ����������ʱ���
	private String ppffState;//����״̬���ѷ���  δ���ţ�

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
