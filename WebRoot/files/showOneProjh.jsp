<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/xmgl/">
    <title>My JSP 'jihuamingxi.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
</script>
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
                      <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 计划明细列表 &nbsp;</td>
                     </tr>
                  <tr>
				    <td width="15%" height="20" align="right" bgcolor="#FFFFFF">计划标题:</td>
                    <td width="85%" align="left" bgcolor="#FFFFFF">${requestScope.xmglProplan.ppName}</td>
                    </tr>
                  <tr>
				    <td height="20" align="right" bgcolor="#FFFFFF">项目名称:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.pjName}</td>
                    </tr>
                  <tr>
				   <td height="20" align="right" bgcolor="#FFFFFF">项目模块:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.progn.xmglPromk.pmName}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">项目功能:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.progn.pgName}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划开始时间:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppStartTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划结束时间:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppEndTime}</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">实际开始时间:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppsjStartTime}</td>
                    </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">实际结束时间:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppsjEndTime}</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">计划创建时间:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppsCreateTime}</td> 
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">任务执行人:</td>
                    <td bgcolor="#FFFFFF"> ${requestScope.xmglProplan.user.uname}</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">工期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.projecttime }</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">优先级:</td>
                      <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppYxj }</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">任务类型:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.rwlx.rwName}</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">任务下发时间:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppsRwGrantTime}</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">前置任务计划:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.qzPlan.ppName}</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">状态:</td>
                     
                      <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppState}</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">是否超期:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.isOver }</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF">超期天数:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.isOverdate }</td>
                    </tr>
                  <tr>
				    <td align="right" bgcolor="#FFFFFF">计划备注:</td>
                    <td bgcolor="#FFFFFF">${requestScope.xmglProplan.ppBeizhu}</td>
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
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
</body>
</html>
