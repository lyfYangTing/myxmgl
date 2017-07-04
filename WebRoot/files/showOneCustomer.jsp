<%@ page language="java" import="java.util.*,po.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>files/">
    
    <title>My JSP 'kehuminxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
</head>
 
<body>
<form name="fom" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=path%>/images/nav04.gif">
            
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
                <td height="40" class="font42"><table width="885" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" height="247">

					                  <tr>
                    <td height="20" colspan="2" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 客户详细内容</td>
                    </tr>
                     
                  <tr>
				    <td width="16%" height="20" align="right" bgcolor="#FFFFFF">公司名称:</td>
                    <td width="84%" colspan="2" bgcolor="#FFFFFF">${requestScope.customer.cname}</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">联系人:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${requestScope.customer.clxr }</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">联系电话:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${requestScope.customer.ctel}</td>
                    </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">联系地址:</td>
                    <td colspan="2" bgcolor="#FFFFFF">${requestScope.customer.caddress}</td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="#FFFFFF">添加日期:</td>
                    <td colspan="2" bgcolor="#FFFFFF">${requestScope.customer.catime}</td>
                  </tr>
               
                  <tr>
				    <td height="85" align="right" bgcolor="#FFFFFF">公司背景:</td>
				    <td colspan="2" bgcolor="#FFFFFF">${requestScope.customer.cbj}</td>
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
