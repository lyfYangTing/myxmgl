package util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcTemplate {
	
	//更新（增，删，改）任意表的数据
	public void update(String sql,Object[] obj){
		MyConnection conn = ConnectionPool.waitGetConnect();
		PreparedStatement sta = null;
		try {
			sta = conn.prepareStatement(sql);
			for(int i=1;i<=obj.length;i++){
				sta.setObject(i, obj[i-1]);
			}
			sta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				sta.close();
				conn.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
	}
	//可查询任意表中的一条记录并返回该条记录
	public Object queryForOne(String sql,Object[] obj,RowMapper rowMapper){
		MyConnection conn = ConnectionPool.waitGetConnect();
		Object mapper = null;
		ResultSet rs = null;
		PreparedStatement sta = null;
		try {
			 sta = conn.prepareStatement(sql);
			for(int i=1;i<=obj.length;i++){
				sta.setObject(i, obj[i-1]);
			}
			rs = sta.executeQuery();
			if(rs.next()){
				mapper = rowMapper.mapper(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				rs.close();
				sta.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mapper;
	}
	//可查询表中多条数据
	public List queryForMany(String sql,Object[] obj,RowMapper rowMapper){
		MyConnection conn = ConnectionPool.waitGetConnect();
		List list = new ArrayList();
		PreparedStatement sta  = null;
		ResultSet rs = null;
		try {
			//预处理 PrepareStatement(sql) sql语句中的值可以用动态参数代替  用时给动态参数赋值
			sta = conn.prepareStatement(sql);
			for(int i=1;i<=obj.length;i++){
				sta.setObject(i, obj[i-1]);
			}
			rs = sta.executeQuery();
			while(rs.next()){
				Object mapper = rowMapper.mapper(rs);
				list.add(mapper);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				rs.close();
				sta.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
