package po;

/**
                        消息表
*/
public class XmglInfo {
	private String iid;  //消息ID，主键
	private String ititle;  //消息标题
	private String ifjr; //发件人，not null,uid(员工表主键)
	private String isjr; //收件人，not null，uid(员工表主键)
	private String iftime; //发件时间
	private String itext; //消息内容
	private String ictime; //查看时间
	public String getIid() {
		return iid;
	}
	public void setLid(String iid) {
		this.iid = iid;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIfjr() {
		return ifjr;
	}
	public void setIfjr(String ifjr) {
		this.ifjr = ifjr;
	}
	public String getIsjr() {
		return isjr;
	}
	public void setIsjr(String isjr) {
		this.isjr = isjr;
	}
	public String getIftime() {
		return iftime;
	}
	public void setIftime(String iftime) {
		this.iftime = iftime;
	}
	public String getItext() {
		return itext;
	}
	public void setItext(String itext) {
		this.itext = itext;
	}
	public String getIctime() {
		return ictime;
	}
	public void setIctime(String ictime) {
		this.ictime = ictime;
	}
}
