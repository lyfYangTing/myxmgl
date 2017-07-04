<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'listYuanGongGongZi.jsp' starting page</title>
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
<script type="text/JavaScript">

</script>
<link href="/xmgl/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>


<form action="gz.do?op=updateSal&gid=${requestScope.xmglGz.gid }&sumSal=${xmglGz.ubasepay+xmglGz.ubonus+xmglGz.gotherAward}" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="/xmgl/images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21">&nbsp;</td>
			  </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				  <tr>
                    <td height="20" colspan="3" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> 确认员工工资发放</td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">工资领取人:</td>
                    <td colspan="2" bgcolor="#FFFFFF">${requestScope.xmglGz.uname }</td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">基本工资:</td>
                    <td colspan="2" bgcolor="#FFFFFF">${xmglGz.ubasepay }</td>
                  </tr>
                  <tr>
				    <td width="16%" height="20" align="right" bgcolor="#FFFFFF">奖金:</td>
                    <td width="84%" colspan="2" bgcolor="#FFFFFF">${xmglGz.ubonus }</td>
                  </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">其它奖金:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${xmglGz.gotherAward }</td>
                    </tr>
                  <tr>	
				    <td height="20" align="right" bgcolor="#FFFFFF">总工资:</td>
				    <td colspan="2" bgcolor="#FFFFFF">
				   
				    ${xmglGz.ubasepay+xmglGz.ubonus+xmglGz.gotherAward}</td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">处罚扣除金额:</td>
                    <td colspan="2" bgcolor="#FFFFFF">${xmglGz.gkouChu }</td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">应实发总工资:</td>
                    <td colspan="2" bgcolor="#FFFFFF">
					 ${xmglGz.ubasepay+xmglGz.ubonus+xmglGz.gotherAward-xmglGz.gkouChu }</td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">工资发放人:</td>
                    <td colspan="2" bgcolor="#FFFFFF"><c:if test = "${sessionScope.user.uname=='行健' }">${sessionScope.user.uname }</c:if></td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">记录创建时间:</td>
                    <td colspan="2" bgcolor="#FFFFFF">
                    ${xmglGz.createTime}</td>
                  </tr>
                  <tr>
                  	<td colspan='3' align="center" bgcolor="#EEEEEE"class="tablestyle_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name=submit value="确认发放" >
                  	</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>
