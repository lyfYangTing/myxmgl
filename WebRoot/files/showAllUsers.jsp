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
		<title>��Ŀ����ϵͳ by www.eyingda.com</title>
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
	   			var returnv=window.showModalDialog("http://localhost:8080/xmgl/files/gaojisousuo1.jsp","�߼���ѯ","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/PersonInfoServlet?methodName=QueryOnePersonInfo"+returnv);
	   			}
	   		});
	   	});
	   	
function link1(){
   var p = document.getElementById("textfield3").value;
   var t = ${requestScope.util.totalPage};
   if(p>t){
   	 alert("û�д�ҳ");
     document.getElementById("textfield3").value='1';
   } 
   if(p<t){
     document.getElementById("textfield3").value=p;
   }
   if(p<1){
      document.getElementById("textfield3").value='1';
   }
   if(p==""){
   	  alert("������");
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
	var r=confirm("��Ա��ְ����Ҫ��������и�����������Ŀ��ȷ����ְ��");
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
												<input name="Submit" type="submit" class="right-button07" id='find' value="�߼�����" /> 
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
												<span class="newfont07">ѡ��<a href="#"
													class="right-font08" onclick="selectAll();">ȫѡ</a>-<a
													href="#" class="right-font08" onclick="unselectAll();">��ѡ</a>
												</span>
												<input name="Submit" type="button" class="right-button08"
													value="��ѡ��Ա��ְ" onclick="deleteOne();"/>
												<input name="Submit" type="button" class="right-button08"
													value="�����Ա��Ϣ" onclick="link();" />
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
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ա����ϸ�б� &nbsp; 
														</td>
													</tr>
													
													<tr>
														<td width="6%" align="center" bgcolor="#EEEEEE">
															ѡ��
														</td>
														<td width="9%" height="20" align="center"
															bgcolor="#EEEEEE">
															Ψһ���
														</td>
														
														<td width="9%" align="center" bgcolor="#EEEEEE">
															��ʵ����
														</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">
															ְλ
														</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">
															Ա������
														</td>
														<td width="10%" align="center" bgcolor="#EEEEEE"> 
															���֤���� 
														</td>
														<td width="4%" align="center" bgcolor="#EEEEEE">
															�Ա�
														</td>
														<td width="4%" align="center" bgcolor="#EEEEEE">
															����
														</td>
														<td width="11%" align="center" bgcolor="#EEEEEE">
															�����ʼ�
														</td>
														<td width="10%" align="center" bgcolor="#EEEEEE">
															��ϵ�绰
														</td>
														<td width="19%" align="center" bgcolor="#EEEEEE">
															����
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
															${xmglUser.ustaffType==0?'ʵϰ':'��ְ'}
														</td>
														<td bgcolor="#FFFFFF">
															${xmglUser.uIDcard}
														</td>
														<td height="20" bgcolor="#FFFFFF">
															${xmglUser.usex==0?'��':'Ů'}
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
														
															<a href="<%=basePath %>userServlet.do?op=getRolesAndDuty&caozuo=update&uuid=${xmglUser.uid}">�༭</a>&nbsp;|&nbsp;
															<a href="<%=basePath %>/files/renyuanSendSal.jsp?uid=${xmglUser.uid}">������</a>&nbsp;|&nbsp;
															<a href="http://localhost:8080/xmgl/servlet/privateControlServlet?methodName=seeWorkInfo&curPage=2&flag=2">����</a>
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
												�� <span class="right-text09">${requestScope.util.curpage}</span> ҳ | 
												��<span class="right-text09">${requestScope.util.totalPage}</span> ҳ
												| <span class="right-text09">${requestScope.util.count}</span>����¼</td>
											<td width="49%" align="right">
												[
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=1" class="right-font08">��ҳ</a> |
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">��һҳ</a> |
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=${requestScope.util.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">��һҳ</a> |
												<a href="<%=basePath%>/userServlet.do?op=getPageUsers&caozuo=1&curpage=${requestScope.util.totalPage }" class="right-font08">ĩҳ</a>] ת����
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
