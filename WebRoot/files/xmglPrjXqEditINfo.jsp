<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/jquery.js"></script>
<script language="JavaScript" type="text/javascript">
	$(document).ready(function (){
		$("#save").click(function(){
		    var  r=confirm("�Ƿ�ȷ�ϱ���");
		    var title=$("#title").val();
		   	alert(r);
		   	alert(title);
		    if(r==true){
				if(title==""){
				      $("#name").html("���ⲻ��Ϊ��");
					  return false;
			 	 }
			 	 if(title.length>10){
			 	      $("#name").html("���������Ϊ10�����������룡");
			 	      return false;
			 	 }
			 	 $("#fom").attr("action","<%=basePath%>/prjXqServlet.do?op=editXqInfo&xqid=${requestScope.xmglProxq.pxId}");
	             $("#fom").submit();
			 	 alert("������");
				}else{
					 return false;	 
			}
		});
		
	});
</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form  method="post" id="fom"  name="fom" action="">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >������</th>
  </tr>
  <tr>
    <td class="CPanel">		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<input type="button" name="Submit" value="����" class="button"/>��			
			<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/>
		</td></tr>		
		<tr align="center">
          <td class="TablePanel">${requestScope.xmglProxq.xmglProjb.pjName}</td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>������</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td width="15%" align="right" valign=''>�������:</td>
					    <td width="35%"><input type="text" name="title" id="title" value="${requestScope.xmglProxq.pxTitle}"/>
					    <span class="red">*</span><br><div><font  id="name" color='red'>&nbsp;</font></div></td>
					    <td width="15%" align="right">&nbsp;</td>
					    <td width="35%">&nbsp;</td>
					  </tr>
					  <tr>
					    <td align="right">��������:</td>
					    <td colspan="3"><textarea name="neirong" cols="100" rows="20" >
					    ${requestScope.xmglProxq.pxText}
					    </textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset></TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="button" name="Submit" value="����" class="button" id="save"/>��
			
			<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
	
	

</div>
</form>
</body>
</html>
