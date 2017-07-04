package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglDuty;
import util.JdbcTemplate;
import util.RowMapper;

public class DutyDao implements RowMapper{
	
	private JdbcTemplate jdbc = new JdbcTemplate();
	//��������id��ȡ��ְλ����ϸ��Ϣ
	public XmglDuty queryOneByDid(String did){
		String sql = "select * from xmgl_duty where did=?";
		XmglDuty duty = (XmglDuty)this.jdbc.queryForOne(sql, new Object[]{did}, this);
	    return duty;
	}
	//��ȡְλ���е�������Ϣ
	public List<XmglDuty> queryAllDuty(){
		String sql = "select * from xmgl_duty";
		List<XmglDuty> dutys = this.jdbc.queryForMany(sql, new Object[]{}, this);
		return dutys;
	}
	//���һ��ְλ
	public void insertDuty(XmglDuty duty){
		String sql = "insert into xmgl_duty values((select max(to_number(did))+1 from xmgl_duty),?,?,?)";
		System.out.println(duty.getDname()+"---"+duty.getDtext()
				
				+"--"+duty.getDpid());
		
		
		
		this.jdbc.update(sql, new Object[]{duty.getDname(),duty.getDtext(),duty.getDpid()});
	}
	//����ְλ��Ϣ
	public void update(XmglDuty duty){
		String sql = "update xmgl_duty set dname=?,dtext=?,dpid = ? where did=?";
		this.jdbc.update(sql, new Object[]{duty.getDname(),duty.getDtext(),duty.getDpid(),duty.getDid()});
	}
	//��ҳ��ѯְλ��������ְλ��Ϣ
	public List<XmglDuty> getOnePage(int start,int end){
		String sql = "select dd.* from (select rownum as num,d.* from xmgl_duty d) dd where dd.num between ? and ?";
		List<XmglDuty> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//ͳ��ְλ���еļ�¼����
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
	//ɾ��һ��ְλ��Ϣ
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
