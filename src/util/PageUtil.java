package util;

import java.util.ArrayList;
import java.util.List;
public class PageUtil {
	private int count;    //��Ч��������
	private int totalPage;  //һ�����Էֳɵ�ҳ��
	private List<Object> list = new ArrayList<Object>();//����
	private int curpage;
	
	
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
}
