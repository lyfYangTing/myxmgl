<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>My JSP 'listyuangong.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>项目管理系统 by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script>
	var result='';
	   		//alert(result);
		   if(result!=""){
		   		alert(result);
		   }
</script>
<script type="text/JavaScript">
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("http://localhost:8080/xmgl/files/gaojisousuo1.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/PersonInfoServlet?methodName=QueryOnePersonInfo"+returnv);
	   			}
	   		});
	   	});
	   	
function link1(){
   var p = document.getElementById("textfield3").value;
   var t = ${requestScope.util.totalPage};
   if(p>t){
   	 alert("没有此页");
     document.getElementById("textfield3").value='1';
   } 
   if(p<t){
     document.getElementById("textfield3").value=p;
   }
   if(p<1){
      document.getElementById("textfield3").value='1';
   }
   if(p==""){
   	  alert("请输入");
   }
   fom.action="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage="+p;
} 	
	   	
</script>
</head>
<SCRIPT language=JavaScript>
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
    document.getElementById("fom").action="<%=basePath%>/userServlet.do?op=getRolesAndDuty&caozuo=update";
   	document.getElementById("fom").submit();
}
function deleteOne(){
	var r=confirm("人员离职必须要求完成所有负责的任务和项目，确定离职吗？");
	if(r==true){
		var obj = document.getElementsByName("delid");
		var obj1 = document.getElementsByName("world");
		for (var i=0;i<obj.length;i++){
			if (obj[i].checked == true){
				obj1[i].value="yes";
			}else{
				obj1[i].value="no";
			}
		}
		document.getElementById("fom").action="<%=basePath%>/userServlet.do?op=deleteUser";
		document.getElementById("fom").submit();
	}else{
		return false;
	}
	
}

</SCRIPT>
	<body>
	
	<form name="fom" id="fom" method="post">
	<script type="text/javascript">
 var ss = '';
 	if(ss != ""){
  		 alert(ss);
 }
</script>
	
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="../images/nav04.gif">

									<table width="98%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="24">
												<img src="<%=basePath %>/images/ico07.gif" width="20" height="18" />
											</td>
											
											<td width="679" align="left">
												<input name="Submit" type="submit" class="right-button07" id='find' value="高级搜索" /> 
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: " width="100%" border="0"
							cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<table width="95%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td height="20">
												<span class="newfont07">选择：<a href="#"
													class="right-font08" onclick="selectAll();">全选</a>-<a
													href="#" class="right-font08" onclick="unselectAll();">反选</a>
												</span>
												<input name="Submit" type="button" class="right-button08"
													value="所选人员离职" onclick="deleteOne();"/>
												<input name="Submit" type="button" class="right-button08"
													value="添加人员信息" onclick="link();" />
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<td height="40" class="font42">
												<table width="100%" border="0" cellpadding="4"
													cellspacing="1" bgcolor="#464646" class="newfont03">

													<tr>
														<td height="20" colspan="15" align="center"
															bgcolor="#EEEEEE" class="tablestyle_title"> 
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 员工详细列表 &nbsp; 
														</td>
													</tr>
													
													<tr>
														<td width="6%" align="center" bgcolor="#EEEEEE">
															选择
														</td>
														<td width="9%" height="20" align="center"
															bgcolor="#EEEEEE">
															唯一编号
														</td>
														
														<td width="9%" align="center" bgcolor="#EEEEEE">
															真实姓名
														</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">
															职位
														</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">
															员工类型
														</td>
														<td width="10%" align="center" bgcolor="#EEEEEE"> 
															身份证号码 
														</td>
														<td width="4%" align="center" bgcolor="#EEEEEE">
															性别
														</td>
														<td width="4%" align="center" bgcolor="#EEEEEE">
															年龄
														</td>
														<td width="11%" align="center" bgcolor="#EEEEEE">
															电子邮件
														</td>
														<td width="10%" align="center" bgcolor="#EEEEEE">
															联系电话
														</td>
														<td width="19%" align="center" bgcolor="#EEEEEE">
															操作
														</td>
													</tr>
													<c:forEach items = "${requestScope.util.list}"  var = "xmglUser">
													<tr>
														<td bgcolor="#FFFFFF">
															<input type="checkbox" name="delid" value="${xmglUser.uid}" />
															<input type="hidden"  name="hello"  value="${xmglUser.uid}">
                 											<input type="hidden"  name="world" >
                 										</td>
														<td height="20" bgcolor="#FFFFFF">
															<a href="<%=basePath%>/userServlet.do?op=getOneUserInfo&caozuo=chaid&uuid=${xmglUser.uid}">${xmglUser.uid}</a>
														</td>
														<td bgcolor="#FFFFFF">
															<a href="<%=basePath%>/userServlet.do?op=getOneUserInfo&caozuo=chaid&uuid=${xmglUser.uid}">${xmglUser.uname}</a>
														</td>
														<td bgcolor="#FFFFFF">
															${xmglUser.duty.dname}
														</td>
														<td bgcolor="#FFFFFF">
															${xmglUser.ustaffType==0?'实习':'在职'}
														</td>
														<td bgcolor="#FFFFFF">
															${xmglUser.uIDcard}
														</td>
														<td height="20" bgcolor="#FFFFFF">
															${xmglUser.usex==0?'男':'女'}
														</td>
														<td height="20" bgcolor="#FFFFFF">
															${xmglUser.uage}
														</td>
														<td height="20" bgcolor="#FFFFFF">
															 ${xmglUser.uemail}
														</td>
														<td height="20" bgcolor="#FFFFFF">
															 ${xmglUser.utelephone}
														</td>
														<td bgcolor="#FFFFFF">
														
															<a href="<%=basePath %>userServlet.do?op=getRolesAndDuty&caozuo=update&uuid=${xmglUser.uid}">编辑</a>&nbsp;|&nbsp;
															<a href="<%=basePath %>/files/renyuanSendSal.jsp?uid=${xmglUser.uid}">发工资</a>&nbsp;|&nbsp;
															<a href="http://localhost:8080/xmgl/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=2&flag=2">任务</a>
														</td>
														</tr>
													</c:forEach>
									</table>
								</td>
							</tr>
						</table>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="6">
									<img src="../images/spacer.gif" width="1" height="1" />
								</td>
							</tr>
							<tr>
								<td height="33">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0" class="right-font08">
										<tr>
											<td width="50%">
												第 <span class="right-text09">${requestScope.util.curpage}</span> 页 | 
												共<span class="right-text09">${requestScope.util.totalPage}</span> 页
												| <span class="right-text09">${requestScope.util.count}</span>条记录</td>
											<td width="49%" align="right">
												[
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=1" class="right-font08">首页</a> |
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">上一页</a> |
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=${requestScope.util.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">下一页</a> |
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=${requestScope.util.totalPage }" class="right-font08">末页</a>] 转至：
											</td>
											<td width="1%">
												<table width="20" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="1%">
															<input id="textfield3" type="text" name="page"
																class="right-textfield03" size="1" />
														</td>
														<td width="87%">
															<input name="Submit23222" type="submit"
																class="right-button06" value="" onClick="link1();"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
