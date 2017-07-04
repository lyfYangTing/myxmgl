package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglProgn;
import po.XmglPromk;
import util.JdbcTemplate;
import util.RowMapper;

public class GongNengDao implements RowMapper{

	//���õײ��װ�õĿ�ܣ������ݿ���в���
	private JdbcTemplate jt = new JdbcTemplate();
	private PromkDao promkDao = new PromkDao();
	
	/**��ȡ���е�����������*/
	public int getCount(){
		String sql = "select count(*) as count from xmgl_progn ";
		return (Integer) this.jt.queryForOne(sql, new Object[]{}, new RowMapper() {			
			public Object mapper(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				return rs.getInt("count");
			}
		});
	}
	
	/**��ѯָ����Χ�ڵ���Ϣ*/
	@SuppressWarnings("unchecked")
	public List<XmglProgn> getPageProInfo(int beginIndex,int endIndex){
		String sql = "select prgn .* from (select rownum as num ,xp.* from xmgl_progn xp)prgn where prgn .num between ? and ?";
		return (List<XmglProgn>) this.jt.queryForMany(sql, new Object[]{beginIndex,endIndex}, this);
	}
	/**��ѯָ������id����Ϣ*/
	public XmglProgn getGnById(String gnid){
		String sql = "select * from xmgl_progn where pgid = ?";
		return (XmglProgn) this.jt.queryForOne(sql, new Object[]{gnid}, this);
	}
	/**��ѯһ��ģ���µ����� ���� ����pmid���в�ѯ*/
	public List<XmglProgn> getGnByPmid(String pmid){
		String sql = "select * from xmgl_progn where pmid = ?";
		return (List<XmglProgn>) this.jt.queryForMany(sql, new Object[]{pmid}, this);
	}
	
	
	
	
	/**���ݹ���id���������Ĺ�������������*/
	public void updateGnXqms(String gnid,String gnxqms){
		String sql = "update xmgl_progn set pgxqms = ? where pgid = ?";
		this.jt.update(sql, new Object[]{gnxqms,gnid});
	}
	/**���ݹ���id��ɾ������*/
	public void deleteGnById(String gnid){
		String sql = "delete xmgl_progn where pgid = ?";
		this.jt.update(sql, new Object[]{gnid});
	}
	/**���ӹ���*/
	public void addGn(XmglProgn xmglProgn){
		String sql = "insert into xmgl_progn(pgid,pmid,pgname,pgxqms,pgyxj)values((select max(to_number(nvl(pgid,0)))from xmgl_progn)+1,?,?,?,?)";
		this.jt.update(sql, new Object[]{xmglProgn.getPmId(),xmglProgn.getPgName(),xmglProgn.getPgXqms(),xmglProgn.getGnyxj()});
	}
	/**�༭����*/
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
