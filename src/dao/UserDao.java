package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglDuty;
import po.XmglRole;
import po.XmglUser;
import service.DutyService;
import service.RoleService;
import util.JdbcTemplate;
import util.RowMapper;

public class UserDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	//根据员工id获取员工详细信息
	public XmglUser getOneUser(String uid){
		String sql = "select * from xmgl_user where uuid=?";
		XmglUser user = (XmglUser)jdbc.queryForOne(sql, new Object[]{uid},this);
		return user;
	}
	//查询(职位和系统角色都需要满足一定条件的用户) 职位是项目经理edid=5 并且 在系统中的角色是基层管理即uroid=3的所有人员的信息
	public List<XmglUser> getAllXmjl(String edid,String uroid){
		String sql = "select * from xmgl_user where edid=? and uroid=?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{edid,uroid}, this);
		return list;
	}
	//分页查询
	public List<XmglUser> getOtherUsers(int start,int end){
		String sql="select nu.* from (select rownum as num,u.* from xmgl_user u) nu where num between ? and ?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//统计表中数据总条数
	public int getCount(){
		String sql="select count(*) as cou from xmgl_user";
		int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	//全表通查
	public List<XmglUser> getAllUsers(){
		String sql = "select * from xmgl_user";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//实现新增（uuid为空）和更新（存在uuid）
	public void update(XmglUser user){
		String edid = user.getEdid();
		String entryDate = user.getEntryDate();
		String uaddress = user.getUaddress();
		Long uage = user.getUage();
		String ubank = user.getUbank();
		String uabnkAccout = user.getUbankAccount();
		Long ubasePay = user.getUbasePay();
		String ubirthday = user.getUbirthday();
		Long ubonus = user.getUbonus();
		Long buzhujin = user.getUbuzhujin();
		String udescrible = user.getUdescrible();
		String uemail = user.getUemail();
		String uidcard = user.getuIDcard();
		String uname = user.getUname();
		String upassword = user.getUpassword();
		String upid  = user.getUpid();
		String uroid = user.getUroid();
        String usex = user.getUsex();
		String ustafftype = user.getUstaffType();
		String utelephone = user.getUtelephone();
		String uuid = user.getUid();
		XmglUser oneUser = this.getOneUser(uuid);
		String sql = null;
		if(oneUser!=null){//如果存在员工唯一编号，执行更新操作，否则执行新增操作
			sql = "update xmgl_user set edid = ?,entryDate = ?,uaddress = ?,uage = ?,ubank = ?,ubankaccount = ?,ubasepay = ? , ubirthday = ?,ubonus = ? , ubuzhujin = ? , udescrible = ?,uemail = ?,uidcard = ?,uname = ? , upassword = ?,upid = ?,uroid = ?,usex = ?,ustafftype = ? , utelephone = ? where uuid = ?";
		}else{
			sql = "insert into xmgl_user(edid,entryDate,uaddress,uage,ubank,ubankaccount,ubasePay,ubirthday,ubonus,ubuzhujin,udescrible,uemail,uidcard,uname,upassword,upid,uroid,usex,ustafftype,utelephone,uuid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		}
		this.jdbc.update(sql, new Object[]{edid,entryDate,uaddress,uage,ubank,uabnkAccout,ubasePay,ubirthday,ubonus,buzhujin,udescrible,uemail,
				uidcard,uname,upassword,upid,uroid,usex,ustafftype,utelephone,uuid	
		});
	}
	//删除一条记录
	public void delete(String uuid){
		String sql = "delete from xmgl_user where uuid=?";
		this.jdbc.update(sql, new Object[]{uuid});
	}
	//根据员工职位id 查询出一个职位的所有人
	public List<XmglUser> getAllUserByDid(String edid){
		String sql = "select * from xmgl_user where edid=?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{edid}, this);
		return list;
	}
	//根据pid查询出领导是同一个人的部门成员
	public List<XmglUser> getAllUserByPid(String upid){
		String sql = "select * from xmgl_user where upid=?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{upid}, this);
		return list;
	}
	public Object mapper(ResultSet rs) throws SQLException {
        XmglUser xmglUser = new XmglUser();
    	xmglUser.setUid(rs.getString("uuid"));
		xmglUser.setEdid(rs.getString("edid"));
		xmglUser.setEntryDate(rs.getString("entryDate"));
		xmglUser.setUaddress(rs.getString("uaddress"));
		xmglUser.setUage(rs.getLong("uage"));
		xmglUser.setUbank(rs.getString("ubank"));
		xmglUser.setUbankAccount(rs.getString("ubankaccount"));
		xmglUser.setUbasePay(rs.getLong("ubasepay"));
		xmglUser.setUbirthday(rs.getString("ubirthday"));
		xmglUser.setUbonus(rs.getLong("ubonus"));
		xmglUser.setUbuzhujin(rs.getLong("ubuzhujin"));
		xmglUser.setUdescrible(rs.getString("udescrible"));
		xmglUser.setUemail(rs.getString("uemail"));
		xmglUser.setuIDcard(rs.getString("uidcard"));
		xmglUser.setUname(rs.getString("uname"));
		xmglUser.setUpassword(rs.getString("upassword"));
		xmglUser.setUpid(rs.getString("upid"));
		xmglUser.setUroid(rs.getString("uroid"));
		xmglUser.setUsex(rs.getString("usex"));
		xmglUser.setUstaffType(rs.getString("ustafftype"));
		xmglUser.setUtelephone(rs.getString("utelephone"));
		//显示角色名称
		RoleService dao = new RoleService();
		XmglRole role = dao.getOneRole(rs.getString("uroid"));
		//显示职位名称
		DutyService service = new DutyService();
		XmglDuty duty = service.getOneDuty(rs.getString("edid"));
		xmglUser.setDuty(duty);
		xmglUser.setRole(role);
		return xmglUser;
	}
}
