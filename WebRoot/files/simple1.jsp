<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'simple1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script>
		if("${param.falg}"==1){
			alert("�ϴ��ɹ���");
		}
	</script>
  </head>
  
  <body>
    <font id='hello'>3</font> ��󷵻�
   <script>
   var count=2;
   function tiaozhuan(){
   		document.getElementById("hello").innerHTML=count;
   		if(count==0){
  			window.clearInterval(w);
   			window.location.href="<%=basePath%>/sclbServlet.do?op=showOnePage";
   		}
   		count--;
    }
  	var w=window.setInterval("tiaozhuan()",1000);
   </script>
  </body>
</html>
