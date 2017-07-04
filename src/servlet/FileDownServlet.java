package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class FileDownServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//先获取要下载的文件名(不带后缀)  get请求传中文参数时会产生乱码
		String file = req.getParameter("filename");
		String filename = new String((file.getBytes("ISO-8859-1")),"GBK");
		//获取后缀名
		String scFileType = req.getParameter("scFileType");
		System.out.println("filename++++++++++++++++++++++"+filename);
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), req, resp);
		//设置响应类型 ：null不使用默认的打开方式
		su.setContentDisposition(null);
		try {//保存文件的路径
			String filePath = this.getServletContext().getRealPath("/")+"upfile";
			su.downloadFile(filePath+"/"+filename+"."+scFileType);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}
}
