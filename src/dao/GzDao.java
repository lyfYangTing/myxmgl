package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglGz;
import util.JdbcTemplate;
import util.RowMapper;

public class GzDao implements RowMapper{
	
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	
	//新增
	public void insert(XmglGz xmglGz){
		String sql = "insert into xmgl_gz (gid,guid ,granttime ,gdescrible,gotheraward,gkouchu,newstate,year,month) values ((select max(to_number(gid))+1 from xmgl_gz),?,?,?,?,?,'未发放',?,?)";
		System.out.println(xmglGz.getUid()+"-------------");
		System.out.println(xmglGz.getGrantTime()+"++++++++++++++");
		jdbc.update(sql,new Object[]{xmglGz.getUid(),xmglGz.getGrantTime(),xmglGz.getGdescrible(),xmglGz.getGotherAward(),xmglGz.getGkouChu(),xmglGz.getYear(),xmglGz.getMonth()});
	}
	
	
	//修改 
	public void update(XmglGz xmglGz ,String gid ){
		String  sql = "update xmgl_gz set newstate = ?, granttime = ? ,sumsal = ? where gid = ?";
		jdbc.update(sql,new Object[]{xmglGz.getState(),xmglGz.getGrantTime(),xmglGz.getSumSal(),gid});
	}
	
	//查询
	public List<XmglGz> queryAllGz(int beginIndex ,int endIndex){
		String sql = "select *  from  (select  rownum  num , xg.* ,xu.* from xmgl_gz  xg  ,xmgl_user  xu  where xg.guid = xu.uuid)  where  num between ? and  ?  ";
		return ( List<XmglGz> )jdbc.queryForMany(sql,new Object[]{beginIndex,endIndex},this);
		
	}
	
	//单条查询
	public Object loadGz(String gid){
		String sql = "select * from xmgl_gz  xg,xmgl_user  xu where xg.guid = xu.uuid and gid = ?";
		return (XmglGz)jdbc.queryForOne(sql,new Object[]{gid}, this);
	}
	
	//条件查询 
	public List<XmglGz> load(String year ,String month){
		String sql = "select  * from xmgl_gz  xg,xmgl_user  xu where xg.guid = xu.uuid and year = ? and month = ?";
		return jdbc.queryForMany(sql, new Object[]{year ,month},this);
	}
	
	public int count(){
		String sql = "select count(*)  from xmgl_gz ";
		int count = (Integer)jdbc.queryForOne(sql,new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("count(*)");
				return count;
			}
		});
		return  count ;
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglGz gz = new XmglGz();
		gz.setGid(rs.getString("gid"));
		gz.setGrantTime(rs.getString("grantTime"));
		gz.setGdescrible(rs.getString("gdescrible"));
		gz.setGotherAward(rs.getInt("gotherAward"));
		gz.setGkouChu(rs.getInt("gkouChu"));
		gz.setUbasepay(rs.getInt("ubasepay"));
		gz.setUbonus(rs.getInt("ubonus"));
		gz.setUname(rs.getString("uname"));
		gz.setUbuzhujin(rs.getInt("ubuzhujin"));
		gz.setState(rs.getString("newstate"));
		gz.setUid(rs.getString("guid"));
		gz.setYear(rs.getString("year"));
		gz.setMonth(rs.getString("month"));
		gz.setCreateTime(rs.getString("createTime"));
		return gz;
	}
}
