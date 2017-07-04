package util;

import java.util.ArrayList;
import java.util.List;
public class PageUtil {
	private int count;    //有效数据条数
	private int totalPage;  //一共可以分成的页数
	private List<Object> list = new ArrayList<Object>();//集合
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
