<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
    <base href="http://localhost:8080/xmgllx/">
    <title>My JSP 'editjihua.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript">
function xuanxm(){
	var s = document.getElementById("pid").value;
	var xmlHttp;
	try{
		   // Firefox, Opera 8.0+, Safari
		    xmlHttp=new XMLHttpRequest();
		}catch (e){
		  // Internet Explorer
		   try{
		      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		   }catch (e){
		      try{
		         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		      }catch (e){
		         alert("您的浏览器不支持AJAX！");
		         return false;
		      }
		   }
		
		}
	alert(xmlHttp);
	//调用open方法getAllProxqs
	alert("gongNengServlet.do?op=getAllProxqs&pno="+s);
	//gongNengServlet
	xmlHttp.open("post","<%=basePath%>/gongNengServlet.do?op=getAllProxqs&pno="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		var liebiao = document.getElementById("xuqiu");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				opt.value=zx[i].pxId;
				opt.text=zx[i].pxTitle;
				liebiao.add(opt);
			}
	 	 }
	}
	//调用send方法
	xmlHttp.send();
	return false;
}
</script>
<script type="text/javascript">
function xuanmk(){
	var s = document.getElementById("xuqiu").value;
	alert(s);
	var xmlHttp;
	try{
		   // Firefox, Opera 8.0+, Safari
		    xmlHttp=new XMLHttpRequest();
		}catch (e){
		  // Internet Explorer
		   try{
		      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		   }catch (e){
		      try{
		         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		      }catch (e){
		         alert("您的浏览器不支持AJAX！");
		         return false;
		      }
		   }
		
		}
	alert(xmlHttp);
	xmlHttp.open("post","<%=basePath%>/gongNengServlet.do?op=getAllProMks&xqno="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		alert(zx);
	 		var liebiao = document.getElementById("prmk");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				alert(zx[i]);
				opt.value=zx[i].pmId;
				opt.text=zx[i].pmName;
				liebiao.add(opt);
			}
	 	 }
	}
	//调用send方法
	
	xmlHttp.send();
	return false;
}
</script>
<script type="text/javascript">
	
</script>
<body class="ContentBody">
<form action="<%=basePath%>/gongNengServlet.do?op=addProGN" method="post"  name="fom"  id="fom">

<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目功能添加页面</th>
  </tr>
  
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<input type="button" name="Submit" value="保存" class="button" onchange="save();"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td>
		</tr>
		
		<tr align="center">
			<td class="TablePanel" height="30" style="font-size:16px"><span class="TablePanel" style="font-size:16px"></span>
		  
		  <select name="pid" id="pid" onchange="xuanxm();" style="width:100px">
		  	<option value="0">请选择项目</option>
		  	<c:forEach items = "${requestScope.xmglProjbList}" var = "projb">
		  		<option value = "${projb.pjId}">
		  			${projb.pjName}
		  		</option>
		  	</c:forEach>
          </select>
		</tr>
		<TR id="zdjh">
			<TD width="100%"><div class="MainDiv" id='hello1'>
				<fieldset style="height:100%;">
				<legend class='gongneng' >新的功能</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">		 
					  <tr>
					    <td nowrap align="right" width="15%">功能名称:</td>
					    <td width="35%">
					    <input name="gname" id='gname' type="text" class="text" style="width:154px"  "/>
				        <span class="red">*</span></td>
					    <td align="right">需求版本号</td>
					    <td><input class="text" name="hao" style="width:154px" value = "写死啦啦啦啦"/></td>
					  </tr>
					  <tr>
					    <td align="right">优先级:</td>
					    <td><select name="miss"  style="width:154px" >
                            <option  selected="selected">==请选择==</option>
                            <option value="暂不">暂不</option>
                            <option value="一般">一般</option>
                            <option value="需要">需要</option>
                            <option value="急">急</option>
                            <option value="很急">很急</option>
                        </select></td>
                         <td nowrap="nowrap" align="right">所属需求:</td>
					    <td id="xmxuqiu">
					    	<div id="mod" class='mod'>
					      		<select  style="width:154px" id = "xuqiu"  name = "xqid" onchange="xuanmk();">  
					       			 <option>--请选择--</option>
					      		</select>
					    	</div> 
					  	 </td>
					  </tr>
					  <tr>
					  <td width="15%"align="right">所属模块:</td>
					    <td width="35%"><span class="TablePanel" style="font-size:16px"></span>
					    <div id="d1" class='d1'>
					      <select  style="width:154px" id = "prmk" name = "prmkid">
                            <option  selected="selected">=请选择=</option>
                          </select>
                          </div>
                          </td>
                           </tr>  
                           <tr>
					    <td align="right">功能描述:</td>
					    <td colspan="3"><textarea name="miao" cols="80" rows="6"></textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset>
				<div class='hello' id='hell'></div></div></TD>
		</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" name="Submit"  id='save' value="保存" class="button"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
		<input type='hidden' value='' name='gname1' id='gname1'>
		<input type='hidden' value='' name='hao1' id='hao1'>
		<input type='hidden' value='' name='miss1' id='miss1'>
		<input type='hidden' value='' name='modno1' id='modno1'>
		<input type='hidden' value='' name='miao1' id='miao1'>
</form>
</body>
</html>
