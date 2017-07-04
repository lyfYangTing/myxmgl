package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglDuty;
import util.JdbcTemplate;
import util.RowMapper;

public class DutyDao implements RowMapper{
	
	private JdbcTemplate jdbc = new JdbcTemplate();
	//根据主键id获取该职位的详细信息
	public XmglDuty queryOneByDid(String did){
		String sql = "select * from xmgl_duty where did=?";
		XmglDuty duty = (XmglDuty)this.jdbc.queryForOne(sql, new Object[]{did}, this);
	    return duty;
	}
	//获取职位表中的所有信息
	public List<XmglDuty> queryAllDuty(){
		String sql = "select * from xmgl_duty";
		List<XmglDuty> dutys = this.jdbc.queryForMany(sql, new Object[]{}, this);
		return dutys;
	}
	//添加一个职位
	public void insertDuty(XmglDuty duty){
		String sql = "insert into xmgl_duty values((select max(to_number(did))+1 from xmgl_duty),?,?,?)";
		System.out.println(duty.getDname()+"---"+duty.getDtext()
				
				+"--"+duty.getDpid());
		
		
		
		this.jdbc.update(sql, new Object[]{duty.getDname(),duty.getDtext(),duty.getDpid()});
	}
	//更新职位信息
	public void update(XmglDuty duty){
		String sql = "update xmgl_duty set dname=?,dtext=?,dpid = ? where did=?";
		this.jdbc.update(sql, new Object[]{duty.getDname(),duty.getDtext(),duty.getDpid(),duty.getDid()});
	}
	//分页查询职位表中所有职位信息
	public List<XmglDuty> getOnePage(int start,int end){
		String sql = "select dd.* from (select rownum as num,d.* from xmgl_duty d) dd where dd.num between ? and ?";
		List<XmglDuty> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//统计职位表中的记录总数
	public int getCount(){
		String sql="select count(*) as cou from xmgl_duty";
		int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	//删除一个职位信息
	public void deleteOne(String did){
		String sql = "delete from xmgl_duty where did=?";
		this.jdbc.update(sql, new Object[]{did});
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglDuty duty = new XmglDuty();
		duty.setDid(rs.getString("did"));
		duty.setDname(rs.getString("dname"));
		duty.setDpid(rs.getString("dpid"));
		duty.setDtext(rs.getString("dtext"));
		return duty;
	}
}
