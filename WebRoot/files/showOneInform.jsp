<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>






<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "����";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "����";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "����";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">

</script>
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#hid").click(function(){
	  // alert(123);
	   		$("#fom").attr("action","http://localhost:8080/xmgl/servlet/listtakexiaoxiServlet?methodName=xianxhi&s=1&sname=���Ӽ�");
	   });
		
	});

</script>
</head>


<body>
<form name="fom" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="../images/nav04.gif">
            
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
                <TD height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
                    <td height="20" colspan="2" bgcolor="#EEEEEE"class="tablestyle_title"><div align="center" style="font-size:16px">��Ϣ��ϸ�б�</div></td>
                  </tr>
                  <tr bgcolor="#FFFFFF" height="20">
                    <td width="16%" align="right">��Ϣ����:</td>
                    <td width="84%">${requestScope.info.ititle }</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">������:</td>
                    <td>${requestScope.info.ifjr }</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">������:</td>
                    <td>${requestScope.info.isjr }</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">����ʱ��:</td>
                    <td>${requestScope.info.iftime }</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" height="80">��Ϣ����:</td>
                    <td>${requestScope.info.itext }</td>
                  </tr>
                </table></TD>
           
			<tr height="10px" >
			
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
          </table></td>
        </tr>
     </table>
</form>
</body>
</html>
