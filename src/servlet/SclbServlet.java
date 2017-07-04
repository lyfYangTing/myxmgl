package servlet;

import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import po.XmglProjb;
import po.XmglSclb;
import service.ProjbService;
import service.SclbService;
import util.PageUtil;

public class SclbServlet{
	private SclbService service = new SclbService();
//	private ServletConfig config = null;
//	@Override
//	public void init(ServletConfig config) throws ServletException {
//		super.init(config);
//	}
	/**
	 * 分页显示上传文件列表
	 */
	public String showOnePage(HttpServletRequest req,HttpServletResponse resp){
		String curpage = req.getParameter("curpage");
	    if(curpage==null || curpage.equals("")){
	    	curpage="1";
	    }
	    PageUtil util = this.service.getOnePage(Integer.parseInt(curpage));
		req.setAttribute("util", util);
		return "/files/showAllSclb.jsp";
	}
	/**
	 * 根据上传文件id获取该文件的详细时间
	 */
	public String showOneSclb(HttpServletRequest req,HttpServletResponse resp){
		String scid = req.getParameter("scid");
		XmglSclb sclb = service.getOneSclb(scid);
		req.setAttribute("sclb", sclb);
		return "/files/showOneSclb.jsp";
	}
	/**
	 * 根据上传文件名获取文件信息
	 */
	public String showOneSclbByName(HttpServletRequest req,HttpServletResponse resp){
		String scFileName = req.getParameter("filename");
		System.out.println("==================>"+scFileName);
		XmglSclb sclb = service.getOneSclbByName(scFileName);
		req.setAttribute("sclb", sclb);
		return "/files/showOneSclb.jsp";
	}
//	/**
//	 * 实现下载功能
//	 */
//	public String download(HttpServletRequest req,HttpServletResponse resp){
//		String filename = req.getParameter("filename");
//		SmartUpload su = 
//		return this.showOnePage(req, resp);
//	}
//	/**
//	 * 实现上传功能
//	 * @throws IOException 
//	 * @throws ServletException 
//	 */
//	public String upload(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
//		//设置上传文件保存路径
//		String filePath = req.getSession().getServletContext().getRealPath("/")+"files";
//		//System.out.println("===============>"+filePath);
//		File file = new File(filePath);
//		SmartUpload su = new SmartUpload();
//		//上传初使化
//		//ServletConfig config=this.getServletConfig();		
//		System.out.println("su===============>"+su);
//		System.out.println("config===========>"+config);		
//		su.initialize(config,req,resp); 
//        //设置上传文件大小
//		su.setMaxFileSize(1024*1024*100);
//		//设置上传所有文件的大小
//		su.setTotalMaxFileSize(1024*1024*1000);
//		//设置允许上传文件类型
//		su.setAllowedFilesList("text,jsp,java,class,gif");
//		//准备上传
//	    try {
//			su.upload();
//		} catch (SmartUploadException e) {
//			e.printStackTrace();
//		}
//	   //获取页面的所属项目
//	    String pjid = su.getRequest().getParameter("pro");
//	   //保存上传的文件
//	    try {
//			su.save("/upload");
//		} catch (SmartUploadException e) {
//			e.printStackTrace();
//		}
//	    //获取文件名
//	    String filename=su.getFiles().getFile(0).getFileName();
//	    System.out.println("filename=================>"+su.getFiles());
//	    //取得不代后缀的文件名
//	    String suffix=filename.substring(0,filename.lastIndexOf('.'));
//	    //取得后缀名
//	    String ext=su.getFiles().getFile(0).getFileExt();
//	  //取得文件大小
//	   int  fileSize=su.getFiles().getFile(0).getSize();
//	   if(fileSize>1024){
//		   fileSize=fileSize/1024;
//	   }else{
//		   
//	   }
//	   //获得上传人
//	   XmglUser f=(XmglUser) req.getSession().getAttribute("user");
//	   String scr = f.getUname();
//	   if(suffix.length()>20){
//		   suffix=suffix.substring(0,19);
//	   }
//	   service.insert(suffix, scr, pjid, ext, fileSize);
//	   return "/files/simple1.jsp?flag=1";
//	}
	/**
	 * 删除(多条记录)所选文件
	 */
	public String deleteOther(HttpServletRequest req,HttpServletResponse resp){
		String[] scids = req.getParameterValues("hello");
		String[] isdeletes = req.getParameterValues("world");
		for(int i=0;i<scids.length;i++){
			if(isdeletes[i].equals("yes")){
				this.service.deleteOne(scids[i]);
			}
		}
		return this.showOnePage(req, resp);
	}
	/**
	 * 删除单条记录
	 */
	public String deleteOne(HttpServletRequest req,HttpServletResponse resp){
		String scid = req.getParameter("scid");
		this.service.deleteOne(scid);
		return this.showOnePage(req, resp);
	}
	/**
	 * 上传文件之前需要获取项目列表
	 */
	public String getUpProjb(HttpServletRequest req,HttpServletResponse resp){
		ProjbService projb = new ProjbService();
		List<XmglProjb> list = projb.getAllProjb();
		req.setAttribute("list", list);
		return "/files/upload.jsp";
	}
}
