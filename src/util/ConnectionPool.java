package util;

import java.util.ArrayList;
import java.util.List;

public class ConnectionPool {
	private static List<MyConnection> list = new ArrayList<MyConnection>();
	
	static{
		for(int i=0;i<30;i++){
			MyConnection con = new MyConnection(i);
			list.add(con);
		}
	}
	
	public synchronized static MyConnection getConnect(){
		MyConnection co = null;
		for(MyConnection c:list){
			System.out.println(c.isConn()+"--"+!c.isConn());
			if(!c.isConn()){
				co = c;
				c.setConn(true);
				break;
			}
		}
		return co;
	}
	
	public static MyConnection waitGetConnect(){
		MyConnection co = ConnectionPool.getConnect();
		int count = 0;
		while(co==null){
			co = ConnectionPool.getConnect();
			try {
				Thread.sleep(100l);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			count++;
			if(count>=60){
				throw new ConnectionException("系统正忙，请稍后再试");
			}
		}
		return co;
	}
}
