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
	//����Ա��id��ȡԱ����ϸ��Ϣ
	public XmglUser getOneUser(String uid){
		String sql = "select * from xmgl_user where uuid=?";
		XmglUser user = (XmglUser)jdbc.queryForOne(sql, new Object[]{uid},this);
		return user;
	}
	//��ѯ(ְλ��ϵͳ��ɫ����Ҫ����һ���������û�) ְλ����Ŀ����edid=5 ���� ��ϵͳ�еĽ�ɫ�ǻ������uroid=3��������Ա����Ϣ
	public List<XmglUser> getAllXmjl(String edid,String uroid){
		String sql = "select * from xmgl_user where edid=? and uroid=?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{edid,uroid}, this);
		return list;
	}
	//��ҳ��ѯ
	public List<XmglUser> getOtherUsers(int start,int end){
		String sql="select nu.* from (select rownum as num,u.* from xmgl_user u) nu where num between ? and ?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
		return list;
	}
	//ͳ�Ʊ�������������
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
	//ȫ��ͨ��
	public List<XmglUser> getAllUsers(){
		String sql = "select * from xmgl_user";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{}, this);
		return list;
	}
	//ʵ��������uuidΪ�գ��͸��£�����uuid��
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
		if(oneUser!=null){//�������Ա��Ψһ��ţ�ִ�и��²���������ִ����������
			sql = "update xmgl_user set edid = ?,entryDate = ?,uaddress = ?,uage = ?,ubank = ?,ubankaccount = ?,ubasepay = ? , ubirthday = ?,ubonus = ? , ubuzhujin = ? , udescrible = ?,uemail = ?,uidcard = ?,uname = ? , upassword = ?,upid = ?,uroid = ?,usex = ?,ustafftype = ? , utelephone = ? where uuid = ?";
		}else{
			sql = "insert into xmgl_user(edid,entryDate,uaddress,uage,ubank,ubankaccount,ubasePay,ubirthday,ubonus,ubuzhujin,udescrible,uemail,uidcard,uname,upassword,upid,uroid,usex,ustafftype,utelephone,uuid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		}
		this.jdbc.update(sql, new Object[]{edid,entryDate,uaddress,uage,ubank,uabnkAccout,ubasePay,ubirthday,ubonus,buzhujin,udescrible,uemail,
				uidcard,uname,upassword,upid,uroid,usex,ustafftype,utelephone,uuid	
		});
	}
	//ɾ��һ����¼
	public void delete(String uuid){
		String sql = "delete from xmgl_user where uuid=?";
		this.jdbc.update(sql, new Object[]{uuid});
	}
	//����Ա��ְλid ��ѯ��һ��ְλ��������
	public List<XmglUser> getAllUserByDid(String edid){
		String sql = "select * from xmgl_user where edid=?";
		List<XmglUser> list = this.jdbc.queryForMany(sql, new Object[]{edid}, this);
		return list;
	}
	//����pid��ѯ���쵼��ͬһ���˵Ĳ��ų�Ա
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
		//��ʾ��ɫ����
		RoleService dao = new RoleService();
		XmglRole role = dao.getOneRole(rs.getString("uroid"));
		//��ʾְλ����
		DutyService service = new DutyService();
		XmglDuty duty = service.getOneDuty(rs.getString("edid"));
		xmglUser.setDuty(duty);
		xmglUser.setRole(role);
		return xmglUser;
	}
}
