<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=gb18030" />
<title>项目管理系统 by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>

<script type="text/javascript">
	//如果想要一个事件运行在你的页面上，必须在$(document).ready()里调用这个事件
	//所有包括在$(document).ready()里面的元素或事件都将会在DOM完成加载之后立即加载，并且在页面内容加载之前
	$(document).ready(
	function (){
		//alert("nice");
		$("#denglu").click(
		function(){
			//alert("hello"); 
			//val() 设置或返回匹配元素的值。 
			var username=$("#textfield").val();
			var password=$("#textfield2").val();
			var yanzheng=$("#textfield3").val();
			if(username ==""){
				alert("请输入用户名！");
				return;
			}
			if(password ==""){
				alert("请输入密码！");
				return;
			}
			if(yanzheng==""){
				alert("请输入验证码！");
				return;
			}
			//attr() 设置或返回匹配元素(form表单中的action属性)的属性和值。
			$("#fom").attr("action","<%=basePath %>loginServlet.do?op=login");
		});
	});
</script>
<script>
    var f = ${requestScope.info};
		if(f==3){
		   alert("验证码错误");
		}     
</script>
<script>
	$(document).ready(function (){
	    // <a>标签的id
		$("#lin").click(function (){
			$("#imag").attr("src","<%=basePath %>CheckCodeServlet?haha="+Math.random());
		});
	});
</script>
</head>

<body>
<form  method='post' name='form1' id='fom' action="">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="<%=basePath %>/images/top02.gif"><img src="<%=path %>/images/top03.gif" width="776" height="147" /></td>
  </tr>
</table>
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="<%=basePath %>/images/ico13.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
          
        </table></td>
        <td><img src="<%=basePath %>/images/line01.gif" width="5" height="292" /></td>
      </tr>
    </table></td>
                           
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align='center'>
      <font color='red' >${requestScope.result}</font>
      <tr>
        <td width="31%" height="35" class="login-text02">用户名称：<br /></td>
        <td width="69%"><input name="textfield" id='textfield' type="text" size="30" /></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">密　码：<br /></td>
        <td><input name="textfield2" type="password" id='textfield2' size="33" /></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">验证图片：<br /></td>
        <td><img id='imag' src="<%=basePath %>/CheckCodeServlet" width="109" height="40" /> <a href="#" id='lin' class="login-text03">看不清楚，换张图片</a></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">请输入验证码：</td>
        <td><input id='textfield3' name="textfield3" type="text" size="30" /></td>
      </tr>
      <tr>
        <td height="35">&nbsp;</td>
        <td><input id="denglu" type="submit" class="right-button01" value="确认登陆"  />
          <input name="Submit232" type="button" class="right-button02" value="重 置" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
