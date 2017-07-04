package po;

public class XmglProgn {

	/**
	 * 项目功能信息表
	 */
	private String pgId;//主键
	private String pmId;//外键模块xmgl_promk(pmid)
	
	private String pgName;//功能名称
	private String pgText;//功能描述
	private String pgXqms;//功能<-需求描述 
	private String txCreateTime;//创建时间 
	private String gnyxj;
	private  XmglPromk xmglPromk;
	
	public XmglPromk getXmglPromk() {
		return xmglPromk;
	}
	public void setXmglPromk(XmglPromk xmglPromk) {
		this.xmglPromk = xmglPromk;
	}
	public String getGnyxj() {
		return gnyxj;
	}
	public void setGnyxj(String gnyxj) {
		this.gnyxj = gnyxj;
	}
	public String getPgId() {
		return pgId;
	}
	public void setPgId(String pgId) {
		this.pgId = pgId;
	}
	public String getPmId() {
		return pmId;
	}
	public void setPmId(String pmId) {
		this.pmId = pmId;
	}
	public String getPgName() {
		return pgName;
	}
	public void setPgName(String pgName) {
		this.pgName = pgName;
	}
	public String getPgText() {
		return pgText;
	}
	public void setPgText(String pgText) {
		this.pgText = pgText;
	}
	public String getPgXqms() {
		return pgXqms;
	}
	public void setPgXqms(String pgXqms) {
		this.pgXqms = pgXqms;
	}
	public String getTxCreateTime() {
		return txCreateTime;
	}
	public void setTxCreateTime(String txCreateTime) {
		this.txCreateTime = txCreateTime;
	}
	
}
