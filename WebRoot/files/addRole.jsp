<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/dtree.js"></script>
<link href="<%=path%>/dtree.css" rel="stylesheet"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#allselect").click(function(){
			 $(":checkbox").attr("checked","checked");
		});
		$("#fanselect").click(function(){
			var size=$(":checkbox").length;
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
});
$(document).ready(function(){
	$("#fanhui").click(function(){
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=getAllFuncs");
	});
});
function queren11(){
	var juename=$("#juename").val();
	var juebeizhu=$("#juebeizhu").val();
	if(juename.length==0){
		alert("��ɫ���Ʋ���Ϊ�գ�");
	}else if(juename.length>20){
		alert("��ɫ���Ƴ��ȹ�����");
	}else if(juebeizhu.length>300){
		alert("��ע���ȹ�����");
	}else{
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=addRoleAndFunc");
		$("#fom").submit();
	}
}
function zx(){
	var s=document.getElementById("juebeizhu").value;
	var i=300-s.length;
	if(s.length<=300){
		$("#sy").attr("color","black");
		document.getElementById("sy").innerHTML="ʣ��("+i+")��";
	}else{
		$("#sy").attr("color","red");
		document.getElementById("sy").innerHTML="������������";
	}
}
</script>
<script type="text/javascript"> 
var powerId = new dTree('powerId');
var root = 0;
var powerCode = false;
var check = false;
powerId.add(root,-1,'����Ȩ��','');
function checkNode(nodeId){
	powerId.checkNode(nodeId);
}
</script>
</head>
<body >
<form  name="fom" id="fom" method="post" >
<input type="hidden" value="" name="token">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- borderColor="black" -->
<table border="1" align="center"  width="80%" cellspacing="0" cellpadding="0" >
  <tr>
    <td class="tablestyle_title" width="30%" >
    <a href="#"
	class="right-font08" id="allselect">
	<font color="white">ȫѡ</font>
	</a>-<a
	href="#" class="right-font08" id="fanselect">
	<font color="white">��ѡ</font></a></td>
     <td  class="tablestyle_title">�������ɫ���Ʋ����Ȩ�ޣ�
   		<input type="text" name="juename" id="juename">
   		��ע��<input type="text" name="juebeizhu" id="juebeizhu" value="" onkeyup="zx();">
   		<font size="2px" id="sy" color="black">ʣ��(300)��</font>
	</td>
  </tr>
  <tr>
  	<td colspan = "2" >
  		<c:forEach var="fun" items="${listAll}">
	           <script>
	            //mainFrame��ת�Ľ���
	              powerId.add("${fun.fuid}","${fun.pid}","${fun.funame}","check","${fun.fuid}","func","","${fun.fuhref}","${fun.funame}","mainFrame");
	             </script>
		  	  	</c:forEach>
		  	  <script>
		  	  	document.write(powerId);
		  	    powerId.openAll();
		  	  </script>
  	</td>
  </tr>
 
	
</table>

<div align="center">
	<input type="button"  class="right-button08" id="queren"  value="ȷ��" onclick="queren11();" />
	<input type="submit" class="right-button08" id="fanhui"  value="����">
    <input type="reset" class="right-button08"   value="����" /></div>
</form>
</body>
</html>
