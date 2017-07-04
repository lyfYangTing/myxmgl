package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglRole;
import util.JdbcTemplate;
import util.RowMapper;

public class RoleDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	//���ݽ�ɫid��ȡ���������ɫ��������Ϣ
	public XmglRole getRole(String roid){
		String sql = "select * from xmgl_role where roid=?";
		XmglRole role = (XmglRole)jdbc.queryForOne(sql, new Object[]{roid}, this);
		return role;
	}
	//��ȡ��ɫ���е���������
	public List<XmglRole> getAllRoles(){
		String sql = "select * from xmgl_role";
		List<XmglRole> list = this.jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//����½�ɫ
	public void insert(XmglRole role){
		String sql="insert into xmgl_role values((select max(to_number(roid))+1 from xmgl_role),?,?)";
		this.jdbc.update(sql, new Object[]{role.getRoname(),role.getRtext()});
	}
	//���½�ɫ��Ϣ
	public void update(XmglRole role){
		String sql="update xmgl_role set roname=?,rtext=? where roid=? ";
		this.jdbc.update(sql, new Object[]{role.getRoname(),role.getRtext(),role.getRoid()});
	}
	//��ȡ�����������½�ɫidֵ
	public int getNewRoid(){
		String sql="select max(to_number(roid))+1 as cou from xmgl_role";
		int roid = (Integer) this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int roid = rs.getInt("cou");
				return roid;
			}
		});
		System.out.println("roleRoid===>"+roid);
		return roid;
	}
	//ɾ����ɫ
	public void deleteRole(String roid){
		String sql="delete from xmgl_role where roid=?";
		this.jdbc.update(sql, new Object[]{roid});
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglRole role = new XmglRole();
		role.setRoid(rs.getString("roid"));
		role.setRoname(rs.getString("roname"));
		role.setRtext(rs.getString("rtext"));
		return role;
	}
}
