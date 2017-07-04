package stopflush;



import javax.servlet.http.HttpServletRequest;
//防止刷新
/*
 * 1.获取一个系统时间，存入session中
 * 2.在指定页面中取session中的值,放入隐含域中
 * 3.在servlet中，将session和request中地值进行比较
 *   相等则提交，不相等则不作操作
 */
public class TokenUtil {
	private static ThreadLocal<TokenUtil> threadLocal = new ThreadLocal<TokenUtil>();
	public static final String TOKEN_STRING = "token";
	public static TokenUtil getInstance(){
		TokenUtil tu = TokenUtil.threadLocal.get();
		if (tu == null){
			tu = new TokenUtil();
			TokenUtil.threadLocal.set(tu);
		}
		return tu;
	}
	//存储session值
	public void saveToken(HttpServletRequest request){
		request.getSession().setAttribute(TokenUtil.TOKEN_STRING, System.currentTimeMillis()+"");
	}
	//获取令牌
	public String getToken(HttpServletRequest request){
		String token = (String) request.getSession().getAttribute(TokenUtil.TOKEN_STRING); 
		return token;
	} 
	//进行比较
	public boolean isToken(HttpServletRequest request){
		String reqToken = request.getParameter(TokenUtil.TOKEN_STRING);
		String sessToken = (String) request.getSession().getAttribute("token");
		//移除session中的值
		request.getSession().removeAttribute(TokenUtil.TOKEN_STRING);
		//清空ThreadLocal
		TokenUtil.threadLocal.set(null);
		return reqToken.equals(sessToken);
	}
}
