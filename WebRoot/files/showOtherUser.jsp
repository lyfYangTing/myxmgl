<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="http://localhost:8080/xmgl/files/">

		<title>My JSP 'listyuangongmingxi.jsp' starting page</title>

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
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>

		<link href="/xmgl/css/style.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<form name="fom" id="fom" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="/xmgl/images/nav04.gif" class="style10">
									<table width="98%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="24">
												&nbsp;
											</td>
											<td width="519">
												&nbsp;
											</td>
											<td width="679" align="left">
												<a href="#" onclick= sousuo();></a>
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
											<td height="40" class="font42">
												<table width="100%" border="0" cellpadding="4"
													cellspacing="1" bgcolor="#464646" class="newfont03">
													<tr>
														<td height="20" colspan="2" align="center"
															bgcolor="#EEEEEE" class="tablestyle_title">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															Ա����ϸ�б� &nbsp;
														</td>
													</tr>
													
													
													<tr>
														<td width="21%" height="20" align="right"
															bgcolor="#FFFFFF">
															����
														</td>
														<td width="74%" bgcolor="#FFFFFF">
															${requestScope.user.uname}
														</td>
													</tr>
													<tr>
														<td height="20" align="right" bgcolor="#FFFFFF">
															Ա��Ψһ���:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.uid}
															
														</td>
													</tr>
													<tr>
														<td height="20" align="right" bgcolor="#FFFFFF">
															��������:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.ubirthday}
														</td>
													</tr>
													<tr>
														<td height="20" align="right" bgcolor="#FFFFFF">
															�Ա�:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.usex==0?'��':'Ů'}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															���֤����:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.uIDcard}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��������:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.uemail} 
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															�绰����:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.utelephone} 
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��ס��ַ:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.uaddress}  
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��������:
														</td>
														<td bgcolor="#FFFFFF">
															 ${requestScope.user.ubank}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															�����˻�:
														</td>
														<td bgcolor="#FFFFFF">
															 ${requestScope.user.ubankAccount}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��������:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.ubasePay}
															
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															����:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.ubonus}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															����������:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.ubuzhujin}
															
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															ְλ:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.duty.dname}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															Ա������:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.ustaffType==0?'ʵϰ':'��ְ'}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��ְʱ��:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.entryDate}
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��ְʱ��:
														</td>
														<td bgcolor="#FFFFFF">
															--
														</td>
													</tr>
													<tr>
														<td align="right" bgcolor="#FFFFFF">
															��ע:
														</td>
														<td bgcolor="#FFFFFF">
															${requestScope.user.udescrible}
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
				<tr>
					<td align="center" height="50px">
					
						<input type="button" name="back" id="back"
							onclick="window.history.go(-1);" value="����" class="button" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
