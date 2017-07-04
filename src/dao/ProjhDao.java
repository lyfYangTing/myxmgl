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
	 * ȫ��ͨ�飬��ѯ�ƻ����е���������
	 */
	public List<XmglProplan> getAllProplan(){
		String sql = "select * from xmgl_proplan";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{}, this);
	}
	/**
	 * ��ҳ��ʾ��ȫ��ͨ�飩
	 */
	public List<XmglProplan> getOnePage(int start,int end){
		String sql = "select p.* from (select rownum as num,pro.* from xmgl_proplan pro) p where num between ? and ? ";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{start,end}, this);
	}
	/**
	 * ����ǰ������id��ѯ��     ǰ������������������������
	 */
	public List<XmglProplan> getAllByqzid(String qzppid){
		String sql = "select * from xmgl_proplan where ppQzId=?";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{qzppid}, this);
	}
	/**
	 * ͳ�Ʊ�������������
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
	 * �������ڲ�  :�ƻ�����ʱ��-�ƻ���ʼʱ�䣨�㹤�ڣ�      ʵ�ʽ���ʱ��-�ƻ�����ʱ�䣨���Ƿ��� >0 ����   <0 û���ڣ�
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
	 * ɾ�����е�������
	 */
	public void deleteOne(String ppId){
		String sql = "delete from xmgl_proplan where ppId=?";
		this.jdbc.update(sql, new Object[]{ppId});
	}
	/**
	 * �������е�����
	 */
	public void insertOne(XmglProplan plan){
		String sql="insert into xmgl_proplan(ppId,ppName,ppQzId,ppStartTime,ppEndTime,ppZxr,ppYxj,rwId,ppState,pgId,ppBeizhu,ppsCreateTime,ppffState) values((select max(to_number(ppid))+1 from xmgl_proplan),?,?,?,?,?,?,?,?,?,?,?,?)";
        this.jdbc.update(sql, new Object[]{plan.getPpName(),plan.getPpQzId(),plan.getPpStartTime(),plan.getPpEndTime(),plan.getPpZxr(),plan.getPpYxj(),plan.getRwId(),plan.getPpState(),plan.getPgId(),plan.getPpBeizhu(),plan.getPpsCreateTime(),plan.getPpffState()});
	}
	/**
	 * ���±�������
	 */
	public void update(XmglProplan plan){
		String sql = "update xmgl_proplan set ppname=?,ppStartTime=?,flag=?,pgId=?,ppBeizhu=?,ppEndTime=?,ppQzId=?,ppRwfpr=?,ppsCreateTime=?,ppsRwGrantTime=?,ppshState=?,ppsjEndTime=?,ppsjStartTime=?,ppState=?,ppYxj=?,ppZxr=?,rwId=?,ppffState=? where ppId=?";
	    this.jdbc.update(sql, new Object[]{plan.getPpName(),plan.getPpStartTime(),plan.getFlag(),plan.getPgId(),plan.getPpBeizhu(),plan.getPpEndTime(),plan.getPpQzId(),plan.getPpRwfpr(),plan.getPpsCreateTime(),plan.getPpsRwGrantTime(),plan.getPpshState(),plan.getPpsjEndTime(),plan.getPpsjStartTime(),plan.getPpState(),plan.getPpYxj(),plan.getPpZxr(),plan.getRwId(),plan.getPpffState(),plan.getPpId()});
	}
	/**
	 * ���ݼƻ�ppid��ȡ�������ݼ�¼
	 */
	public XmglProplan getOneProjh(String ppid){
		String sql = "select * from xmgl_proplan where ppid=?";
		return (XmglProplan)this.jdbc.queryForOne(sql, new Object[]{ppid}, this);
	}
	/**
	 * ���ݹ���id��ȡ�����µ����мƻ�
	 */
	public List<XmglProplan> getAllProplanByPgid(String pgid){
		String sql = "select * from xmgl_proplan where pgid=?";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{pgid}, this);
	}
	/**
	 * ��ҳ��ѯ   ��ѯִ���˵���������  ֻ��ʾflag='yes'������
	 */
	public List<XmglProplan> getOnePageByZxr(String ppzxr,int start,int end){
		String sql = "select p.* from (select rownum as num,pro.* from xmgl_proplan pro where ppZxr=? and flag='yes') p where num between ? and ? ";
		return (List<XmglProplan>)this.jdbc.queryForMany(sql, new Object[]{ppzxr,start,end}, this);
	}
	/**
	 * ͳ�Ʊ�������������������ִ���˲��������������
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
         * ��������ִ���˵�ppZxr��ִ���˵�uidֵ���������ִ���˶��󣨸��˵���ϸ��Ϣ��
         */
        UserService service = new UserService();
        XmglUser user = service.getOneUser(rs.getString("ppZxr"));
        plan.setUser(user);
        /**
         * ���ݹ������pgId���Ի�ȡ�ù��ܵ���ϸ��Ϣ
         */
        GongNengService gnService = new GongNengService();
        XmglProgn progn = gnService.getGnById(rs.getString("pgId"));
        plan.setProgn(progn);
        /**
         * ������������rwid��ȡ�������Ͷ���
         */
        RwlxService rwlxService = new RwlxService();
        XmglRwlx rwlx = rwlxService.getOneRwlx(rs.getString("rwId"));
        plan.setRwlx(rwlx);
        /**
         * ��dao�е����Լ���ʱ���������ڷ����������ƻ�����ʱ�䣬�ƻ���ʼʱ�䣩
         */
        int gq = this.getProtime(rs.getString("ppEndTime"), rs.getString("ppStartTime"));
        plan.setProjecttime(gq);
        /**
         * ��dao�е�������ʱ����ʵ�ʽ�������-�ƻ��������ڵĲ�ֵ�����������Ϊ���� �� ���ء�û�г��ڡ�  ���򷵻ء����ڡ�
         */
        int overdate = this.getProtime(rs.getString("ppsjEndTime"), rs.getString("ppEndTime"));
        plan.setIsOverdate(overdate);
        /**
         * �ж�overdate��ֵ�����Ϊ�� ���� ���Ϊ����û����
         */
        if(overdate>0){
        	plan.setIsOver("����");
        }else{
        	plan.setIsOver("δ����");
        }
		return plan;
	}
}
