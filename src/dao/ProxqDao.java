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
	//��������id�õ���������������Ϣ
	public XmglProxq getOneProxq(String pxid){
		String sql = "select * from xmgl_proxq where pxid=?";
		XmglProxq proxq = (XmglProxq)jdbc.queryForOne(sql, new Object[]{pxid}, this);
		return proxq;
	}
	//������Ŀid��pjId��ȡ����Ŀ�µ�����������Ϣ
	public List<XmglProxq> getAllProxqByPjis(String pjId){
		String sql ="select * from xmgl_proxq where pjid=?";
		List<XmglProxq> list = this.jdbc.queryForMany(sql, new Object[]{pjId}, this);
		return list;
	}
	
	/**
	 * ��ѯָ����Χ�ڵ���Ϣ
	 * 
	 * */
	public List<XmglProxq> getPageProInfo(int beginIndex,int endIndex){
		String sql = "select prxq .* from (select rownum as num ,xp.* from xmgl_proxq xp)prxq where prxq .num between ? and ?";
		return (List<XmglProxq>)this.jdbc.queryForMany(sql, new Object[]{beginIndex,endIndex}, this);
		
	}
	/**
	 * ��ȡ�����л�����Ϣ�������ݣ�count
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
	 * �޸�����
	 * */
	public void editXqInfo(String updateTime,String xqid,String xqtitle,String xqtext){
		String sql = "update xmgl_proxq set pxtitle = ?,pxtext = ?,txupdatetime = ? where pxid =?";
		this.jdbc.update(sql, new Object[]{xqtitle,xqtext,updateTime,xqid});
	}
	/**�������*/
	public void addXQInfo(String title,String ms,String prjid,String time){
		String sql = " insert into xmgl_proxq(pxid,pjid,pxtitle,pxtext,txcreatetime,txupdatetime) values((select max(to_number(nvl(pxid,0))) from xmgl_proxq)+1,?,?,?,?,?)";
		this.jdbc.update(sql, new Object[]{prjid,title,ms,time,time});
	}
	  /**ɾ����������*/
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
		
		//����Ŀ������Ϣ�ŵ�������
		ProjbService projb = new ProjbService();
		XmglProjb xmglProjb = projb.getOneProjb(rs.getString("pjId"));
		xmglProxq.setXmglProjb(xmglProjb);
		return xmglProxq;
	}
}
