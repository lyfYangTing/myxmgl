package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglProjb;
import po.XmglPromk;
import po.XmglProxq;
import service.ProjbService;
import util.JdbcTemplate;
import util.RowMapper;

public class ProxqDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	//根据需求id得到需求的所有相关信息
	public XmglProxq getOneProxq(String pxid){
		String sql = "select * from xmgl_proxq where pxid=?";
		XmglProxq proxq = (XmglProxq)jdbc.queryForOne(sql, new Object[]{pxid}, this);
		return proxq;
	}
	//根据项目id即pjId获取该项目下的所有需求信息
	public List<XmglProxq> getAllProxqByPjis(String pjId){
		String sql ="select * from xmgl_proxq where pjid=?";
		List<XmglProxq> list = this.jdbc.queryForMany(sql, new Object[]{pjId}, this);
		return list;
	}
	
	/**
	 * 查询指定范围内的信息
	 * 
	 * */
	public List<XmglProxq> getPageProInfo(int beginIndex,int endIndex){
		String sql = "select prxq .* from (select rownum as num ,xp.* from xmgl_proxq xp)prxq where prxq .num between ? and ?";
		return (List<XmglProxq>)this.jdbc.queryForMany(sql, new Object[]{beginIndex,endIndex}, this);
		
	}
	/**
	 * 获取到表中基本信息的总数据，count
	 * */
	
	public int getCount(){
		String sql = "select count(*)as count from xmgl_proxq";
		return (Integer) jdbc.queryForOne(sql, new Object[]{}, new RowMapper() {
			public Object mapper(ResultSet rs) throws SQLException {
				return rs.getInt("count");
			}
		});
	}
	/**
	 * 修改需求
	 * */
	public void editXqInfo(String updateTime,String xqid,String xqtitle,String xqtext){
		String sql = "update xmgl_proxq set pxtitle = ?,pxtext = ?,txupdatetime = ? where pxid =?";
		this.jdbc.update(sql, new Object[]{xqtitle,xqtext,updateTime,xqid});
	}
	/**添加需求*/
	public void addXQInfo(String title,String ms,String prjid,String time){
		String sql = " insert into xmgl_proxq(pxid,pjid,pxtitle,pxtext,txcreatetime,txupdatetime) values((select max(to_number(nvl(pxid,0))) from xmgl_proxq)+1,?,?,?,?,?)";
		this.jdbc.update(sql, new Object[]{prjid,title,ms,time,time});
	}
	  /**删除表中数据*/
	public void deleteOne(String xqid){
		String sql = "delete from xmgl_proxq where pxid=?";
		this.jdbc.update(sql, new Object[]{xqid});
	}
	
	public Object mapper(ResultSet rs) throws SQLException {
		XmglProxq xmglProxq = new XmglProxq();
		xmglProxq.setPjId(rs.getString("pjId"));
		xmglProxq.setPxId(rs.getString("pxId"));
		xmglProxq.setPxText(rs.getString("pxText"));
		xmglProxq.setPxTitle(rs.getString("pxTitle"));
		xmglProxq.setTxCreateTime(rs.getString("txCreateTime"));
		xmglProxq.setTxUpdateTime(rs.getString("txUpdateTime"));
		
		//将项目基本信息放到需求中
		ProjbService projb = new ProjbService();
		XmglProjb xmglProjb = projb.getOneProjb(rs.getString("pjId"));
		xmglProxq.setXmglProjb(xmglProjb);
		return xmglProxq;
	}
}
