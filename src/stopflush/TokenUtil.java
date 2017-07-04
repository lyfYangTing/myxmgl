package stopflush;



import javax.servlet.http.HttpServletRequest;
//��ֹˢ��
/*
 * 1.��ȡһ��ϵͳʱ�䣬����session��
 * 2.��ָ��ҳ����ȡsession�е�ֵ,������������
 * 3.��servlet�У���session��request�е�ֵ���бȽ�
 *   ������ύ���������������
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
	//�洢sessionֵ
	public void saveToken(HttpServletRequest request){
		request.getSession().setAttribute(TokenUtil.TOKEN_STRING, System.currentTimeMillis()+"");
	}
	//��ȡ����
	public String getToken(HttpServletRequest request){
		String token = (String) request.getSession().getAttribute(TokenUtil.TOKEN_STRING); 
		return token;
	} 
	//���бȽ�
	public boolean isToken(HttpServletRequest request){
		String reqToken = request.getParameter(TokenUtil.TOKEN_STRING);
		String sessToken = (String) request.getSession().getAttribute("token");
		//�Ƴ�session�е�ֵ
		request.getSession().removeAttribute(TokenUtil.TOKEN_STRING);
		//���ThreadLocal
		TokenUtil.threadLocal.set(null);
		return reqToken.equals(sessToken);
	}
}
