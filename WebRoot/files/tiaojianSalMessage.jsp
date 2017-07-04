<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'listMonthYuanGongGongZi.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<link href="/xmgl/css/css.css" rel="stylesheet" type="text/css" />
<link href="/xmgl/css/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.open("http://localhost:8080/xmgl/files/gaojisousuo.jsp","","depended=0,alwaysRaised=1,width=400,height=240,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}
function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}
function link1(){
   var p = document.getElementById("textfield3").value;
   var t = '1';
   if(p>t){
     alert("没有此页");
     document.getElementById("textfield3").value='1';
   } 
   if(p<t){
     document.getElementById("textfield3").value=p;
   }
   if(p<1){
      document.getElementById("textfield3").value='1';
   }
   if(p==""){
   	  alert("请输入");
   }
    fom.action="http://localhost:8080/xmgl/servlet/SalaryServlet?methodName=QuerySalary";
}

</SCRIPT>
<script type="text/javascript" src="/xmgl/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#chaxun").click(function(){
			form.action="http://localhost:8080/xmgl/servlet/SalaryServlet?methodName=chaxungongzi";
			form.submit();
	});
});
</script>
  
 <body>
<form name="form" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
         
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
                	<td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 员工月工资列表 &nbsp;
                    </td>
            	</tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">序列</td>
                    <td width="8%" height="20" align="center" bgcolor="#EEEEEE">员工姓名</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">年份</td>
                     <td width="10%" align="center" bgcolor="#EEEEEE">月份</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">总工资</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">扣除工资</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">实发工资</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">状态</td>
                    <td width="13%" align="center" bgcolor="#EEEEEE">发款人</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">操作<br></td>
                  </tr>
                   
                    <c:forEach items = "${requestScope.list}"  var = "gz"> 
                  <tr id="${gz.gid}">
				    <td bgcolor="#FFFFFF"><div align="center">${gz.gid}</div></td>
                    <td height="20" bgcolor="#FFFFFF"><div align="center">${gz.uname }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                    ${gz.year }</div></td>
                     <td bgcolor="#FFFFFF"><div align="center">
                    ${gz.month }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                    ${gz.ubasepay}
				    </div></td>
                    <td bgcolor="#FFFFFF"><div align="center">${gz.gkouChu }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                   	${gz.ubasepay-gz.gkouChu}</div></td>
                    <td bgcolor="#FFFFFF"><div align="center" class="top-font01">
                    ${gz.state }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center"><c:if test = "${sessionScope.user.uname=='行健' }">${sessionScope.user.uname }</c:if></div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                    <a href="gz.do?op=loadGz&gid=${gz.gid }">查看</a>|
                    <c:if test = "${gz.state=='未发放'}"><a href ="gz.do?op=sendGz&gid=${gz.gid }">发放</a></c:if>
                    </div>
                    </td>
                  </tr>
                  </c:forEach>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="<%=basePath %>/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%"> 
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
