package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglProgn;
import po.XmglPromk;
import util.JdbcTemplate;
import util.RowMapper;

public class GongNengDao implements RowMapper{

	//调用底层封装好的框架，对数据库进行操作
	private JdbcTemplate jt = new JdbcTemplate();
	private PromkDao promkDao = new PromkDao();
	
	/**获取表中的数据总条数*/
	public int getCount(){
		String sql = "select count(*) as count from xmgl_progn ";
		return (Integer) this.jt.queryForOne(sql, new Object[]{}, new RowMapper() {			
			public Object mapper(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				return rs.getInt("count");
			}
		});
	}
	
	/**查询指定范围内的信息*/
	@SuppressWarnings("unchecked")
	public List<XmglProgn> getPageProInfo(int beginIndex,int endIndex){
		String sql = "select prgn .* from (select rownum as num ,xp.* from xmgl_progn xp)prgn where prgn .num between ? and ?";
		return (List<XmglProgn>) this.jt.queryForMany(sql, new Object[]{beginIndex,endIndex}, this);
	}
	/**查询指定功能id的信息*/
	public XmglProgn getGnById(String gnid){
		String sql = "select * from xmgl_progn where pgid = ?";
		return (XmglProgn) this.jt.queryForOne(sql, new Object[]{gnid}, this);
	}
	/**查询一个模块下的所有 功能 根据pmid进行查询*/
	public List<XmglProgn> getGnByPmid(String pmid){
		String sql = "select * from xmgl_progn where pmid = ?";
		return (List<XmglProgn>) this.jt.queryForMany(sql, new Object[]{pmid}, this);
	}
	
	
	
	
	/**根据功能id，变更下面的功能需求描述列*/
	public void updateGnXqms(String gnid,String gnxqms){
		String sql = "update xmgl_progn set pgxqms = ? where pgid = ?";
		this.jt.update(sql, new Object[]{gnxqms,gnid});
	}
	/**根据功能id，删除功能*/
	public void deleteGnById(String gnid){
		String sql = "delete xmgl_progn where pgid = ?";
		this.jt.update(sql, new Object[]{gnid});
	}
	/**增加功能*/
	public void addGn(XmglProgn xmglProgn){
		String sql = "insert into xmgl_progn(pgid,pmid,pgname,pgxqms,pgyxj)values((select max(to_number(nvl(pgid,0)))from xmgl_progn)+1,?,?,?,?)";
		this.jt.update(sql, new Object[]{xmglProgn.getPmId(),xmglProgn.getPgName(),xmglProgn.getPgXqms(),xmglProgn.getGnyxj()});
	}
	/**编辑功能*/
	public void updateGn(XmglProgn xmglProgn) {
		// TODO Auto-generated method stub
		String sql = "update xmgl_progn set pgname = ?,pgtext = ?,pgyxj = ? where pgid = ? ";
		this.jt.update(sql, new Object[]{xmglProgn.getPgName(),xmglProgn.getPgText(),xmglProgn.getGnyxj(),xmglProgn.getPgId()});
		
	}
	public Object mapper(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		XmglProgn xmglProgn = new XmglProgn();
		xmglProgn.setPgId(rs.getString("pgId"));
		xmglProgn.setPgName(rs.getString("pgName"));
		xmglProgn.setPgText(rs.getString("pgText"));
		xmglProgn.setPgXqms(rs.getString("pgXqms"));
		xmglProgn.setTxCreateTime(rs.getString("txCreateTime"));
		XmglPromk xmglPromk = promkDao.getOnePromk(rs.getString("pmId"));
		xmglProgn.setXmglPromk(xmglPromk);
		xmglProgn.setGnyxj(rs.getString("pgyxj"));
		return xmglProgn;
	}
}
