package po;


/**
 * ��Ŀ�����ϴ��б�
*/

public class XmglSclb {
	private String scId;//��Ŀ�����ϴ�ID����
	private String scFileName;//�ϴ��ļ�����
	private String scUser;//�ϴ��� ��� Xmgl_uset(uid)
	private String scTime;//�ϴ�ʱ��
	private String suoShuXiangMu;//������Ŀ Xmgl_projb(pjid)
	private String scFileType; //�ļ�����
	private String scFile    ; //�ļ���С
	
	private XmglUser user;
	private XmglProjb projb;
	public XmglUser getUser() {
		return user;
	}
	public void setUser(XmglUser user) {
		this.user = user;
	}
	public XmglProjb getProjb() {
		return projb;
	}
	public void setProjb(XmglProjb projb) {
		this.projb = projb;
	}
	public String getScFileType() {
		return scFileType;
	}
	public void setScFileType(String scFileType) {
		this.scFileType = scFileType;
	}
	public String getScFile() {
		return scFile;
	}
	public void setScFile(String scFile) {
		this.scFile = scFile;
	}
	//�ϴ�ID��װ
	public String getScId() {
		return scId;
	}
	public void setScId(String scId) {
		this.scId = scId;
	}
	//�ϴ��ļ�����
	public String getScFileName() {
		return scFileName;
	}
	public void setScFileName(String scFileName) {
		this.scFileName = scFileName;
	}
	//�ϴ���
	public String getScUser() {
		return scUser;
	}
	public void setScUser(String scUser) {
		this.scUser = scUser;
	}
	//�ϴ�ʱ��
	public String getScTime() {
		return scTime;
	}
	public void setScTime(String scTime) {
		this.scTime = scTime;
	}
	//������Ŀ
	public String getSuoShuXiangMu() {
		return suoShuXiangMu;
	}
	public void setSuoShuXiangMu(String suoShuXiangMu) {
		this.suoShuXiangMu = suoShuXiangMu;
	}
}
