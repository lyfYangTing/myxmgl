<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>��Ŀ����ϵͳ by www.eyingda.com</title>
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

</script>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript">
	function pnoo(obj){
		var a=obj.value;
		if(a.length==0){
			document.getElementById("pnodiv").innerHTML="<font color='red'>Ա����Ų���Ϊ�գ�</font>";
		}else if(a.length<0){
			document.getElementById("pnodiv").innerHTML="<font color='red'>Ա����ų��ȹ��̣�</font>";
		}else if(a.length>10){
			document.getElementById("pnodiv").innerHTML="<font color='red'>Ա����ų��ȹ�����</font>";
		}else{
			
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
			
				xmlHttp.open("get","<%=basePath%>/userServlet.do?op=isExit&uid="+a,true);
			
	 		//�ص�����
	 		
			 xmlHttp.onreadystatechange=function(){
				if (xmlHttp.readyState == 4){
					 var zx = eval(xmlHttp.responseText);
						if(zx == 'false'){
							document.getElementById("pnodiv").innerHTML="<font color='green'>����ʹ�����Ա�����</font>";
						}else{
							document.getElementById("pnodiv").innerHTML="<font color='red'>��Ա������Ѵ���</font>";
						}
					}
			}
			xmlHttp.send();
	}
}




function zx(){
	var s=document.getElementById("pdescription").value;
	var i=300-s.length;
	if(s.length<=300){
		$("#sy").attr("color","blue");
		document.getElementById("sy").innerHTML="ʣ��("+i+")��";
	}else{
		$("#sy").attr("color","red");
		document.getElementById("sy").innerHTML="������������";
	}
}
function baocun(){
	var s=$("#pnodiv").text();
	var pno=$("#pno").val();
	var password=$("#password").val();
	var pname=$("#pname").val();
	var psex=$("#psex").val();
	var page=$("#page").val();
	var zwno=$("#zwno").val();
	var pbirthday=$("#pbirthday").val();
	var a=pbirthday.split("-");
	var pid=$("#pid").val();
	var plei=$("#plei").val();
	var ispower=$("#ispower").val();
	var pfsalary=$("#pfsalary").val();
	var pgsalary=$("#pgsalary").val();
	var posalary=$("#posalary").val();
	var pbydate=$("#pbydate").val();
	var b=pbydate.split("-");
	var pemail=$("#pemail").val();
	var ptelephone=$("#ptelephone").val();
	var paddr=$("#paddr").val();
	var pbankName=$("#pbankName").val();
	var pbankuser=$("#pbankuser").val();
	var pdescription=$("#pdescription").val();
	if(pno==""){
		alert("Ա����Ų���Ϊ�գ�");
	}else if(s=="<FONT color=red>��Ա������Ѵ���</FONT>"){
		alert("��Ա������Ѵ��ڣ�");
	}else if(s=="<FONT color=red>Ա����ų��ȹ��̣�</FONT>"){
		alert("Ա����ų��ȹ��̣�");
	}else if(s=="<FONT color=red>Ա����ų��ȹ�����</FONT>"){
		alert("Ա����ų��ȹ�����");
	}else if(password==""){
		alert("���벻��Ϊ�գ�");
	}else if(password.length<5||password.length>10){
		alert("���볤�Ȳ�����Ҫ��ӦΪ5-10λ��");
	}else if(pname==""){
		alert("��ʵ��������Ϊ�գ�");
	}else if(!/^[1-9][0-9]*$/.test(pname)==false){
		alert("��ʵ������ʽ����Ϊ���֣�");
	}else if(pname.length>10){
		alert("��ʵ�������ȹ�����");
	}else if(psex=="2"){
		alert("�Ա���Ϊ�գ�");
	}else if(page==""){
		alert("���䲻��Ϊ�գ�");
	}else if(!/^[1-9][0-9]*$/.test(page)==true){
		alert("����λ�����������֣�");
	}else if(page.length>3){
		alert("���䳤�ȹ�����");
	}else if(zwno=="0"){
		alert("ְ����Ϊ��");
	}else if(pbirthday==""){
		alert("�������ڲ���Ϊ��");
	}else if(a.length!=3||a[0].length!=4||a[1].length!=2||a[2].length!=2){
		alert("���ڸ�ʽ���ԣ�ӦΪyyyy-mm-dd");
	}
	else if(pbirthday.length>10){
		alert("�������ڳ��ȹ�����");
	}else if(pid==""){
		alert("���֤���벻��Ϊ��");
	}else if(pid.length>20){
		alert("���֤���볤�ȹ���");
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
	}else if(pbydate==""){
		alert("�������ڲ���Ϊ��");
	}else if(b.length!=3||b[0].length!=4||a[1].length!=2||b[2].length!=2){
		alert("���ڸ�ʽ���ԣ�ӦΪyyyy-mm-dd");
	}
	else if(pemail.length>30){
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
		$("#form").attr("action","<%=basePath%>/userServlet.do?op=addUser&token=1");
		$("#form").submit();
	}
}




