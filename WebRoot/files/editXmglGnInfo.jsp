<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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

<script type="text/javascript">
function a(){
	alert(1);
	var s = document.getElementById("miss").value;
	alert(1);
    if(s == 0){
		alert("请选择优先级");
        return false;
	}
}
</script>
</head>
<body class="ContentBody">
<form action="<%=basePath%>/gongNengServlet.do?op=updateProGN&gnid=${requestScope.xmglProgn.pgId}" method="post"  name="fom"  id="fom">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目功能编辑页面</th>
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
		</tr>
		<TR id="zdjh">
			<TD width="100%"><div class="MainDiv" id='hello1'>
				<fieldset style="height:100%;">
				<legend class='gongneng' >功能编辑</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">		 
					  <tr>
					    <td nowrap align="right" width="15%">功能名称:</td>
					    <td width="35%">
					    	<input name="gname" id='gname' type="text" class="text" style="width:154px"  value = "${requestScope.xmglProgn.pgName}"/>
				        	<span class="red">*</span></td>
					    <td align="right">需求版本号</td>
					    <td>
					    	 <input  type="text" class="text" style="width:154px"  value = " 写死啦啦啦啦" disabled="disabled"/>	
					    </td>
					  </tr>
					  <tr>
					    <td align="right">优先级:</td>
					    <td><select name="miss"  style="width:154px"  id = "miss">
                            <option  selected="selected" value ="0">==请选择==</option>
                            <option value="暂不">暂不</option>
                            <option value="一般">一般</option>
                            <option value="需要">需要</option>
                            <option value="急">急</option>
                            <option value="很急">很急</option>
                        </select></td>
                         <td nowrap="nowrap" align="right">所属需求:</td>
					    <td id="xmxuqiu">
					    	<div id="mod" class='mod'>
					    	<input  type="text" class="text" style="width:154px"  value = "${requestScope.xmglProgn.xmglPromk.xmglProxq.pxTitle}" disabled="disabled"/>					      		
					    	</div> 
					  	 </td>
					  </tr>
					  <tr>
					  <td width="15%"align="right">所属模块:</td>
					    <td width="35%"><span class="TablePanel" style="font-size:16px"></span>
					    <div id="d1" class='d1'>
					    <input  type="text" class="text" style="width:154px"  value = " ${requestScope.xmglProgn.xmglPromk.pmName}" disabled="disabled"/>	
                          </div>
                          </td>
                           </tr>  
                           <tr>
					    <td align="right">功能描述:</td>
					    <td colspan="3"><textarea name="miao" cols="80" rows="6">${requestScope.xmglProgn.pgText }</textarea></td>
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
			<input type="submit" name="Submit"  id='save' value="保存" class="button" onclick="return a();"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
</form>
</body>
</html>
