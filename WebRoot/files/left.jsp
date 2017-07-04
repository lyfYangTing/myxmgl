<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb18030" />
<title>项目管理系统 </title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../images/left.gif);
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
var dui=false;
var imd=false;
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="../images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="../images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var obj=document.all(idstr);
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	if(dui != false&&dui!=objectobj){
		dui.style.display="none"
		imd.src="../images/ico04.gif";
	}
	dui=objectobj;
	imd=imgobj;
	
	if(objectobj.style.display=="none"){
			var o=document.all(name1);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name2);
				image.src="../images/ico04.gif";
			}
		objectobj.style.display="";
		imgobj.src="../images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="../images/ico04.gif";
	}
}

</SCRIPT>
<body>
<%
	session.setAttribute("token",System.currentTimeMillis()+"");
 %>

<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="../images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="../images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${sessionScope.user.uname }</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="<%=basePath %>loginServlet.do?op=exit" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		
		<c:forEach items="${sessionScope.list}" var="m"  varStatus='i'>
		       <c:if test="${m.pid==0 }">
			   <TABLE  id='${m.fuid }' width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
		          <tr>
		            <td height="29">
						<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="8%"><img name="img${m.fuid }" id="img${m.fuid }" src="<%=path%>/images/ico04.gif" width="8" height="11" /></td>
								<td width="92%">
										<a href="javascript:" id='d' target="mainFrame" class="left-font03" onClick="list('${m.fuid }');" >${m.funame}</a></td>
							</tr>
						</table>
					</td>
		          </tr>		  
		        </TABLE>
	          </c:if>
	        <table id="subtree${m.fuid }" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
		        <c:forEach items="${sessionScope.list}" var="v">
		           <c:if test="${v.pid==m.fuid }">
		           <tr>
					  <td width="9%" height="20" ><img id="xiaotu${v.fuid}" src="<%=path%>/images/ico06.gif" width="8" height="12" /></td>
					  <td width="91%">	
							<a href="<%=basePath%>${v.fuhref}" target="mainFrame" class="left-font03" onClick="tupian('${v.fuid}');">${v.funame }</a></td>
				   </tr>
				   </c:if>
	        	</c:forEach>
	        </table> 
		</c:forEach>
</TD>
</tr>
</table>

</body>
</html>
