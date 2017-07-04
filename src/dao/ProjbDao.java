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
	
	//一个项目的基本数据（查询单条数据）
	public XmglProjb getOneProjb(String pjid){
		String sql = "select * from xmgl_projb where pjid=?";
		XmglProjb projb = (XmglProjb)jdbc.queryForOne(sql, new Object[]{pjid}, this);
		return projb;
	}
	//获取项目基本表中的所有数据
	public List<XmglProjb> getAllProjb(){
		String sql="select * from xmgl_projb";
		List<XmglProjb> list = jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//一个公司的所有项目的基本数据
	public List<XmglProjb> getProjbBycname(String cid){
		String sql="select * from xmgl_projb where pjCid=?";
		List<XmglProjb> list = jdbc.queryForMany(sql, new Object[]{cid}, this);
		return list;
	}
	//分页查询
	public List<XmglProjb> getOtherProjb(int start,int end){
		String sql="select nu.* from (select rownum as num,u.* from xmgl_projb u) nu where num between ? and ?";
		List<XmglProjb> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//统计表中数据总条数
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
	
	
	//按项目名称查询该项目
	public XmglProjb geProjbByName(String pjname){
		String sql="select * from xmgl_projb u where pjname=?";
		XmglProjb projb =(XmglProjb)this.jdbc.queryForOne(sql, new Object[]{pjname},this);
		return projb;
	}
	
	//删除表中数据
	public void deleteOne(String pjid){
		String sql = "delete from xmgl_projb where pjid=?";
		this.jdbc.update(sql, new Object[]{pjid});
	}
	//在项目基本信息编辑时对数据进行更新
	public void updateOne(String prno,String proname,String clientno,String promoney,String pronum,String proManager,String proidcomplete,String prozmoney,String probeginDate,String procompeteDate,String promission,String probeizhu,String pjUpdateTime){
		String sql = "update xmgl_projb set pjname = ? , pjcid = ? , pjmoney = ?,pjuid = ? , pjsjwctime = ? , pjsjzcb = ?,pjsjkftime = ? , pjstate = ? , pjyxj = ?,pjbz = ? ,pjUpdateTime=? where pjid = ?";
		this.jdbc.update(sql, new Object[]{proname,clientno,promoney,proManager,procompeteDate,prozmoney,probeginDate,proidcomplete,promission,probeizhu,pjUpdateTime,prno
		});
	}
	/** 
	 * "jsps/xmglPrjAddInfo.jsp"页面上点击"添加项目"功能，进行添加项目
	 * 需要添加到xmgl_projb表中的属性有：
	 * 项目名称---proname
	 * 项目金额---promoney
	 * 项目经理---proManager
	 * 预算总成本---proyszmoney
	 * 计划完成日期---projhcompeteDate
	 * 所属单位---clientno
	 * 开发人数---pronum
	 * 完成状态---proidcomplete
	 * 计划开发日期---projhbeginDate
	 * 优先级---promission
	 * 备注---probeizhu
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
        /*获取到每个项目下所对应的客户公司*/
        String pjcid = rs.getString("pjcid");
        CustomerService customer = new CustomerService();
        XmglCustomer xmglCustomer = customer.getOneCustomer(pjcid);
        /*获取到每个项目下所对应的负责人*/
        String pjuid = rs.getString("pjuid");
        UserService user = new UserService();
        XmglUser xmglUser = user.getOneUser(pjuid);
        /*将对象赋值到相应的属性中*/
        projb.setXmglCustomer(xmglCustomer);
        projb.setXmglUser(xmglUser);

		return projb;
	}
}
