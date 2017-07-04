package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglUser;
import service.SclbService;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class FileUpServlet extends HttpServlet{
	private SclbService service = new SclbService();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
         this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//�����ϴ��ļ�����·��
		String filePath = this.getServletContext().getRealPath("/")+"upfile";
//		System.out.println("filePath=============>"+filePath);
		File file = new File(filePath);
		//����ļ��ļ��в����ڣ��򴴽�һ��
		if(!file.exists()){
			file.mkdir();
		}
		SmartUpload su = new SmartUpload();
		//�ϴ���ʹ��
		ServletConfig config=this.getServletConfig();		
//		System.out.println("su===============>"+su);
//		System.out.println("config===========>"+config);
		su.initialize(config,req,resp); 
		//�����ϴ��ļ���С
		su.setMaxFileSize(1024*1024*100);
		//�����ϴ������ļ��Ĵ�С
		su.setTotalMaxFileSize(1024*1024*1000);
		//���������ϴ��ļ�����
		su.setAllowedFilesList("text,jsp,java,class,gif");
		//׼���ϴ�
	    try {
			su.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	   //��ȡҳ���������Ŀ   ΪʲôҪͨ��su.getRequest() ��ȡrequest���󣿣���
	    String pjid = su.getRequest().getParameter("pro");
	    System.out.println("pjid============>"+pjid);
	   //�����ϴ����ļ�
	    try {
	    	//count ��ʾ������ļ�����
			int count = su.save(filePath);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	    //��ȡ�ļ���
	    String filename=su.getFiles().getFile(0).getFileName();
	    System.out.println("filename=================>"+filename);
	    //ȡ�ò�����׺���ļ���
	    String suffix=filename.substring(0,filename.lastIndexOf('.'));
	    //ȡ�ú�׺��
	    String ext=su.getFiles().getFile(0).getFileExt();
	  //ȡ���ļ���С
	   int  fileSize=su.getFiles().getFile(0).getSize();
	   if(fileSize>1024){
		   fileSize=fileSize/1024;
	   }else{
		   
	   }
	   //����ϴ���
	   XmglUser f=(XmglUser) req.getSession().getAttribute("user");
	   String scr = f.getUid();
	   if(suffix.length()>20){
		   suffix=suffix.substring(0,19);
	   }
	   service.insert(suffix, scr, pjid, ext, fileSize);
	   req.getRequestDispatcher("/files/simple1.jsp?flag=1").forward(req, resp);
	}
}
