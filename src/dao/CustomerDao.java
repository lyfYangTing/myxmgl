package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglCustomer;

import util.JdbcTemplate;
import util.RowMapper;

public class CustomerDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	//ȫ��ͨ�� ��ѯ������������
	public List<XmglCustomer> getAllCustomers(){
		String sql = "select * from xmgl_customer";
		List<XmglCustomer> list = jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//ͨ������id ��ѯÿ���û���ȫ����Ϣ
	public XmglCustomer getOneCustomers(String cid){
		String sql = "select * from xmgl_customer where cid=?";
		XmglCustomer customer = (XmglCustomer) jdbc.queryForOne(sql, new Object[]{cid}, this);
		return customer;
	}
	//���ݹ�˾������ȫ��ͨ��
	public List<XmglCustomer> getCustomersByName(String cname){
		String sql = "select * from xmgl_customer where cname=?";
		List<XmglCustomer> list = jdbc.queryForMany(sql, new Object[]{cname}, this);
		return list;
	}
	//��ҳ��ѯ
	public List getCustomersByCid(int start,int end){
		String sql = "select xc.* from (select rownum as num,c.* from xmgl_customer c) xc where num between ? and ?";
		List<XmglCustomer> list = jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//��ȡ��¼������
	public int getCounts(){
		String sql = "select count(*) as cou from xmgl_customer";
		int count =(Integer)jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
    //���¿ͻ���Ϣ
	public void update(String cid,String cname,String clxr,String cdel,String caddress,String catime,String cbj){
		String sql = "update xmgl_customer set cname=?,clxr=?,ctel=?,caddress=?,catime=?,cbj=? where cid=?";
		this.jdbc.update(sql, new Object[]{cname,clxr,cdel,caddress,catime,cbj,cid});
	}
	//ɾ���ͻ���Ϣ
	public void delete(String cid){
		String sql = "delete from xmgl_customer where cid=?";
		this.jdbc.update(sql, new Object[]{cid});
	}
	//����һ������
	public void insert(String cname,String clxr,String ctel,String caddress,String catime,String cbj){
		//���뽫�ַ������͵�cidװ����number���͵� �ſ���ȡ���ֵ max(to_number(cid))�Ϳ����ҵ�ת������ֵ�����ֵ����
		String sql ="insert into xmgl_customer values((select max(to_number(cid))+1 from xmgl_customer),?,?,?,?,?,?)";
		this.jdbc.update(sql, new Object[]{clxr,ctel,caddress,cbj,catime,cname});
	} 
	public Object mapper(ResultSet rs) throws SQLException {
		XmglCustomer xmglCustomer = new XmglCustomer();
		xmglCustomer.setCaddress(rs.getString("caddress"));
		xmglCustomer.setCatime(rs.getString("catime"));
		xmglCustomer.setCbj(rs.getString("cbj"));
		xmglCustomer.setCid(rs.getString("cid"));
		xmglCustomer.setCname(rs.getString("cname"));
		xmglCustomer.setClxr(rs.getString("clxr"));
		xmglCustomer.setCtel(rs.getString("ctel"));
		return xmglCustomer;
	}
}
