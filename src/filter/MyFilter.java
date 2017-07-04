package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import po.XmglUser;

public class MyFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		XmglUser user = (XmglUser)req.getSession().getAttribute("user");
		String uri = req.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/")+1);
        if(user==null && !uri.equals("loginServlet.do")){
        	request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
        	chain.doFilter(request, response);
        }		
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
