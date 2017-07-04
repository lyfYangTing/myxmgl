package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglCustomer;
import po.XmglProjb;
import po.XmglUser;

import service.CustomerService;
import service.UserService;
import util.JdbcTemplate;
import util.RowMapper;

public class ProjbDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	//һ����Ŀ�Ļ������ݣ���ѯ�������ݣ�
	public XmglProjb getOneProjb(String pjid){
		String sql = "select * from xmgl_projb where pjid=?";
		XmglProjb projb = (XmglProjb)jdbc.queryForOne(sql, new Object[]{pjid}, this);
		return projb;
	}
	//��ȡ��Ŀ�������е���������
	public List<XmglProjb> getAllProjb(){
		String sql="select * from xmgl_projb";
		List<XmglProjb> list = jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//һ����˾��������Ŀ�Ļ�������
	public List<XmglProjb> getProjbBycname(String cid){
		String sql="select * from xmgl_projb where pjCid=?";
		List<XmglProjb> list = jdbc.queryForMany(sql, new Object[]{cid}, this);
		return list;
	}
	//��ҳ��ѯ
	public List<XmglProjb> getOtherProjb(int start,int end){
		String sql="select nu.* from (select rownum as num,u.* from xmgl_projb u) nu where num between ? and ?";
		List<XmglProjb> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//ͳ�Ʊ�������������
	public int getCount(){
		String sql="select count(*) as cou from xmgl_projb";
		int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	
	
	//����Ŀ���Ʋ�ѯ����Ŀ
	public XmglProjb geProjbByName(String pjname){
		String sql="select * from xmgl_projb u where pjname=?";
		XmglProjb projb =(XmglProjb)this.jdbc.queryForOne(sql, new Object[]{pjname},this);
		return projb;
	}
	
	//ɾ����������
	public void deleteOne(String pjid){
		String sql = "delete from xmgl_projb where pjid=?";
		this.jdbc.update(sql, new Object[]{pjid});
	}
	//����Ŀ������Ϣ�༭ʱ�����ݽ��и���
	public void updateOne(String prno,String proname,String clientno,String promoney,String pronum,String proManager,String proidcomplete,String prozmoney,String probeginDate,String procompeteDate,String promission,String probeizhu,String pjUpdateTime){
		String sql = "update xmgl_projb set pjname = ? , pjcid = ? , pjmoney = ?,pjuid = ? , pjsjwctime = ? , pjsjzcb = ?,pjsjkftime = ? , pjstate = ? , pjyxj = ?,pjbz = ? ,pjUpdateTime=? where pjid = ?";
		this.jdbc.update(sql, new Object[]{proname,clientno,promoney,proManager,procompeteDate,prozmoney,probeginDate,proidcomplete,promission,probeizhu,pjUpdateTime,prno
		});
	}
	/** 
	 * "jsps/xmglPrjAddInfo.jsp"ҳ���ϵ��"�����Ŀ"���ܣ����������Ŀ
	 * ��Ҫ��ӵ�xmgl_projb���е������У�
	 * ��Ŀ����---proname
	 * ��Ŀ���---promoney
	 * ��Ŀ����---proManager
	 * Ԥ���ܳɱ�---proyszmoney
	 * �ƻ��������---projhcompeteDate
	 * ������λ---clientno
	 * ��������---pronum
	 * ���״̬---proidcomplete
	 * �ƻ���������---projhbeginDate
	 * ���ȼ�---promission
	 * ��ע---probeizhu
	 * */
	public void insertPrjInfo(String proname,String clientno,String promoney,
			String pronum,String proManager,String proidcomplete,String prozmoney,	
			String probeginDate,String procompeteDate,String promission,String probeizhu,String pjLxsj){
		String sql = "insert into xmgl_projb (pjid,pjname,pjcid,pjmoney,pjdevelopertotal,pjuid,pjstate,pjyszcb,pjkfdate,pjwcdate,pjyxj,pjbz,pjLxsj) values((select max(to_number(pjid))+1 from xmgl_projb),?,?,?,?,?,?,?,?,?,?,?,?)";
		this.jdbc.update(sql, new Object[]{proname,clientno,promoney,pronum,proManager,proidcomplete,prozmoney,probeginDate,procompeteDate,promission,probeizhu,pjLxsj});
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglProjb projb = new XmglProjb();
		projb.setPjBz(rs.getString("pjbz"));
		projb.setPjCid(rs.getString("pjcid"));
		projb.setPjDeveloperTotal(rs.getLong("pjDeveloperTotal"));
		projb.setPjId(rs.getString("pjid"));
		projb.setPjKfdate(rs.getString("pjKfdate"));
		projb.setPjLxsj(rs.getString("pjLxsj"));
		projb.setPjMoney(rs.getLong("pjMoney"));
		projb.setPjName(rs.getString("pjName"));
		projb.setPjSjkfTime(rs.getString("PjSjkfTime"));
        projb.setPjSjwcTime(rs.getString("pjSjwcTime"));
        projb.setPjState(rs.getString("pjState"));
        projb.setPjUid(rs.getString("pjUid"));
        projb.setPjUpdateTime(rs.getString("pjUpdateTime"));
        projb.setPjWcdate(rs.getString("pjWcdate"));
        projb.setPjYszcb(rs.getLong("pjyszcb"));
        projb.setPjYxj(rs.getString("pjYxj"));
        projb.setPjSjzcb(rs.getLong("pjsjzcb"));
        /*��ȡ��ÿ����Ŀ������Ӧ�Ŀͻ���˾*/
        String pjcid = rs.getString("pjcid");
        CustomerService customer = new CustomerService();
        XmglCustomer xmglCustomer = customer.getOneCustomer(pjcid);
        /*��ȡ��ÿ����Ŀ������Ӧ�ĸ�����*/
        String pjuid = rs.getString("pjuid");
        UserService user = new UserService();
        XmglUser xmglUser = user.getOneUser(pjuid);
        /*������ֵ����Ӧ��������*/
        projb.setXmglCustomer(xmglCustomer);
        projb.setXmglUser(xmglUser);

		return projb;
	}
}
