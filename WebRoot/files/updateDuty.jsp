<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="http://localhost:8080/xmgl/files/">

		<title>My JSP 'zhiwu.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<%=basePath %>/jquery.js"></script>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>��Ŀ����ϵͳ by www.eyingda.com</title>
		<link rel="stylesheet" rev="stylesheet" href="/xmgl/css/style.css"
			type="text/css" media="all" />


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
		<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
<script type="text/javascript" src="/xmgl/jquery.js"></script>
<script type="text/javascript">
function baocun(){
    alert("��������");
	var zwno=$("#dpid").val();
	alert(zwno);//zmno=2
	var zwname=$("#dname").val();
	alert(zwname);//zwname
	var zwbeizhu=$("#dtext").val();
	if(zwno==""){
		alert("ְλ��Ų���Ϊ�գ�");
	}else if(zwno.length>20){
		alert("ְλ��ų��ȹ�����");
	}else if(!/^[1-9][0-9]*$/.test(zwno)==true){
		alert("����Ϊ���֣�");
	}else if(zwname==""){
		alert("ְλ������Ϊ�գ�");
	}else if(zwname.length>20){
		alert("ְλ�����ȹ�����");
	}else if(zwbeizhu.length>300){
		alert("�������ȹ���");
	}else{
	alert("��������");
		$("#fom").attr("action","<%=basePath%>/dutyServlet.do?op=updateDuty");
		$("#fom").submit();
	}
}
</script>
	</head>

	<body class="ContentBody">
		<form  method="post" name="fom" id="fom">
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0"
					class="CContent">
					<tr>
						<th class="tablestyle_title">
							ְλ������Ϣ¼��
						</th>
					</tr>
					<tr>
						<td class="CPanel">
							<table border="0" cellpadding="0" cellspacing="0"
								style="width: 100%">
								<TR>
									<TD width="100%">
										<fieldset style="height: 100%;">
											<legend>
												ְλ��Ϣ
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												
												  <tr>
													<td nowrap align="right" width="11%">
														ֱ���ϼ�:
													</td>
													<td width="27%">
														<select name="dpid" id="dpid" onchange="xuanzesj();">
															<option value="0">==��ѡ��==</option>
															<c:forEach items = "${requestScope.list}" var = "duty" >
																<option value = "${duty.did}" <c:if test="${duty.did==requestScope.duty.did}">selected='selected'</c:if>>${duty.dname}</option>
															</c:forEach>														
														</select><font color="red">*</font>
													</td>
													<td align="right" width="25%">
														&nbsp;
													</td>
													<td width="37%">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td nowrap align="right" width="11%">
														ְλ��:
													</td>
													<td width="27%">
														<input name='dname' id = "dname" type="text" class="text" 
															style="width: 154px" value="${requestScope.duty.dname }" />
														<input name="did" type="hidden" value="${requestScope.duty.did }"><span class="red">*</span>
													</td>

													<td align="right" width="25%">
														&nbsp;
													</td>
													<td width="37%">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td width="11%" nowrap align="right">
														��ע:
													</td>
													<td colspan="3">
														<textarea name="dtext" id="dtext" cols="100" rows="20">${requestScope.duty.dtext}</textarea>
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
						
							<input type="button"  value="����" class="button"
								onclick="baocun();" />

							<input type="button" name="Submit2" value="����" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
