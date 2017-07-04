package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglRwlx;

import util.JdbcTemplate;
import util.RowMapper;

public class RwlxDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	public List<XmglRwlx> getAllRwlx(){
		String sql = "select * from xmgl_rwlx";
		return (List<XmglRwlx>)this.jdbc.queryForMany(sql, new Object[]{}, this);
	}
    public XmglRwlx getOneRwlx(String rwid){
    	String sql = "select * from xmgl_rwlx where rwid=?";
    	return (XmglRwlx)this.jdbc.queryForOne(sql, new Object[]{rwid}, this);
    }
	public Object mapper(ResultSet rs) throws SQLException {
		XmglRwlx rwlx = new XmglRwlx();
		rwlx.setRwId(rs.getString("rwid"));
		rwlx.setRwName(rs.getString("rwName"));
		return rwlx;
	}
}
