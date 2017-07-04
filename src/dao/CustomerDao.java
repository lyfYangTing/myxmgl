package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglCustomer;

import util.JdbcTemplate;
import util.RowMapper;

public class CustomerDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	//全表通查 查询表中所有数据
	public List<XmglCustomer> getAllCustomers(){
		String sql = "select * from xmgl_customer";
		List<XmglCustomer> list = jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//通过主键id 查询每个用户的全部信息
	public XmglCustomer getOneCustomers(String cid){
		String sql = "select * from xmgl_customer where cid=?";
		XmglCustomer customer = (XmglCustomer) jdbc.queryForOne(sql, new Object[]{cid}, this);
		return customer;
	}
	//根据公司名进行全表通查
	public List<XmglCustomer> getCustomersByName(String cname){
		String sql = "select * from xmgl_customer where cname=?";
		List<XmglCustomer> list = jdbc.queryForMany(sql, new Object[]{cname}, this);
		return list;
	}
	//分页查询
	public List getCustomersByCid(int start,int end){
		String sql = "select xc.* from (select rownum as num,c.* from xmgl_customer c) xc where num between ? and ?";
		List<XmglCustomer> list = jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//获取记录总条数
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
    //更新客户信息
	public void update(String cid,String cname,String clxr,String cdel,String caddress,String catime,String cbj){
		String sql = "update xmgl_customer set cname=?,clxr=?,ctel=?,caddress=?,catime=?,cbj=? where cid=?";
		this.jdbc.update(sql, new Object[]{cname,clxr,cdel,caddress,catime,cbj,cid});
	}
	//删除客户信息
	public void delete(String cid){
		String sql = "delete from xmgl_customer where cid=?";
		this.jdbc.update(sql, new Object[]{cid});
	}
	//插入一条数据
	public void insert(String cname,String clxr,String ctel,String caddress,String catime,String cbj){
		//必须将字符串类型的cid装换成number类型的 才可以取最大值 max(to_number(cid))就可以找到转换成数值的最大值主键
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
