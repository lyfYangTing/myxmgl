package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglCustomer;
import po.XmglInfo;
import util.JdbcTemplate;
import util.RowMapper;

public class MessageDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	//������Ϣidֵɾ��һ����¼
	public void deleteMessage(String iid){
		String sql = "delete from xmgl_info where iid=?";
		this.jdbc.update(sql, new Object[]{iid});
	}
	//����Ϣ�������һ������
	public void insertMessage(XmglInfo info){
		String sql = "insert into xmgl_info values((select max(to_number(iid))+1 from xmgl_info),?,?,?,?,?,?)";
		this.jdbc.update(sql, new Object[]{info.getItitle(),info.getIfjr(),info.getIsjr(),info.getIftime(),info.getItext(),info.getIctime()});
	}
	//������Ϣ���еĲ鿴ʱ��
	public void updateChaTime(String iid,String ctime){
		String sql = "update xmgl_info set ictime=? where iid=?";
		this.jdbc.update(sql, new Object[]{ctime,iid});
	}
//	//�鿴�ռ��˻��߷�����Ϊ��ǰ��¼�˵�������Ϣ
//	public List<XmglInfo> getUserAllInfo(String uid){
//		String sql = "select * from xmgl_info where ifjr=? or isjr=?";
//		List<XmglInfo> list = this.jdbc.queryForMany(sql, new Object[]{uid,uid}, this);
//		return list;
//	}
	//��ҳ��ѯ �鿴�ռ��˻��߷�����Ϊ��ǰ��¼�˵�������Ϣ�ļ�¼������
	public List getInformsByIid(String uid,int start,int end){
		String sql = "select xc.* from (select rownum as num,c.* from xmgl_info c where c.ifjr=? or c.isjr=?) xc where num between ? and ?";
		List<XmglInfo> list = jdbc.queryForMany(sql, new Object[]{uid,uid,start,end}, this);
		return list;
	}
	//��ȡ��¼������
	public int getCountsByUid(String uid){
		String sql = "select count(*) as cou from xmgl_info where ifjr=? or isjr=? ";
		int count =(Integer)jdbc.queryForOne(sql, new Object[]{uid,uid}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	
	
	
	//��ҳ��ѯ�鿴�ռ���Ϊ��ǰ��¼�˵�������Ϣ
	public List getsjrInformsByIid(String uid,int start,int end){
		String sql = "select xc.* from (select rownum as num,c.* from xmgl_info c where c.isjr=?) xc where num between ? and ?";
		List<XmglInfo> list = jdbc.queryForMany(sql, new Object[]{uid,start,end}, this);
		return list;
	}
	//��ȡ�ռ���Ϊ��ǰ��¼�˵�������Ϣ��¼������
	public int getsjrCounts(String uid){
		String sql = "select count(*) as cou from xmgl_info where isjr=? ";
		int count =(Integer)jdbc.queryForOne(sql, new Object[]{uid}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	
	
	
	//��ҳ��ѯ�鿴������Ϊ��ǰ��¼�˵�������Ϣ
	public List getfjrInformsByIid(String uid,int start,int end){
		String sql = "select xc.* from (select rownum as num,c.* from xmgl_info c where c.ifjr=?) xc where num between ? and ?";
		List<XmglInfo> list = jdbc.queryForMany(sql, new Object[]{uid,start,end}, this);
		return list;
	}
	//��ȡ������Ϊ��ǰ��¼�˵�������Ϣ��¼������
	public int getfjrCounts(String uid){
		String sql = "select count(*) as cou from xmgl_info where ifjr=? ";
		int count =(Integer)jdbc.queryForOne(sql, new Object[]{uid}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	
	
	//��ȡһ����Ϣ����ϸ����
	public XmglInfo getOneInfoByIid(String iid){
		String sql = "select * from xmgl_info where iid=?";
		XmglInfo info = (XmglInfo)this.jdbc.queryForOne(sql, new Object[]{iid}, this);
		return info;
	}
//	//�鿴�ռ���Ϊ��ǰ��¼�˵�������Ϣ
//	public List<XmglInfo> getUsersjrInfo(String uid){
//		String sql = "select * from xmgl_info where isjr=?";
//		List<XmglInfo> list = this.jdbc.queryForMany(sql, new Object[]{uid}, this);
//		return list;
//	}
//	//�鿴������Ϊ��ǰ��¼�˵�������Ϣ
//	public List<XmglInfo> getUserfjrInfo(String uid){
//		String sql = "select * from xmgl_info where ifjr=?";
//		List<XmglInfo> list = this.jdbc.queryForMany(sql, new Object[]{uid}, this);
//		return list;
//	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglInfo info = new XmglInfo();
		info.setLid(rs.getString("iid"));
		info.setItitle(rs.getString("ititle"));
		info.setIfjr(rs.getString("ifjr"));
		info.setIsjr(rs.getString("isjr"));
		info.setIftime(rs.getString("iftime"));
		info.setIctime(rs.getString("ictime"));
		info.setItext(rs.getString("itext"));
		return info;
	}
}
