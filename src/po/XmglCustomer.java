package po;

/**
                         客户表
*/
public class XmglCustomer {
	private String cid; //客户id，主键，
	private String clxr; //客户联系人
	private String ctel; //客户联系电话
	private	String caddress; //客户联系地址
	private String cbj; //客户公司背景
	private String catime; //客户添加时间
	private String cname; //客户公司名称
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getClxr() {
		return clxr;
	}
	public void setClxr(String clxr) {
		this.clxr = clxr;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getCbj() {
		return cbj;
	}
	public void setCbj(String cbj) {
		this.cbj = cbj;
	}
	public String getCatime() {
		return catime;
	}
	public void setCatime(String catime) {
		this.catime = catime;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}
