<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>






<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>
<link href="<%=basePath %>//css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>//css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/myxmgl/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#queren").click(function(){
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=deleteRole");
	});
});
$(document).ready(function(){
	$("#fanhui").click(function(){
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=getAllRoles");
	});
});
</script>
</head>
<body >
<form  name="fom" id="fom" method="post"  action="">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- borderColor="black" -->
<table border="1" align="center"  width="80%" cellspacing="0" cellpadding="0" >
  <tr>
    <td class="tablestyle_title" ></td>
     <td  class="tablestyle_title" colspan="2" >��ѡ��Ҫɾ���Ľ�ɫ
	</td>
  </tr>
    <c:forEach items="${requestScope.rolelist }" var="role">
        <tr>
    	<td bgcolor="#EEEEEE" align="center"><input type="checkbox" name="tt1" id="qx1" value='${role.roid }'/></td>
    	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;${role.roname}</td>
    	<td bgcolor="#FFFFFF"> ��ע��&nbsp;&nbsp;${role.rtext}</td>
  	    </tr>
    </c:forEach> 
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit"  class="right-button08" id="queren"  value="ȷ��" />
	<input type="submit" class="right-button08" id="fanhui"  value="����">
    <input type="reset" class="right-button08"   value="����" />
</form>
</body>
</html>
