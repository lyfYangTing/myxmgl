package po;
/**
 * 
 * 
 *             员工职位表
 *
 */
public class XmglDuty {
	private String did;   //职位id,主键
	private String dname;  //职位名称，加唯一键
	private String dtext; //职位备注
	private String dpid; //职位上下级关系
	private String dpname; //直属上级名称
	public String getDpname() {
		return dpname;
	}
	public void setDpname(String dpname) {
		this.dpname = dpname;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDtext() {
		return dtext;
	}
	public void setDtext(String dtext) {
		this.dtext = dtext;
	}
	public String getDpid() {
		return dpid;
	}
	public void setDpid(String dpid) {
		this.dpid = dpid;
	}
}
