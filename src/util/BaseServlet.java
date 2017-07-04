package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException,IOException {
		
		//resp.setContentType("html/text;charset=GBK");
		req.setCharacterEncoding("GBK");
		//className =txcwOne/loginServlet.do ��Ҫ��ȡ�ַ����ҵ�  ����·��  "/loginServlet"
		String uri = req.getRequestURI();
		//��ȡ��Ľ��Ϊ  uri = /loginServlet
		uri = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
        
		//����properties�ļ�  
		Properties pro = new Properties();
		// �������·��ת���ɵľ���·����F:tomcat-6.0.18/bin/urLMap.properties
		// ��ʵ·����     F:/tomcat-6.0.18/webapps/WEB-INF/classes/urLMap.properties
		String rpath = req.getSession().getServletContext().getRealPath("/WEB-INF/classes/urLMap.properties");
		File file = new File(rpath);
		pro.load(new FileInputStream(file));
	    //���ݼ�(����·��) ��ֵ(ִ�д������)  pro.get(uri) �ķ���ֵ��StringBuffer
		System.out.println("----->"+pro.get(uri));
		String className = pro.get(uri).toString();
		
		try {
			// �ҵ��� ��������ʱ��
			Class clazz = Class.forName(className);
			//��������ʱ���Ӧ����Ķ���
			Object obj = clazz.newInstance();
			//���մ������ķ�����  ���ݷ���������ִ�з���
			String methodName = req.getParameter("op");
			System.out.println("�ҵ���������=========================>"+methodName);
			//�ҵ�����
			Method me = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			//���÷���
			String tzpath = (String)me.invoke(obj,req,resp);
			if(tzpath!=null){
				req.getRequestDispatcher(tzpath).forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
