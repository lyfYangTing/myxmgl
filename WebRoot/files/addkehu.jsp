<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>






<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/xmgl/files/">
    
    <title>My JSP 'kehu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>��Ŀ����ϵͳ </title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script language="JavaScript" type="text/javascript">

$(document).ready(function (){
		$("#save").click(function(){
		    var  r=confirm("�Ƿ�ȷ�ϱ���");
		    if(r==true){
		        //�ж��Ǳ༭��������		    
				var clientname=$("#clientname").val();
				var ctel=$("#ctel").val();
				var cper=$("#cper").val();
				var caddr=$("#caddr").val();
				var cbackground=$("#cbackground").val();
				if(clientname==""){
			     	 $("#name").html("��˾���Ʋ���Ϊ��");
					  return false;
		 		 }
		 		 if(clientname.length>10){
		 	  	 	   $("#name").html("��˾�����Ϊ10");
		 	     	 return false;
		 		 }
		 		if(cper.length>10){
		 	 		   $("#per").html("��ϵ�������Ϊ10");
		 	 		   return false;
		 		 }
		 		 if(caddr.length>30){
		 		 		$("#addr").html("��ϵ��ַ�Ϊ30");
		 		 		return false;
		 		 }
		 		 if(cbackground.length>300){
		 		         $("#background").html("��˾�����Ϊ300");
		 		         return false;
		 		 }
		 		  if(!/^\d*[\d,-]\d*$/.test(ctel)){
		 		  		if(ctel!=""){
		 		  			$("#tel").html("�绰�������");
				     		return  false;
		 		  		}
				     	
				     }
		 		 if(ctel.length>20){
		 		 		$("#tel").html("�绰�������Ϊ20");
		 		 		return  false;
		 		 }
		 		 $("#fom").attr("action","<%=path%>/customerServlet.do?op=insertOne");
			}else{
				  return false;
			}
			
		});
		
	});
function check()
{
document.getElementById("aa").style.display="";
}

</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody" >
  <form  method="post" name="form" target="mainFrame"  id="fom">

<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >�ͻ�������Ϣ¼��</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		</td></tr>
				<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>�ͻ���Ϣ</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					   
					 
					  <tr>
					    <td nowrap align="right" width="15%">��˾����:</td>
					    <td width="35%">
					    <input name="clientname"  class="text" style="width:154px" value="${requestScope.customer.cname }"  id="clientname"/>
					    <input type="hidden" name="cid" value="${requestScope.customer.cid}"> 
				        <span class="red">*</span><div id="name"></div></td>
					    <td width="16%" align="right" nowrap="nowrap">��ϵ��:</td>
					    <td width="34%"><input class="text" name="cper"  id="cper" style="width:154px" value="${requestScope.customer.clxr }">
					    <div id="per"></div></td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">��ϵ�绰:</td>
					    <td><input class="text" name="ctel" id="ctel" style="width:154px" value="${requestScope.customer.ctel }"/><div id="tel"></div></td>
					    <td align="right">��ϵ��ַ:</td>
					    <td><input class="text" name="caddr" id="caddr" style="width:154px" value="${requestScope.customer.caddress }"/><div id="addr"></div></td>
					  </tr>
					 
					  <tr>
					    <td align="right">��˾����:</td>
					    <td colspan="3"><textarea name="cbackground" id="cbackground" cols="100" rows="8" value="${requestScope.customer.cbj}"></textarea>
					    <div id="background"></div></td>
					    </tr>
                    
					  </table>
			  <br />
				</fieldset>	</TD>
			
		</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" height="50px" align="right">
			
			<input type="hidden" name="token" value="1478916224867"/>	
			<input type="submit" name="Submit" value="����" class="button"  id="save"/>	
			
			<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>

</div>
</form>
</body>
</html>
