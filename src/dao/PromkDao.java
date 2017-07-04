package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import po.XmglCustomer;
import po.XmglProjb;
import po.XmglPromk;
import po.XmglProxq;
import po.XmglUser;
import service.CustomerService;
import service.ProxqService;
import service.UserService;
import util.JdbcTemplate;
import util.RowMapper;

public class PromkDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	    //一个模块的基本数据（查询单条数据）
		public XmglPromk getOnePromk(String pmId){
			String sql = "select * from xmgl_promk where pmid=?";
			XmglPromk projb = (XmglPromk)jdbc.queryForOne(sql, new Object[]{pmId}, this);
			return projb;
		}
		
		//分页查询
		public List<XmglPromk> getOtherPromk(int start,int end){
			String sql="select nu.* from (select rownum as num,u.* from xmgl_promk u) nu where num between ? and ?";
			List<XmglPromk> list = this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
			return list;
		}
		//统计表中数据总条数
		public int getCount(){
			String sql="select count(*) as cou from xmgl_promk";
			int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
				public Object mapper(ResultSet rs) throws SQLException {
					int count = rs.getInt("cou");
					return count;
				}
			});
			return count;
		}
		//删除表中数据
		public void deleteOne(String pmid){
			String sql = "delete from xmgl_promk where pmid=?";
			this.jdbc.update(sql, new Object[]{pmid});
		}
		//插入一条数据
		public void insertOnePromk(XmglPromk promk){
			String sql ="insert into xmgl_promk(pmid,pxid,pmname,pmbiaoshi,pmyxj,pmkms,pmxqms,txcreatetime,updatetime) values( (select max(to_number(nvl(pmid,0)))+1 from xmgl_promk),?,?,?,?,?,?,?,?)";
			this.jdbc.update(sql, new Object[]{promk.getPxId(),promk.getPmName(),promk.getPmBiaoShi(),promk.getPmYxj(),promk.getPmKms(),promk.getPmXqms(),promk.getTxCreateTime(),promk.getUpdateTime()});
		}
		//在项目基本信息编辑时对数据进行更新
		public void updateOnePromk(XmglPromk promk){
			String sql = "update xmgl_promk set pxid = ?,pmname = ? , pmbiaoshi = ?, pmyxj = ?, pmkms = ?,pmxqms = ?,txcreatetime = ?,updatetime = ? where pmid = ? ";
			this.jdbc.update(sql, new Object[]{promk.getPxId(),promk.getPmName(),promk.getPmBiaoShi(),promk.getPmYxj(),promk.getPmKms(),promk.getPmXqms(),promk.getTxCreateTime(),promk.getUpdateTime(),promk.getPmId()});
		}
		public Object mapper(ResultSet rs) throws SQLException {
			XmglPromk promk = new XmglPromk();
			promk.setPmId(rs.getString("pmid"));
			promk.setPmBiaoShi(rs.getString("pmBiaoShi"));
			promk.setPmKms(rs.getString("pmKms"));
			promk.setPmName(rs.getString("pmName"));
			promk.setPmXqms(rs.getString("pmXqms"));
			promk.setPmYxj(rs.getString("pmYxj"));
			promk.setTxCreateTime(rs.getString("txCreateTime"));
			promk.setUpdateTime(rs.getString("updateTime"));
			/*获取到每个模块所对应的需求的对象*/
			promk.setPxId(rs.getString("pxId"));
			ProxqService proxq = new ProxqService();
		    XmglProxq xmglProxq = proxq.getOneProxq(rs.getString("pxId"));
		    promk.setXmglProxq(xmglProxq);
			return promk;
		}

		@SuppressWarnings("unchecked")
		public List<XmglPromk> getAllMkByXqId(String xqid) {
			String sql = "select * from xmgl_promk where pxid = ?";
			return (List<XmglPromk>)this.jdbc.queryForMany(sql, new Object[]{xqid}, this);
		}
}
