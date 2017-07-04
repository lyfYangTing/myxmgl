package po;

public class XmglPromk {

	/**
	 * 项目模块信息表
	 */
	private String pmId;//主键
	private String pxId;//外键需求xmgl_proxq(pxid)
	private String pmName;//模块名字
	private String pmBiaoShi;//模块标识（模块功能关键字
	private String pmYxj;//优先级
	private String pmKms;//模块描述
	private String pmXqms;//需求描述
	private String txCreateTime;//创建时间
	private String updateTime;//更新时间
	
	private XmglProxq xmglProxq;//需求对象
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public XmglProxq getXmglProxq() {
		return xmglProxq;
	}
	public void setXmglProxq(XmglProxq xmglProxq) {
		this.xmglProxq = xmglProxq;
	}
	public String getPmId() {
		return pmId;
	}
	public void setPmId(String pmId) {
		this.pmId = pmId;
	}
	public String getPxId() {
		return pxId;
	}
	public void setPxId(String pxId) {
		this.pxId = pxId;
	}
	public String getPmName() {
		return pmName;
	}
	public void setPmName(String pmName) {
		this.pmName = pmName;
	}
	public String getPmBiaoShi() {
		return pmBiaoShi;
	}
	public void setPmBiaoShi(String pmBiaoShi) {
		this.pmBiaoShi = pmBiaoShi;
	}
	public String getPmYxj() {
		return pmYxj;
	}
	public void setPmYxj(String pmYxj) {
		this.pmYxj = pmYxj;
	}
	public String getPmKms() {
		return pmKms;
	}
	public void setPmKms(String pmKms) {
		this.pmKms = pmKms;
	}
	public String getPmXqms() {
		return pmXqms;
	}
	public void setPmXqms(String pmXqms) {
		this.pmXqms = pmXqms;
	}
	public String getTxCreateTime() {
		return txCreateTime;
	}
	public void setTxCreateTime(String txCreateTime) {
		this.txCreateTime = txCreateTime;
	}
	
}
