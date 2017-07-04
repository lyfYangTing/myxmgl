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
		//className =txcwOne/loginServlet.do 需要截取字符串找到  请求路径  "/loginServlet"
		String uri = req.getRequestURI();
		//截取后的结果为  uri = /loginServlet
		uri = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
        
		//加载properties文件  
		Properties pro = new Properties();
		// 根据相对路径转换成的绝对路径：F:tomcat-6.0.18/bin/urLMap.properties
		// 真实路径：     F:/tomcat-6.0.18/webapps/WEB-INF/classes/urLMap.properties
		String rpath = req.getSession().getServletContext().getRealPath("/WEB-INF/classes/urLMap.properties");
		File file = new File(rpath);
		pro.load(new FileInputStream(file));
	    //根据键(请求路径) 找值(执行代码的类)  pro.get(uri) 的返回值是StringBuffer
		System.out.println("----->"+pro.get(uri));
		String className = pro.get(uri).toString();
		
		try {
			// 找到类 创建运行时类
			Class clazz = Class.forName(className);
			//创建运行时类对应的类的对象
			Object obj = clazz.newInstance();
			//接收传过来的方法名  根据方法名调用执行方法
			String methodName = req.getParameter("op");
			System.out.println("找到方法了吗？=========================>"+methodName);
			//找到方法
			Method me = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			//调用方法
			String tzpath = (String)me.invoke(obj,req,resp);
			if(tzpath!=null){
				req.getRequestDispatcher(tzpath).forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
