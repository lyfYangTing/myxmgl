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
		//�Ȼ�ȡҪ���ص��ļ���(������׺)  get�������Ĳ���ʱ���������
		String file = req.getParameter("filename");
		String filename = new String((file.getBytes("ISO-8859-1")),"GBK");
		//��ȡ��׺��
		String scFileType = req.getParameter("scFileType");
		System.out.println("filename++++++++++++++++++++++"+filename);
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), req, resp);
		//������Ӧ���� ��null��ʹ��Ĭ�ϵĴ򿪷�ʽ
		su.setContentDisposition(null);
		try {//�����ļ���·��
			String filePath = this.getServletContext().getRealPath("/")+"upfile";
			su.downloadFile(filePath+"/"+filename+"."+scFileType);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}
}
