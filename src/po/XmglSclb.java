package po;


/**
 * 项目管理上传列表
*/

public class XmglSclb {
	private String scId;//项目管理上传ID主键
	private String scFileName;//上传文件名称
	private String scUser;//上传人 外键 Xmgl_uset(uid)
	private String scTime;//上传时间
	private String suoShuXiangMu;//所属项目 Xmgl_projb(pjid)
	private String scFileType; //文件类型
	private String scFile    ; //文件大小
	
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
	//上传ID封装
	public String getScId() {
		return scId;
	}
	public void setScId(String scId) {
		this.scId = scId;
	}
	//上传文件名称
	public String getScFileName() {
		return scFileName;
	}
	public void setScFileName(String scFileName) {
		this.scFileName = scFileName;
	}
	//上传人
	public String getScUser() {
		return scUser;
	}
	public void setScUser(String scUser) {
		this.scUser = scUser;
	}
	//上传时间
	public String getScTime() {
		return scTime;
	}
	public void setScTime(String scTime) {
		this.scTime = scTime;
	}
	//所属项目
	public String getSuoShuXiangMu() {
		return suoShuXiangMu;
	}
	public void setSuoShuXiangMu(String suoShuXiangMu) {
		this.suoShuXiangMu = suoShuXiangMu;
	}
}