</script>

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
				 	var liebiao = document.getElementById("sjid");
				 	var len = liebiao.length;
					for(var i = 0;i < len;i++){//���Ƴ������б����Ѿ����ڵ�ֵ
						liebiao.remove(0);
					}
					//�����ѡ����
				 	var opi = document.createElement("option");
					opi.text="---��ѡ��----";
					opi.value="0";
					liebiao.add(opi);
					for(var i = 0 ; i < zx.length;i++){
						//liebiao.options.add(new Option(zx[i][uid),zx[i][uname);
						//alert(zx[i].uname);
						var opt = document.createElement("option");
						opt.value=zx[i].uid;
						opt.text=zx[i].uname;
						liebiao.add(opt);
					}
		        }
		    }
		    xmlHttp.send();	
		    return false;
}

</script>

</head>

	<body class="ContentBody">

		<form  method="post" name="form"  id="form">
		<input type="hidden" value="1479186575682" name="token">
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
										 		style=" width:100%">
												<tr>
													<td width="16%" align="right" nowrap="nowrap"> 
														Ա�����: 
													</td>
													<td width="34%">
														<input type="text" id="pno" name="pno" style="width: 154px" onblur="pnoo(this);" value="${requestScope.user.uid }" <c:if test="${requestScope.user.uid!=null}"> disabled='disabled'</c:if>>		
														<input type="hidden" name="pno" value="${requestScope.user.uid }">												<font id="pnodiv"  color="red">*</font>
													</td>
													<td width="16%" align="right" nowrap="nowrap">
														����:
													</td>
													<td width="34%">
														<input type="password" id="password" name='ppassword' style="width: 154px"
															value="${requestScope.user.upassword }"><font color="red">*(5-10λ)</font>
													</td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">
														��ʵ����:
													</td>
													<td>
														<input class="text" name='pname' id="pname"
															style="width: 154px" value="${requestScope.user.uname }" <c:if test="${requestScope.user.uname!=null}"> disabled='disabled'</c:if>/>
														
														<input type="hidden" name="pname" value="${requestScope.user.uname }">	
														
														
														<font color="red">*</font>
													</td>
													<td align="right">
														�Ա�:
													</td>
													<td>
														<select name="psex" id="psex">
														<option value="2">==��ѡ��==</option>
													    <option value="0" <c:if test="${requestScope.user.usex==0}"> selected='selected'</c:if>>
															��
														</option>
														<option value="1" <c:if test="${requestScope.user.usex==1}"> selected='selected'</c:if>>
															Ů
														</option>
														
														
														</select><font color="red">*</font>
														<input type="hidden" name="psex" value="${requestScope.user.usex }">	
													</td>
												</tr>
												<tr>
													<td align="right">����:</td>
													<td>
														<input class="text" name='page' id="page"
															style="width: 154px" value="${requestScope.user.uage}" /><font color="red">*������Ϊ���֣�</font>
														<input type="hidden" name="page" value="${requestScope.user.uage }">	
													</td>
													<td align="right">
														ְλ:
													</td>
													
													<td>
														<select name="zwno" id="zwno" onchange="xuanzesj();">
															<option value="0">==��ѡ��==</option>
															<c:forEach items = "${requestScope.dutylist}" var = "duty" >
																<option value = "${duty.did}" <c:if test="${duty.did==requestScope.user.edid}">selected='selected'</c:if>>${duty.dname}</option>
															</c:forEach>
															
														
														</select><font color="red">*</font>
														
													</td>
													
												</tr>
												<tr>
													<td align="right">
														��������:
													</td>
													<td>
														<input class="text" name='pbirthday' id="pbirthday"
															style="width: 154px" value="${requestScope.user.ubirthday }" <c:if test="${requestScope.user.ubirthday!=null}"> disabled='disabled'</c:if>/><font color="red">*����ʽ��yyyy-mm-dd��</font>
														<input type="hidden" name="pbirthday" value="${requestScope.user.ubirthday }">
													</td>
													<td align="right">
														���֤����:
													</td>
													<td>
														<input class="text" name='pid' id="pid"
															style="width: 154px" value="${requestScope.user.uIDcard }" <c:if test="${requestScope.user.uIDcard!=null}"> disabled='disabled'</c:if>/><font color="red">*</font>
														<input type="hidden" name="pid" value="${requestScope.user.uIDcard }">
													</td>
												</tr>
												<tr>
													<td align="right">
														��������:
													</td>
													<td>
														<input class="text" name='pemail' id="pemail"
															style="width: 154px" value="${requestScope.user.uemail }" />
													</td>
													<td align="right">
														�绰����:
													</td>
													<td>
														<input class="text" name='ptelephone' id="ptelephone"
															style="width: 154px" value="${requestScope.user.utelephone }" />
													</td>
												</tr>
												<tr>
													<td align="right">
														��ס��ַ:
													</td>
													<td>
														<input class="text" name='paddr' style="width: 154px" id="paddr" value="${requestScope.user.utelephone }" />
													</td>
													<td align="right">
														Ա������:
													</td>
													<td>
														<select name="plei" id="plei">
															<option value="2" >
																==��ѡ��==
															</option>
															<option value="0" <c:if test="${requestScope.user.ustaffType==0}">selected='selected'</c:if>>
																ʵϰ
															</option>
															<option value="1" <c:if test="${requestScope.user.ustaffType==1}">selected='selected'</c:if>>
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
															style="width: 154px" value="${requestScope.user.ubank}" />
													</td>
													<td align="right"> 
														��ɫ����:&nbsp; 
													</td>
													<td>
														<select name="ispower" id="ispower">
														<option value="0">=��ѡ��=</option>
															<c:forEach items = "${requestScope.rolelist}" var = "role">
																<option value = "${role.roid}" <c:if test="${role.roid==requestScope.user.role.roid}">selected='selected'</c:if>>${role.roname}</option>
															</c:forEach>
														 
														</select><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														�����˻�:
													</td>
													<td> 
														<input class="text" name='pbankuser'  id="pbankuser"
															style="width: 154px" value="${requestScope.user.ubankAccount}" />
													</td>
													<td align="right">
														��������:
													</td>
													<td>
														<input class="text" name='pfsalary' id="pfsalary" 
															style="width: 154px" value="${requestScope.user.ubasePay}" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														����:
													</td>
													<td>
														<input class="text" name='pgsalary' id="pgsalary" 
															style="width: 154px" value="${requestScope.user.ubonus}" /><font color="red">*</font>
													</td>
													<td align="right">
														����������:
													</td>
													<td>
														<input class="text" name='posalary' id="posalary"
															style="width: 154px" value="${requestScope.user.ubuzhujin}" /><font color="red">*</font>
													</td>
												</tr>
												<tr>
													<td align="right">
														��ְʱ��:
													</td>
													<td>
														<input class="text" name='pbydate' id="pbydate"
															style="width: 154px" value="${requestScope.user.entryDate}" <c:if test="${requestScope.user.entryDate!=null}"> disabled='disabled'</c:if>/><font color="red">*����ʽ��yyyy-mm-dd��</font>
														<input type="hidden" name="pbydate" value="${requestScope.user.entryDate }">
													</td>
													<td align="right">
														�ϼ��쵼
													</td>
													<td>
														<select name="sjld" id="sjid">
														<option>--��ѡ��--</option>
														<c:if test="${requestScope.user.pname!=null}">
														<option value="${requestScope.user.upid }" selected='selected'>${requestScope.user.pname}</option>
														</c:if>
														</select><font color="red">*</font>
													</td>
													
												</tr>
												<tr>
													<td align="right">
														����:
													</td>
													<td colspan="3">
														<textarea name="pdescription" cols="100" rows="8" id="pdescription" onkeyup="zx();">${requestScope.user.udescrible }</textarea><font size="2px" id="sy" color="blue">ʣ��(300)��</font>
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
						
							<input type="button"  value="����" onclick="baocun();" class="button"/>

							<input type="button" name="Submit2" value="����" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
