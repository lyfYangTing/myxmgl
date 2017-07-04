package po;

public class XmglProxq {

	/**
	 * 项目需求信息表
	 */
	private String pxId;//主键
	private String pjId;//外键 项目基本信息 xmgl_projb（pjid）
	private String pxTitle;//需求标题
	private String pxText;//需求描述
	private String txCreateTime;//创建时间
	private String txUpdateTime;//更新时间
	
	private XmglProjb xmglProjb;
	public XmglProjb getXmglProjb() {
		return xmglProjb;
	}
	public void setXmglProjb(XmglProjb xmglProjb) {
		this.xmglProjb = xmglProjb;
	}
	public String getPxId() {
		return pxId;
	}
	public void setPxId(String pxId) {
		this.pxId = pxId;
	}
	public String getPjId() {
		return pjId;
	}
	public void setPjId(String pjId) {
		this.pjId = pjId;
	}
	public String getPxTitle() {
		return pxTitle;
	}
	public void setPxTitle(String pxTitle) {
		this.pxTitle = pxTitle;
	}
	public String getPxText() {
		return pxText;
	}
	public void setPxText(String pxText) {
		this.pxText = pxText;
	}
	public String getTxCreateTime() {
		return txCreateTime;
	}
	public void setTxCreateTime(String txCreateTime) {
		this.txCreateTime = txCreateTime;
	}
	public String getTxUpdateTime() {
		return txUpdateTime;
	}
	public void setTxUpdateTime(String txUpdateTime) {
		this.txUpdateTime = txUpdateTime;
	}
	
	
}
