package po;

public class XmglProxq {

	/**
	 * ��Ŀ������Ϣ��
	 */
	private String pxId;//����
	private String pjId;//��� ��Ŀ������Ϣ xmgl_projb��pjid��
	private String pxTitle;//�������
	private String pxText;//��������
	private String txCreateTime;//����ʱ��
	private String txUpdateTime;//����ʱ��
	
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
