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
	 * ��ҳ��ʾ�ϴ��ļ��б�
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
	 * �����ϴ��ļ�id��ȡ���ļ�����ϸʱ��
	 */
	public String showOneSclb(HttpServletRequest req,HttpServletResponse resp){
		String scid = req.getParameter("scid");
		XmglSclb sclb = service.getOneSclb(scid);
		req.setAttribute("sclb", sclb);
		return "/files/showOneSclb.jsp";
	}
	/**
	 * �����ϴ��ļ�����ȡ�ļ���Ϣ
	 */
	public String showOneSclbByName(HttpServletRequest req,HttpServletResponse resp){
		String scFileName = req.getParameter("filename");
		System.out.println("==================>"+scFileName);
		XmglSclb sclb = service.getOneSclbByName(scFileName);
		req.setAttribute("sclb", sclb);
		return "/files/showOneSclb.jsp";
	}
//	/**
//	 * ʵ�����ع���
//	 */
//	public String download(HttpServletRequest req,HttpServletResponse resp){
//		String filename = req.getParameter("filename");
//		SmartUpload su = 
//		return this.showOnePage(req, resp);
//	}
//	/**
//	 * ʵ���ϴ�����
//	 * @throws IOException 
//	 * @throws ServletException 
//	 */
//	public String upload(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
//		//�����ϴ��ļ�����·��
//		String filePath = req.getSession().getServletContext().getRealPath("/")+"files";
//		//System.out.println("===============>"+filePath);
//		File file = new File(filePath);
//		SmartUpload su = new SmartUpload();
//		//�ϴ���ʹ��
//		//ServletConfig config=this.getServletConfig();		
//		System.out.println("su===============>"+su);
//		System.out.println("config===========>"+config);		
//		su.initialize(config,req,resp); 
//        //�����ϴ��ļ���С
//		su.setMaxFileSize(1024*1024*100);
//		//�����ϴ������ļ��Ĵ�С
//		su.setTotalMaxFileSize(1024*1024*1000);
//		//���������ϴ��ļ�����
//		su.setAllowedFilesList("text,jsp,java,class,gif");
//		//׼���ϴ�
//	    try {
//			su.upload();
//		} catch (SmartUploadException e) {
//			e.printStackTrace();
//		}
//	   //��ȡҳ���������Ŀ
//	    String pjid = su.getRequest().getParameter("pro");
//	   //�����ϴ����ļ�
//	    try {
//			su.save("/upload");
//		} catch (SmartUploadException e) {
//			e.printStackTrace();
//		}
//	    //��ȡ�ļ���
//	    String filename=su.getFiles().getFile(0).getFileName();
//	    System.out.println("filename=================>"+su.getFiles());
//	    //ȡ�ò�����׺���ļ���
//	    String suffix=filename.substring(0,filename.lastIndexOf('.'));
//	    //ȡ�ú�׺��
//	    String ext=su.getFiles().getFile(0).getFileExt();
//	  //ȡ���ļ���С
//	   int  fileSize=su.getFiles().getFile(0).getSize();
//	   if(fileSize>1024){
//		   fileSize=fileSize/1024;
//	   }else{
//		   
//	   }
//	   //����ϴ���
//	   XmglUser f=(XmglUser) req.getSession().getAttribute("user");
//	   String scr = f.getUname();
//	   if(suffix.length()>20){
//		   suffix=suffix.substring(0,19);
//	   }
//	   service.insert(suffix, scr, pjid, ext, fileSize);
//	   return "/files/simple1.jsp?flag=1";
//	}
	/**
	 * ɾ��(������¼)��ѡ�ļ�
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
	 * ɾ��������¼
	 */
	public String deleteOne(HttpServletRequest req,HttpServletResponse resp){
		String scid = req.getParameter("scid");
		this.service.deleteOne(scid);
		return this.showOnePage(req, resp);
	}
	/**
	 * �ϴ��ļ�֮ǰ��Ҫ��ȡ��Ŀ�б�
	 */
	public String getUpProjb(HttpServletRequest req,HttpServletResponse resp){
		ProjbService projb = new ProjbService();
		List<XmglProjb> list = projb.getAllProjb();
		req.setAttribute("list", list);
		return "/files/upload.jsp";
	}
}
