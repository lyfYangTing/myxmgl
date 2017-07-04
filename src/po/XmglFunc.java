package po;
/**
 *权限信息表
 *
 */
public class XmglFunc{
	
	private String fuid ; //权限ID
	private String funame ;//权限名称
	private String pid ; //父级ID
	private String fhref ;//超链接
	public String getFuid() {
		return fuid;
	}
	public void setFuid(String fuid) {
		this.fuid = fuid;
	}
	public String getFuname() {
		return funame;
	}
	public void setFuname(String funame) {
		this.funame = funame;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getFuhref() {
		return fhref;
	}
	public void setFuhref(String fhref) {
		this.fhref = fhref;
	} 
	
}
