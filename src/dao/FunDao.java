package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglFunc;

import util.JdbcTemplate;
import util.RowMapper;

public class FunDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	public List<XmglFunc>  getAllFuncsByRoid(String roid){
		String sql = "select  fun.* from xmgl_role_func rf,xmgl_func fun where rf.fuid=fun.fuid and rf.roid=?";
		List<XmglFunc> list = jdbc.queryForMany(sql, new Object[]{roid}, this);
		return list;
	}
	
	public List<XmglFunc> getAllFuncs(){
		String sql = "select * from xmgl_func";
		List<XmglFunc> list = this.jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//向角色中添加权限
	public void insertFunc(String roid,String fuid){
		String sql="insert into xmgl_role_func values(?,?)";
		this.jdbc.update(sql, new Object[]{roid,fuid});
	}
	//删除角色下的所有权限
	public void deleteFuncs(String roid){
		String sql = "delete from xmgl_role_func where roid=?";
		this.jdbc.update(sql, new Object[]{roid});
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglFunc func = new XmglFunc();
		func.setFuid(rs.getString("fuid"));
		func.setFuname(rs.getString("funame"));
		func.setPid(rs.getString("pid"));
		func.setFuhref(rs.getString("fhref"));
		return func;
	}
}
