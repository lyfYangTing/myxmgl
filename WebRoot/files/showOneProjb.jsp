<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/xmgllx/">  
    <title>My JSP 'listxiangmumingxi.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=basePath %>//css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>//css/style.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.open("gaojisousuo.htm","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
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

function link(){
    document.getElementById("fom").action="xiangmu.htm";
   document.getElementById("fom").submit();
}

</SCRIPT>

<body>

<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="679" align="left"><a href="#" onclick="sousuo()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a></td>	
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
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 项目细列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">项目名称:</td>
                    <td width="85%" align="left" bgcolor="#FFFFFF">${requestScope.xmglProjb.pjName}</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">客户名称:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.xmglCustomer.cname}</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目负责人:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.xmglUser.uname}</td>
                    </tr>
					<tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目金额:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjMoney}</td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">开发人数:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjDeveloperTotal}</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">计划启动日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjKfdate}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划完成日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjWcdate}</td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">实际启动日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjSjkfTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">实际完成日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjSjwcTime}</td>
                    </tr>
				<tr>
				    <td align="right" bgcolor="#FFFFFF">立项日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjLxsj}</td>
                    </tr>
				<tr>
				    <td align="right" bgcolor="#FFFFFF">更新日期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjUpdateTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">任务优先级:</td>
                      <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjYxj}</td>     
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">是否超期:</td>
                    <td bgcolor="#FFFFFF"></td>
                    </tr>
					<tr>
				    <td align="right" bgcolor="#FFFFFF">超期天数:</td>
                    <td bgcolor="#FFFFFF">天</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">完成状态:</td>
                      <td bgcolor="#FFFFFF">${requestScope.xmglProjb.pjState}</td>
                    </tr>
					<tr height='80'>
				    <td align="right" bgcolor="#FFFFFF">项目备注:</td>
                    <td bgcolor="#FFFFFF"  rowspan="3" >${requestScope.xmglProjb.pjBz}</td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%" align="right">共 <span class="right-text09">1</span> 页 | 第 <span class="right-text09">1</span> 页</td>
                    <tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
</body>
</html>
