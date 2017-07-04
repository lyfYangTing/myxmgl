<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>

<link href="../css/css.css" rel="stylesheet" type="text/css" />

<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="<%=basePath %>/images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="679" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>	
		  </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	         
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 任务细列表 </td>
                    </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">任务标题:</td>
                    <td width="85%" align="left" bgcolor="#FFFFFF">${requestScope.xmglProplan.ppName}</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">客户名称:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.xmglCustomer.cname}</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目经理:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.xmglUser.uname}</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">任务发送人:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.xmglUser.uname}</td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">任务执行人:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.user.uname}</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">计划开始日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppStartTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划完成日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppEndTime}</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">实际开始日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppsjStartTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">实际完成日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppsjEndTime}</td>
                    </tr>
				<tr>
				    <td align="right" bgcolor="#FFFFFF">优先级:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppYxj }</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF" height="80">任务说明:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppBeizhu}</td>
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
