package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import po.XmglProgn;
import po.XmglProplan;
import po.XmglRwlx;
import po.XmglUser;

import service.GongNengService;
import service.RwlxService;
import service.UserService;
import util.JdbcTemplate;
import util.RowMapper;

public class ProjhDao implements RowMapper{
	private JdbcTemplate jdbc = new JdbcTemplate();
	
	/**
	 * 全表通查，查询计划表中的所有数据
	 */
	public List<XmglProplan> getAllProplan(){
		String sql = "select * from xmgl_proplan";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{}, this);
	}
	/**
	 * 分页显示（全表通查）
	 */
	public List<XmglProplan> getOnePage(int start,int end){
		String sql = "select p.* from (select rownum as num,pro.* from xmgl_proplan pro) p where num between ? and ? ";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
	}
	/**
	 * 根据前置任务id查询出     前置任务是这个任务的所有任务
	 */
	public List<XmglProplan> getAllByqzid(String qzppid){
		String sql = "select * from xmgl_proplan where ppQzId=?";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{qzppid}, this);
	}
	/**
	 * 统计表中数据总条数
	 */
	public int getCount(){
		String sql="select count(*) as cou from xmgl_proplan";
		int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	/**
	 * 计算日期差  :计划结束时间-计划开始时间（算工期）      实际结束时间-计划结束时间（算是否超期 >0 超期   <0 没超期）
	 */
	public int getProtime(String ppsjEndTime,String ppStartTime){
		String sql = "select (to_date(?,'yyyy-mm-dd')-to_date(?,'yyyy-mm-dd')) as gq from xmgl_proplan";
		return (Integer)this.jdbc.queryForOne(sql, new Object[]{ppsjEndTime,ppStartTime}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
                int gq = rs.getInt("gq");
                if(gq<0){
                	gq=0;
                }
				return gq;
			}
		});
	}
	/**
	 * 删除表中单条数据
	 */
	public void deleteOne(String ppId){
		String sql = "delete from xmgl_proplan where ppId=?";
		this.jdbc.update(sql, new Object[]{ppId});
	}
	/**
	 * 新增表中的数据
	 */
	public void insertOne(XmglProplan plan){
		String sql="insert into xmgl_proplan(ppId,ppName,ppQzId,ppStartTime,ppEndTime,ppZxr,ppYxj,rwId,ppState,pgId,ppBeizhu,ppsCreateTime,ppffState) values((select max(to_number(ppid))+1 from xmgl_proplan),?,?,?,?,?,?,?,?,?,?,?,?)";
        this.jdbc.update(sql, new Object[]{plan.getPpName(),plan.getPpQzId(),plan.getPpStartTime(),plan.getPpEndTime(),plan.getPpZxr(),plan.getPpYxj(),plan.getRwId(),plan.getPpState(),plan.getPgId(),plan.getPpBeizhu(),plan.getPpsCreateTime(),plan.getPpffState()});
	}
	/**
	 * 更新表中数据
	 */
	public void update(XmglProplan plan){
		String sql = "update xmgl_proplan set ppname=?,ppStartTime=?,flag=?,pgId=?,ppBeizhu=?,ppEndTime=?,ppQzId=?,ppRwfpr=?,ppsCreateTime=?,ppsRwGrantTime=?,ppshState=?,ppsjEndTime=?,ppsjStartTime=?,ppState=?,ppYxj=?,ppZxr=?,rwId=?,ppffState=? where ppId=?";
	    this.jdbc.update(sql, new Object[]{plan.getPpName(),plan.getPpStartTime(),plan.getFlag(),plan.getPgId(),plan.getPpBeizhu(),plan.getPpEndTime(),plan.getPpQzId(),plan.getPpRwfpr(),plan.getPpsCreateTime(),plan.getPpsRwGrantTime(),plan.getPpshState(),plan.getPpsjEndTime(),plan.getPpsjStartTime(),plan.getPpState(),plan.getPpYxj(),plan.getPpZxr(),plan.getRwId(),plan.getPpffState(),plan.getPpId()});
	}
	/**
	 * 根据计划ppid获取单条数据记录
	 */
	public XmglProplan getOneProjh(String ppid){
		String sql = "select * from xmgl_proplan where ppid=?";
		return (XmglProplan)this.jdbc.queryForOne(sql, new Object[]{ppid}, this);
	}
	/**
	 * 根据功能id获取功能下的所有计划
	 */
	public List<XmglProplan> getAllProplanByPgid(String pgid){
		String sql = "select * from xmgl_proplan where pgid=?";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{pgid}, this);
	}
	/**
	 * 分页查询   查询执行人的所有任务  只显示flag='yes'的任务
	 */
	public List<XmglProplan> getOnePageByZxr(String ppzxr,int start,int end){
		String sql = "select p.* from (select rownum as num,pro.* from xmgl_proplan pro where ppZxr=? and flag='yes') p where num between ? and ? ";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{ppzxr,start,end}, this);
	}
	/**
	 * 统计表中数据总条数（根据执行人查出的数据总数）
	 */
	public int getCountByZxr(String ppZxr){
		String sql="select count(*) as cou from xmgl_proplan where ppZxr=? and flag='yes'";
		int count = (Integer)this.jdbc.queryForOne(sql, new Object[]{ppZxr}, new RowMapper(){
			public Object mapper(ResultSet rs) throws SQLException {
				int count = rs.getInt("cou");
				return count;
			}
		});
		return count;
	}
	public Object mapper(ResultSet rs) throws SQLException {
		XmglProplan plan = new XmglProplan();
		plan.setFlag(rs.getString("flag"));
		plan.setPgId(rs.getString("pgId"));
		plan.setPpBeizhu(rs.getString("ppBeizhu"));
		plan.setPpEndTime(rs.getString("ppEndTime"));
		plan.setPpId(rs.getString("ppId"));
		plan.setPpName(rs.getString("ppName"));
		plan.setPpQzId(rs.getString("ppQzId"));
		plan.setPpRwfpr(rs.getString("ppRwfpr"));
		plan.setPpsCreateTime(rs.getString("ppsCreateTime"));
		plan.setPpsRwGrantTime(rs.getString("ppsRwGrantTime"));
		plan.setPpshState(rs.getString("ppshState"));
		plan.setPpsjEndTime(rs.getString("ppsjEndTime"));
		plan.setPpsjStartTime(rs.getString("ppsjStartTime"));
		plan.setPpState(rs.getString("ppState"));
        plan.setPpYxj(rs.getString("ppYxj"));
        plan.setPpZxr(rs.getString("ppZxr"));
        plan.setRwId(rs.getString("rwId"));
        plan.setPpStartTime(rs.getString("ppStartTime"));
        plan.setPpffState(rs.getString("ppffState"));
        /**
         * 根据任务执行人的ppZxr（执行人的uid值）查出任务执行人对象（该人的详细信息）
         */
        UserService service = new UserService();
        XmglUser user = service.getOneUser(rs.getString("ppZxr"));
        plan.setUser(user);
        /**
         * 根据功能外键pgId可以获取该功能的详细信息
         */
        GongNengService gnService = new GongNengService();
        XmglProgn progn = gnService.getGnById(rs.getString("pgId"));
        plan.setProgn(progn);
        /**
         * 根据任务类型rwid获取任务类型对象
         */
        RwlxService rwlxService = new RwlxService();
        XmglRwlx rwlx = rwlxService.getOneRwlx(rs.getString("rwId"));
        plan.setRwlx(rwlx);
        /**
         * 从dao中调可以计算时间差方法出工期方法参数（计划结束时间，计划开始时间）
         */
        int gq = this.getProtime(rs.getString("ppEndTime"), rs.getString("ppStartTime"));
        plan.setProjecttime(gq);
        /**
         * 从dao中调出计算时间差方法实际结束日期-计划结束日期的差值，如果计算结果为负数 则 返回“没有超期”  否则返回“超期”
         */
        int overdate = this.getProtime(rs.getString("ppsjEndTime"), rs.getString("ppEndTime"));
        plan.setIsOverdate(overdate);
        /**
         * 判断overdate的值，如果为正 则超期 如果为负则没超期
         */
        if(overdate>0){
        	plan.setIsOver("超期");
        }else{
        	plan.setIsOver("未超期");
        }
		return plan;
	}
}
