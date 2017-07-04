package servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglCustomer;

import service.CustomerService;
import util.PageUtil;

public class CustomerServlet {
	private CustomerService service = new CustomerService();
	//��ѯ���пͻ���Ϣ
	public String showAllcustomers(HttpServletRequest req,HttpServletResponse resp){
		String curPage = req.getParameter("curPage");
		if(curPage==null){
			curPage = "1";
		}
		PageUtil util = service.getAnyCustomers(Integer.parseInt(curPage));
		req.setAttribute("util", util);
		req.setAttribute("curpage", curPage);
		return "/files/showAllCustomers.jsp";
	}
	//�������ݲ�ѯ
	public String queryOne(HttpServletRequest req,HttpServletResponse resp){
		//ȡֵ ȡ�������Ӵ�������cid
		String cid = req.getParameter("cid");
		String option = req.getParameter("option");//�����ж��ǲ鿴�������Ǳ༭����
		//�� 
		XmglCustomer customer = service.getOneCustomer(cid);
		req.setAttribute("customer", customer);
		if(option.equals("1")){
			return "/files/showOneCustomer.jsp";
		}else{
			return "/files/addkehu.jsp";
		}
	}
	//ͨ����˾���Ʋ��ҹ�˾��ϸ��Ϣ
	public String getCustomerByName(HttpServletRequest req,HttpServletResponse resp){
		//ȡֵ ȡ�������Ӵ�������cname
		String clientname = req.getParameter("clientname");
		//�� 
		List<XmglCustomer> customer = service.getCustomersByName(clientname);
		req.setAttribute("customer", customer);
		return "/files/showCustomersByName.jsp";
	}
	//ɾ���ͻ���Ϣ
	public String deleteCus(HttpServletRequest req,HttpServletResponse resp){
		//ȡ������checkbox�����====����hidden�����򴫹���hello->ͨ��cid world->��ŵ��ǹ��ڶ�ѡ���Ƿ�ѡ�еı�ʶ value='yes'��ʾ��ѡ��ѡ�п��Խ���ɾ������
		//cids isdelete һһ��Ӧ�Ĺ�ϵ
		String[] cids = req.getParameterValues("hello");
		String[] isdelete = req.getParameterValues("world");
		for(int i=0;i<cids.length;i++){
			//�жϸø�����¼�Ƿ��ܱ�ɾ�� ��֪cid
			if(isdelete[i].equals("yes")){
				service.delete(cids[i]);
			}
		}
		return this.showAllcustomers(req, resp);
	}
	//����һ������    �����Ӹ���
	public String insertOne(HttpServletRequest req,HttpServletResponse resp){
		//ȡֵ
		String cname = req.getParameter("clientname");
		String clxr = req.getParameter("cper");
		String ctel = req.getParameter("ctel");
		String caddress = req.getParameter("caddr");
		String cbj=req.getParameter("cbackground");
		String cid = req.getParameter("cid");
		System.out.println("cid===========>"+cid);
		if(!cid.equals("")){
			System.out.println("����ִ�и��²���");
			service.update(cid,cname, clxr, ctel, caddress, cbj);
		}else{
			System.out.println("����ִ����������");
			service.insert(cname, clxr, ctel, caddress, cbj);
		}
		return this.showAllcustomers(req, resp);
	}
}
