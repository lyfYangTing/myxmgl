<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="http://localhost:8080/xmgl/files/">

		<title>My JSP 'yuangong.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>项目管理系统 by www.eyingda.com</title>
		<link rel="stylesheet" rev="stylesheet"
			href="/xmgl/css/style.css" type="text/css" media="all" />

<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
		<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
  if(a!=true)return false;
  window.open("冲突页.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}

function check()
{
document.getElementById("aa").style.display="";
}

function baocunle(){
	var password=document.getElementById("ppassword").value;
	var page=document.getElementById("page").value;
	var zwno=document.getElementById("zwno").value;
	var plei=document.getElementById("plei").value;
	var ispower=document.getElementById("ispower").value;
	var pfsalary=document.getElementById("pfsalary").value;
	var pgsalary=document.getElementById("pgsalary").value;
	var posalary=document.getElementById("posalary").value;
	var pemail=document.getElementById("pemail").value;
	var ptelephone=document.getElementById("ptelephone").value;
	var paddr=document.getElementById("paddr").value;
	var pbankName=document.getElementById("pbankName").value;
	var pbankuser=document.getElementById("pbankuser").value;
	var pdescription=document.getElementById("pdescription").value;
	if(password==""){
		alert("密码不能为空！");
	}else if(password.length<5||password.length>10){
		alert("密码长度不符合要求（应为5-10位）");
	}else if(page==""){
		alert("年龄不能为空！");
	}else if(!/^[1-9][0-9]*$/.test(page)==true){
		alert("年龄位置请输入数字！");
	}else if(page.length>3){
		alert("年龄长度过长！");
	}else if(zwno=="0"){
		alert("职务不能为空");
	}else if(plei=="2"){
		alert("员工类型不能为空");
	}else if(ispower=="0"){
		alert("角色名称不能为空");
	}else if(pfsalary==""){
		alert("基本工资不能为空");
	}else if(!/^[1-9][0-9]*$/.test(pfsalary)==true){
		alert("基本工资位置请输入数字！");
	}else if(pfsalary.length>10){
		alert("基本工资长度过长！");
	}else if(pgsalary==""){
		alert("奖金不能为空");
	}else if(!/^[1-9][0-9]*$/.test(pgsalary)==true){
		alert("奖金位置请输入数字！");
	}else if(pgsalary.length>10){
		alert("奖金长度过长！");
	}else if(posalary==""){
		alert("其他补助金不能为空");
	}else if(!/^[1-9][0-9]*$/.test(posalary)==true){
		alert("其他补助金位置请输入数字！");
	}else if(posalary.length>10){
		alert("其他补助金长度过长！");
	}else if(pemail.length>30){
		alert("电子邮箱长度过长！");
	}else if(ptelephone.length>15){
		alert("电话号码长度过长！");
	}else if(paddr.length>30){
		alert("居住地址长度过长！");
	}else if(pbankName.length>20){
		alert("银行名称长度过长！");
	}else if(pbankuser.length>30){
		alert("银行账户长度过长！");
	}else if(pdescription.length>300){
		alert("描述长度过长！");
	}else{
		alert("保存成功！");
		form.action="http://localhost:8080/xmgl/servlet/PersonInfoServlet?methodName=updatePersonInfo";
		form.submit();
		
	}
}
</script>
<script>
<script type="text/javascript">

function xuanzesj(){
	var s=document.getElementById("zwno").value;
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
			xmlHttp.open("get","<%=basePath%>/userServlet.do?op=getPUser&did="+s,true);
		
			//回调函数
			
		    xmlHttp.onreadystatechange=function(){
			    if (xmlHttp.readyState == 4){
	                var zx = eval(xmlHttp.responseText);
				    var sele = document.getElementById("sjld");
				    for(var i=0;i<zx.length;i++){
				    var opt = document.createElement("option");
				        opt.value=zx[i].uid;
						opt.text=zx[i].uname;
						sele.add(opt);
				    }
				}
		    }
		    xmlHttp.send();	
		    return false;
}

</script>

</script>

</head>

	<body class="ContentBody">
	
		<form  method="post" name="form" >
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0"
					class="CContent">
					<tr>
						<th class="tablestyle_title">
							员工基本信息录入<font size="2px" color="red">（*为必填内容）</font>
						</th>
					</tr>
					<tr>
						<td class="CPanel">
							<table border="0" cellpadding="0" cellspacing="0"
								style="width: 100%">
								<tr>
									<td align="left">
										<br/>
									</td>
								</tr>
								<TR>
									<TD width="100%">
										<fieldset style="height: 100%;">
											<legend>
												员工信息
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												
												<tr>
													<td width="16%" align="right" nowrap="nowrap"> 
														员工编号: 
													</td>
													<td width="34%">
														<input type="hidden" name="pno" value="${requestScope.user.uid }">
														<input class="text"  style="width: 154px"
															value="${requestScope.user.uid }"  disabled="disabled"/>
													</td>
													<td width="16%" align="right" nowrap="nowrap">
														密码:
													</td>
													<td width="34%">
														<input type="password" name='ppassword' id="ppassword" style="width: 154px"
															value="${requestScope.user.upassword }"><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">
														真实姓名:
													</td>
													<td>
													<input type="hidden" name="pname" value="${requestScope.user.uname }">
														<input class="text" 
															style="width: 154px" value="${requestScope.user.uname }" disabled="disabled" />
													</td>
													<td align="right">
														性别:
													</td>
													<td>
														<select name="psex" >
															<option selected="selected">
																==请选择==
															</option>
															<option value="0" selected="selected">
																男
															</option>
															<option value="1" >
																女
															</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">年龄:</td>
													<td>
														<input class="text" name='page' id="page"
															style="width: 154px" value="${requestScope.user.uage }" /><font color="red">*</font>
													</td>
													<td align="right">
														职位:
													</td>
													<td>
														<select name="zwno" id="zwno" onchange="xuanzesj()"> 
															<option selected="selected">==请选择==</option>
														
															<option value="2"  >项目经理1</option>
														
															<option value="11111"  selected="selected">程序员</option>
														
															<option value="1"  >管理员1</option>
														
															<option value="4"  >项目经理1</option>
														
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														出生日期:
													</td>
													<td>
													<input type="hidden" name="pbirthday" value="1991-03-05">
														<input class="text" 
															style="width: 154px" value="1991-03-05" disabled="disabled" />
													</td>
													<td align="right">
														身份证号码:
													</td>
													<td>
													<input type="hidden" name="pid" value="11111">
														<input class="text" 
															style="width: 154px" value="11111"  disabled="disabled"/>
													</td>
												</tr>
												<tr>
													<td align="right">
														电子邮箱:
													</td>
													<td>
														<input class="text" name='pemail' id="pemail"
															style="width: 154px" value=" " />
													</td>
													<td align="right">
														电话号码:
													</td>
													<td>
														<input class="text" name='ptelephone' id="ptelephone"
															style="width: 154px" value=" " />
													</td>
												</tr>
												<tr>
													<td align="right">
														居住地址:
													</td>
													<td>
														<input class="text" name='paddr' id="paddr" style="width: 154px" value=" " />
													</td>
													<td align="right">
														员工类型:
													</td>
													<td>
														<select name="plei" id="plei">
															<option >
																==请选择==
															</option>
															<option value="0" >
																实习
															</option>
															<option value="1" selected="selected">
																在职
															</option>
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														银行名称:
													</td>
													<td>
														<input class="text" name='pbankName' id="pbankName"
															style="width: 154px" value=" " />
													</td>
													<td align="right"> 
														角色名称:&nbsp; 
													</td>
													<td>
														<select name="ispower" id="ispower">
														<option value="0">=请选择=</option>
														
															<option value="1" >管理员</option>
														 
															<option value="2" >项目经理</option>
														 
															<option value="3" selected="selected">普通程序员</option>
														 
															<option value="5" >sdsdsd</option>
														 
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														银行账户:
													</td>
													<td>
														<input class="text" name='pbankuser' id="pbankuser"
															style="width: 154px" value=" " />
													</td>
													<td align="right">
														基本工资:
													</td>
													<td>
														<input class="text" name='pfsalary' id="pfsalary"
															style="width: 154px" value="111" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														奖金:
													</td>
													<td>
														<input class="text" name='pgsalary' id="pgsalary"
															style="width: 154px" value="0" /><font color="red">*</font>
													</td>
													<td align="right">
														其它补助金:
													</td>
													<td>
														<input class="text" name='posalary' id="posalary"
															style="width: 154px" value="0" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														入职时间:
													</td>
													<td>
													<input type="hidden" name="pbydate" value="2011-10-10">
														<input class="text" 
															style="width: 154px" value="2011-10-10" disabled="disabled" />
													</td>
													
												</tr>
												<tr>
													<td align="right">
														描述:
													</td>
													<td colspan="3">
														<textarea name="pdescription" id="pdescription" cols="100" rows="8">打代码</textarea>
													</td>
												</tr>
											</table>
											<br />
										</fieldset>
									</TD>

								</TR>
							</TABLE>
						</td>
					</tr>
					<TR>
						<TD colspan="2" align="center" height="50px">
							<input type="button"  value="保存" onclick="baocunle();" class="button"/>

							<input type="button" name="Submit2" value="返回" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
