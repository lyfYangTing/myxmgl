package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglProjb;
import po.XmglSclb;

import service.ProjbService;
import service.UserService;
import util.JdbcTemplate;
import util.RowMapper;

public class SclbDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	/**
	 *  ��ѯ�ϴ��ļ��б��е�����
	 */
	public List<XmglSclb> getAllScFile(){
		String sql = "select * from xmgl_sclb";
		return (List<XmglSclb>)this.jdbc.queryForMany(sql, new Object[]{},this);
	}
    /**
     * ��ҳ��ѯ
     */
	public List<XmglSclb> getOtherSclb(int start,int end){
		String sql="select nu.* from (select rownum as num,u.* from xmgl_sclb u) nu where num between ? and ?";
		List<XmglSclb> list = (List<XmglSclb>)this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//ͳ�Ʊ�������������
	public int getCount(){
		String sql="select count(*) as cou from xmgl_sclb";
		int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	//�����ϴ��ļ�id��ȡ�ü�¼��ϸ��Ϣ
	public XmglSclb getOneSclb(String scid){
		String sql = "select * from xmgl_sclb where scid=?";
		return (XmglSclb)this.jdbc.queryForOne(sql, new Object[]{scid}, this);
	}
	//�����ϴ��ļ�idɾ���ü�¼
	public void deleteSclb(String scid){
		String sql = "delete from xmgl_sclb where scid=?";
		this.jdbc.update(sql, new Object[]{scid});
	}
	//�����ϴ��ļ����ֻ�ȡ�ü�¼��ϸ��Ϣ
	public XmglSclb getOneByName(String scFileName){
		String sql = "select * from xmgl_sclb where scFileName=?";
		return (XmglSclb)this.jdbc.queryForOne(sql, new Object[]{scFileName}, this);
	}
	//����ļ���Ϣ
	public void insert(XmglSclb sclb){
		String sql ="insert into xmgl_sclb values((select max(to_number(scid))+1 from xmgl_sclb),?,?,?,?,?,?)";
		this.jdbc.update(sql, new Object[]{sclb.getScFileName(),sclb.getScUser(),sclb.getScTime(),sclb.getSuoShuXiangMu(),sclb.getScFileType(),sclb.getScFile()});
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglSclb sclb = new XmglSclb();
		sclb.setScFile(rs.getString("scFile"));
		sclb.setScFileName(rs.getString("scFileName"));
		sclb.setScFileType(rs.getString("scFileType"));
		sclb.setScId(rs.getString("scId"));
		sclb.setScTime(rs.getString("scTime"));
		sclb.setScUser(rs.getString("scUser"));
		sclb.setSuoShuXiangMu(rs.getString("suoShuXiangMu"));
		//�����ϴ�����Ϣ��ȡ�ϴ���������Ϣ
		UserService  userService = new UserService();
		sclb.setUser(userService.getOneUser(rs.getString("scUser")));
		//����������Ŀid��ȡ����Ŀ����ϸ��Ϣ
		ProjbService pro = new ProjbService();
		sclb.setProjb(pro.getOneProjb(rs.getString("suoShuXiangMu")));
		return sclb;
	}
}
