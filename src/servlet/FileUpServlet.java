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
		//设置上传文件保存路径
		String filePath = this.getServletContext().getRealPath("/")+"upfile";
//		System.out.println("filePath=============>"+filePath);
		File file = new File(filePath);
		//如果文件文件夹不存在，则创建一个
		if(!file.exists()){
			file.mkdir();
		}
		SmartUpload su = new SmartUpload();
		//上传初使化
		ServletConfig config=this.getServletConfig();		
//		System.out.println("su===============>"+su);
//		System.out.println("config===========>"+config);
		su.initialize(config,req,resp); 
		//设置上传文件大小
		su.setMaxFileSize(1024*1024*100);
		//设置上传所有文件的大小
		su.setTotalMaxFileSize(1024*1024*1000);
		//设置允许上传文件类型
		su.setAllowedFilesList("text,jsp,java,class,gif");
		//准备上传
	    try {
			su.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	   //获取页面的所属项目   为什么要通过su.getRequest() 获取request对象？？？
	    String pjid = su.getRequest().getParameter("pro");
	    System.out.println("pjid============>"+pjid);
	   //保存上传的文件
	    try {
	    	//count 表示保存的文件总数
			int count = su.save(filePath);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	    //获取文件名
	    String filename=su.getFiles().getFile(0).getFileName();
	    System.out.println("filename=================>"+filename);
	    //取得不代后缀的文件名
	    String suffix=filename.substring(0,filename.lastIndexOf('.'));
	    //取得后缀名
	    String ext=su.getFiles().getFile(0).getFileExt();
	  //取得文件大小
	   int  fileSize=su.getFiles().getFile(0).getSize();
	   if(fileSize>1024){
		   fileSize=fileSize/1024;
	   }else{
		   
	   }
	   //获得上传人
	   XmglUser f=(XmglUser) req.getSession().getAttribute("user");
	   String scr = f.getUid();
	   if(suffix.length()>20){
		   suffix=suffix.substring(0,19);
	   }
	   service.insert(suffix, scr, pjid, ext, fileSize);
	   req.getRequestDispatcher("/files/simple1.jsp?flag=1").forward(req, resp);
	}
}
