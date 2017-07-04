<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目管理系统 by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script language="JavaScript" type="text/javascript">
	var index=0;
	$(document).ready(function (){
		$("#save").click(function(){
		    var  r=confirm("是否确认保存");
		    var title=$("#title").val();
		    var proname=$("#proname").val();
		    var ms=$("#ms");
		    if(r==true){
		    	if(index==0&&proname!='0'&&ms!=""){	
			 	 	// alert("进来了");
		    		 $("#fom").attr("action","<%=basePath%>/prjXqServlet.do?op=addXQInfo");
	                 $("#fom").submit();
		    	}else{
		    		alert("数据信息不完整，请修改！");
		    	}			 	
			}else{
			 return false;
			}
		});		
	});	
	function panduan(num){
		$(document).ready(function(){
			 var title=$("#title").val();
		     var proname=$("#proname").val();
		     var ms=$("#ms");
			if(num=='1'){
				if(title.length>10){
					if($("#name").html()!=""){
						index++;
					}
					$("#name").html(" 标题名称最长为10，请重新输入！");
				}else if(title.length==""){
					if($("#name").html()!=""){
						index++;
					}
					$("#name").html("标题不能为空 ");
				}else{
					if(index>0&&$("#name").html()!=""){
 							index--;
 					}
 					$("#name").html("");
				}
			}else if(num=='2'){
				if(ms.length>300){
					if($("#nr").html()!=""){
						index++;
					}
					$("#nr").html("内容过长 ");
				}else{
					if(index>0&&$("#nr").html()!=""){
 							index--;
 					}
 					$("#nr").html("");
				}
			}else if(num=='3'){
				if(proname=='0'){
					if($("#pname").html()!=""){
						index++;
					}
					 $("#pname").html("项目名称不能为空");
				}else{
					if(index>0&&$("#pname").html()!=""){
 							index--;
 					}
 					$("#pname").html("");
				}
			}
		});
	}
</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>
<body class="ContentBody">
  <form  method="post" id="fom" name="fom" action="" target="mainFrame" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >添加需求<font color="red" size="2px">*为必填项</font></th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<input type="button" name="Submit" value="保存" class="button" onclick="alert('保存成功！');"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td></tr>
       
		<tr align="center">
          <td class="TablePanel">
	          <select id="proname" name="proname" onchange='panduan(3)'>
		           <option value="0">==请选择==</option>
		           <c:forEach items = "${requestScope.listPrjb}" var = "prjb">
		           		 <option value="${prjb.pjId}">${prjb.pjName}</option>
		           </c:forEach>
	          </select>
	          <font color="red">*</font>
	         <div ><font id="pname" color="red"></font></div>
          </td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加需求</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
						  <tr>
						    <td width="15%" align="right">需求标题:</td>
						    <td width="35%"><input type="text" id="title" name="title" onchange="panduan('1')"/>
							    <span class="red">*</span>
							    <div><font id="name" color="red">&nbsp;</font></div>
						    </td>
						    <td width="35%"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
						  </tr>
						  <tr>
						    <td align="right">需求描述:</td>
						    <td colspan="3">
						    	<font color="gray">最多可输入300字符</font><br>
						    	<textarea name="ms" id="ms" cols="100" rows="20" onchange="panduan('2')">
						    	</textarea>
						    	<div><font id="nr" color="red">&nbsp;&nbsp;&nbsp;</font></div></td>
						    <td></td>
						   </tr>
					  </table>
			  <br />
				</fieldset>	</TD>
		</TR>
		</TABLE>
	 </td>
  </tr>
  
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="hidden" name="token" value="1479369308139"/>
			<input type="button" name="Submit" value="保存" class="button" id="save"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		
		</TABLE>
	

</div>
</form>
</body>
</html>

