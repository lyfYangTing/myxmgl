<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>��Ŀ����ϵͳ by www.eyingda.com</title>
		<link rel="stylesheet" rev="stylesheet" href="/xmgl/css/style.css"
			type="text/css" media="all" />
       <link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
       <link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
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

</script>
		
	</head>
	<body class="ContentBody">
		<form  method="post" id="fom" name="form">
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
													<input type="hidden" name="zwno" value="4">
														<input  type="text" class="text" readonly="readonly"
															style="width: 154px" value="${requestScope.duty.dpname }" />
														<span class="red">*</span>
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
														<input name='zwname' type="text" class="text" id="zwname" readonly="readonly"
															style="width: 154px" value="${requestScope.duty.dname }" />
														<span class="red">*</span>
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
														<textarea name="zwbeizhu" id="zwbeizhu" readonly="readonly" cols="100" rows="20">${requestScope.duty.dtext }</textarea>
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
							<input type="button" name="Submit2" value="����" class="button"
								onclick="window.history.go(-1);" />
						</TD>
					</TR>
				</TABLE>
			</div>
		</form>
	</body>
</html>
