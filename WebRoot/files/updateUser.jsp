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
		<title>��Ŀ����ϵͳ by www.eyingda.com</title>
		<link rel="stylesheet" rev="stylesheet"
			href="/xmgl/css/style.css" type="text/css" media="all" />

<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
		<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('���ݿ��б����и���Ա������Ϣ���������޸Ļ�������Ϣ��');
  if(a!=true)return false;
  window.open("��ͻҳ.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
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
		alert("���벻��Ϊ�գ�");
	}else if(password.length<5||password.length>10){
		alert("���볤�Ȳ�����Ҫ��ӦΪ5-10λ��");
	}else if(page==""){
		alert("���䲻��Ϊ�գ�");
	}else if(!/^[1-9][0-9]*$/.test(page)==true){
		alert("����λ�����������֣�");
	}else if(page.length>3){
		alert("���䳤�ȹ�����");
	}else if(zwno=="0"){
		alert("ְ����Ϊ��");
	}else if(plei=="2"){
		alert("Ա�����Ͳ���Ϊ��");
	}else if(ispower=="0"){
		alert("��ɫ���Ʋ���Ϊ��");
	}else if(pfsalary==""){
		alert("�������ʲ���Ϊ��");
	}else if(!/^[1-9][0-9]*$/.test(pfsalary)==true){
		alert("��������λ�����������֣�");
	}else if(pfsalary.length>10){
		alert("�������ʳ��ȹ�����");
	}else if(pgsalary==""){
		alert("������Ϊ��");
	}else if(!/^[1-9][0-9]*$/.test(pgsalary)==true){
		alert("����λ�����������֣�");
	}else if(pgsalary.length>10){
		alert("���𳤶ȹ�����");
	}else if(posalary==""){
		alert("������������Ϊ��");
	}else if(!/^[1-9][0-9]*$/.test(posalary)==true){
		alert("����������λ�����������֣�");
	}else if(posalary.length>10){
		alert("���������𳤶ȹ�����");
	}else if(pemail.length>30){
		alert("�������䳤�ȹ�����");
	}else if(ptelephone.length>15){
		alert("�绰���볤�ȹ�����");
	}else if(paddr.length>30){
		alert("��ס��ַ���ȹ�����");
	}else if(pbankName.length>20){
		alert("�������Ƴ��ȹ�����");
	}else if(pbankuser.length>30){
		alert("�����˻����ȹ�����");
	}else if(pdescription.length>300){
		alert("�������ȹ�����");
	}else{
		alert("����ɹ���");
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
			         alert("�����������֧��AJAX��");
			         return false;
			      }
			   }
			
			}
			xmlHttp.open("get","<%=basePath%>/userServlet.do?op=getPUser&did="+s,true);
		
			//�ص�����
			
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
							Ա��������Ϣ¼��<font size="2px" color="red">��*Ϊ�������ݣ�</font>
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
												Ա����Ϣ
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												
												<tr>
													<td width="16%" align="right" nowrap="nowrap"> 
														Ա�����: 
													</td>
													<td width="34%">
														<input type="hidden" name="pno" value="${requestScope.user.uid }">
														<input class="text"  style="width: 154px"
															value="${requestScope.user.uid }"  disabled="disabled"/>
													</td>
													<td width="16%" align="right" nowrap="nowrap">
														����:
													</td>
													<td width="34%">
														<input type="password" name='ppassword' id="ppassword" style="width: 154px"
															value="${requestScope.user.upassword }"><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">
														��ʵ����:
													</td>
													<td>
													<input type="hidden" name="pname" value="${requestScope.user.uname }">
														<input class="text" 
															style="width: 154px" value="${requestScope.user.uname }" disabled="disabled" />
													</td>
													<td align="right">
														�Ա�:
													</td>
													<td>
														<select name="psex" >
															<option selected="selected">
																==��ѡ��==
															</option>
															<option value="0" selected="selected">
																��
															</option>
															<option value="1" >
																Ů
															</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">����:</td>
													<td>
														<input class="text" name='page' id="page"
															style="width: 154px" value="${requestScope.user.uage }" /><font color="red">*</font>
													</td>
													<td align="right">
														ְλ:
													</td>
													<td>
														<select name="zwno" id="zwno" onchange="xuanzesj()"> 
															<option selected="selected">==��ѡ��==</option>
														
															<option value="2"  >��Ŀ����1</option>
														
															<option value="11111"  selected="selected">����Ա</option>
														
															<option value="1"  >����Ա1</option>
														
															<option value="4"  >��Ŀ����1</option>
														
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														��������:
													</td>
													<td>
													<input type="hidden" name="pbirthday" value="1991-03-05">
														<input class="text" 
															style="width: 154px" value="1991-03-05" disabled="disabled" />
													</td>
													<td align="right">
														���֤����:
													</td>
													<td>
													<input type="hidden" name="pid" value="11111">
														<input class="text" 
															style="width: 154px" value="11111"  disabled="disabled"/>
													</td>
												</tr>
												<tr>
													<td align="right">
														��������:
													</td>
													<td>
														<input class="text" name='pemail' id="pemail"
															style="width: 154px" value=" " />
													</td>
													<td align="right">
														�绰����:
													</td>
													<td>
														<input class="text" name='ptelephone' id="ptelephone"
															style="width: 154px" value=" " />
													</td>
												</tr>
												<tr>
													<td align="right">
														��ס��ַ:
													</td>
													<td>
														<input class="text" name='paddr' id="paddr" style="width: 154px" value=" " />
													</td>
													<td align="right">
														Ա������:
													</td>
													<td>
														<select name="plei" id="plei">
															<option >
																==��ѡ��==
															</option>
															<option value="0" >
																ʵϰ
															</option>
															<option value="1" selected="selected">
																��ְ
															</option>
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														��������:
													</td>
													<td>
														<input class="text" name='pbankName' id="pbankName"
															style="width: 154px" value=" " />
													</td>
													<td align="right"> 
														��ɫ����:&nbsp; 
													</td>
													<td>
														<select name="ispower" id="ispower">
														<option value="0">=��ѡ��=</option>
														
															<option value="1" >����Ա</option>
														 
															<option value="2" >��Ŀ����</option>
														 
															<option value="3" selected="selected">��ͨ����Ա</option>
														 
															<option value="5" >sdsdsd</option>
														 
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														�����˻�:
													</td>
													<td>
														<input class="text" name='pbankuser' id="pbankuser"
															style="width: 154px" value=" " />
													</td>
													<td align="right">
														��������:
													</td>
													<td>
														<input class="text" name='pfsalary' id="pfsalary"
															style="width: 154px" value="111" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														����:
													</td>
													<td>
														<input class="text" name='pgsalary' id="pgsalary"
															style="width: 154px" value="0" /><font color="red">*</font>
													</td>
													<td align="right">
														����������:
													</td>
													<td>
														<input class="text" name='posalary' id="posalary"
															style="width: 154px" value="0" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														��ְʱ��:
													</td>
													<td>
													<input type="hidden" name="pbydate" value="2011-10-10">
														<input class="text" 
															style="width: 154px" value="2011-10-10" disabled="disabled" />
													</td>
													
												</tr>
												<tr>
													<td align="right">
														����:
													</td>
													<td colspan="3">
														<textarea name="pdescription" id="pdescription" cols="100" rows="8">�����</textarea>
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
							<input type="button"  value="����" onclick="baocunle();" class="button"/>

							<input type="button" name="Submit2" value="����" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
