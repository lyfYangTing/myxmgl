<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/xmgl/">
    
    <title>My JSP 'succ.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <font id='he'>����ɹ�</font><br>
   <font id='hello'>5</font>��󷵻���ҳ<br>
   
   
   <script>
   var count=5;
    
	   function tiaozhuan(){
	   		document.getElementById("hello").innerHTML=count;
	   		if(count==0){
	   			window.clearInterval(w);
	   			window.location.href="<%=basePath%>/files/showOwnUser.jsp";
	   		}
	   		count--;
	   }
   	var w=window.setInterval("tiaozhuan()",1000);
   </script>
  </body>
</html>

