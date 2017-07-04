<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>






<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="http://localhost:8080/xmgl/files/">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
  if(a!=true)return false;
  window.open("冲突页.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}

function check()
{
document.getElementById("aa").style.display="";
}

</script>
</head>

<body class="ContentBody">
  <form action="<%=basePath %>/fileupServlet" method="post" enctype="multipart/form-data" name="form">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >文件上传</th>
  </tr>
  <tr>
    <td class="CPanel">
      <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr align="center">
		<td >
		<select name="pro">
		   <option value='0'>--请选择--</option>
		   <c:forEach items="${requestScope.list }" var="projb">
               <option value="${projb.pjId }">${projb.pjName }</option>
		   </c:forEach>
		</select>
		</td>
		</tr>
		<TR>
		  <td height="26">	
			<table width="100%" border="0" cellpadding="2" align="center" cellspacing="1">	
					<tr class="TablePanel" >
						
						<td width="50%" align="center">文件路径</td>	
					</tr>
					<tr>
						<td align="center"><input name="file" type="file" class="button" id="file" size="20" /></td>	        	  
					</tr>
			</table>								  
		</TD>									
	</TR>
</TABLE>
</td>
</tr>
<TR>
<TD colspan="2" align="center" height="50px">
<input type="submit" name="Submit" value="保存" class="button"/>
<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
</TR>
</TABLE>


</div>
</form>
</body>
</html>
