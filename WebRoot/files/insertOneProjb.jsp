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
    <base href="http://localhost:8080/xmgllx/">
    <title>My JSP 'editxiangmu.jsp' starting page</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 	<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
 	<link href="<%=basePath %>//css/css.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>//css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>/jquery.js"></script>
<script language="JavaScript" type="text/javascript">
//��֤
function panduan(){
	var proidcomplete=$("#proidcomplete").val();
		if(proidcomplete=='δ��ʼ'){
			//alert(proidcomplete);
			document.getElementById("procompeteDate").readOnly='readonly';
		}else if(proidcomplete=='������'){
		//alert(proidcomplete);
			document.getElementById("procompeteDate").readOnly='readonly';
		}else if(proidcomplete=='�����'){
		//alert(proidcomplete);
			document.getElementById("procompeteDate").readOnly=false;
		}

 	}
 function save1(){
 var proname=$("#proname").val();
 			var clientno=$("#clientno").val();
 			var promoney=$("#promoney").val();
 			var pronum=$("#pronum").val();
 			var proManager=$("#proManager").val();
 			var proidcomplete=$("#proidcomplete").val();
 			var prozmoney=$("#prozmoney").val();
 			var probeginDate=$("#probeginDate").val();
 			var procompeteDate=$("#procompeteDate").val();
 			var promission=$("#promission").val();
 			var probeizhu=$("#probeizhu").val();
 			
 		if(proname.length>10){
 				alert("��Ŀ���Ʋ��ܴ���10���ֽڣ�");
 				$("#proname").attr("value",'');
 			}else if(proname==''){
 				alert("��Ŀ���ֲ���Ϊ�գ�");
 			}else if(!/^[0-9]*$/.test(clientno)){
 				alert(clientno);
 				alert("������λ����ѡ��");
 			}else if(!/^[0-9]*$/.test(promoney)){
 				alert("��Ŀ������Ϊ���֣�");
 				$("#promoney").attr("value",'');
 			}else if(promoney.length>9){ 
 				alert("��Ŀ�����Ŀ������˶ԣ�");
 				$("#promoney").attr("value",'');
 			}else if(pronum.length>4){
 				alert("���������������˶ԣ�");
 				$("#pronum").attr("value",'');
 			}else if(pronum==''){
 				alert("��Ŀ��������Ϊ��!");
 				$("#pronum").attr("value",'');
 			}else if(proidcomplete=='0'){
 						alert("��Ŀ״̬����ѡ��");
 						return false;
	 				 if(probeginDate==''){
 					alert("��Ŀʵ�ʿ�ʼʱ�䲻��Ϊ�գ�");
 			}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(probeginDate)){
					alert("��ʽ����ȷ��ӦΪyyyy-mm-dd");
					$("#probeginDate").attr("value",'');
			}else if(procompeteDate==''){
	 				 	//alert(procompeteDate);
	 					alert("��Ŀ�ƻ�����ʱ�䲻��Ϊ�գ�");
	 				 }else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(procompeteDate)){
						alert("��ʽ����ȷ��ӦΪyyyy-mm-dd");
						$("#procompeteDate").attr("value",'');
					 }else if(!/^[0-9]*$/.test(promoney)){
 						alert("��Ŀ������Ϊ���֣�");
 						$("#promoney").attr("value",'');
 					 }else if(promoney.length>9){ 
 						alert("��Ŀ�����Ŀ������˶ԣ�");
 						$("#promoney").attr("value",'');
 					 }else if(pronum.length>4){
 						alert("���������������˶ԣ�");
 						$("#pronum").attr("value",'');
 					 }else{
		 				form1.action="<%=basePath%>/projbServlet.do?op=insertPrjInfo";
			  			form1.submit();
		 			}
 				
 			}else if(prozmoney.length>9){
	 				alert("�������ĿԤ���ܳɱ�������ѡ��");
	  				$("#prozmoney").attr("value",'');
	 		}else if(prozmoney==''){
 					alert("��ĿԤ���ܳɱ�����Ϊ�գ�");
 			}else if(probeginDate==''){
 					alert("��Ŀ�ƻ���ʼʱ�䲻��Ϊ�գ�");
 			}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(probeginDate)){
					alert("��ʽ����ȷ��ӦΪyyyy-mm-dd");
					$("#probeginDate").attr("value",'');
			}else if(promission=='0'){
 				alert("��Ŀ���ȼ�����ѡ��");
 				
 			}else if(probeizhu.length>300){
 				alert("��Ŀ��ע���ܴ���300���ֽڣ�");
 				$("#probeizhu").attr("value",'');
 			}else{
 				form1.action="<%=basePath%>/projbServlet.do?op=insertPrjInfo";
	  			form1.submit();
 			}
 }		
</script>
<script type="text/javascript">

function query(){
	var s=document.getElementById("proManager").value;
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
			xmlHttp.open("get","<%=basePath%>/projbServlet.do?op=getAllSubUser&pno="+s,true);		
			//�ص�����
		    xmlHttp.onreadystatechange=function(){
			    if (xmlHttp.readyState == 4){
				 var zx = eval(xmlHttp.responseText);
				 	alert(zx);
				 	var liebiao = document.getElementById("pronum");
				 	liebiao.value = zx.length;
				}
		    }
		    xmlHttp.send();	
		    return false;
}

</script>

</head>
<body class="ContentBody">
  <form action="" method="post" name="form1" id="form1" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >&nbsp;��Ŀ���ҳ��</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="����" class="button" />��			
		<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td></tr>
		<tr align="center">
          <td class="TablePanel">${requestScope.xmglProjb.pjName}</td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>��Ŀ��Ϣ</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="15%">��Ŀ����:</td>
					    <td width="35%"><input name='proname' id='proname' type="text" class="text" style="width:154px" onblur='yanzheng("1");' value="${requestScope.xmglProjb.pjName}"  />
					    
					    <span class="red">*</span><br></td>
				        	
					    <td nowrap align="right" width="18%">������λ:</td>
						<td width="35%">
								<select  name="clientno" id='clientno'  onblur='yanzheng("2");' style="width:154px">
								<option  id="xxx" value="0">---��ѡ��---</option>
									<c:forEach items = "${requestScope.listCustomer}" var = "customer">
										<option  value = "${customer.cid}"
											<c:if test="${customer.cid==requestScope.xmglProjb.pjCid}">
												selected = "selected"
											</c:if>>
											${customer.cname}
										</option>
									</c:forEach>
								</select>
						<span class="red">*</span></td>
					    </tr>
						<tr>
					    <td nowrap align="right" width="15%">��Ŀ���:</td>
					    <td width="35%"><input name='promoney' id='promoney' type="text" class="text" style="width:154px" onblur='yanzheng("3");' value="${requestScope.xmglProjb.pjMoney}" />				        </td>
				         <td nowrap align="right" width="18%">��������:</td>
					    <td width="35%"><input name='pronum' id='pronum' type="text" class="text" style="width:154px"  onblur='yanzheng("4");' value="${requestScope.listSubUserSize }" /></td>	
						</tr>
						<tr>	
							<td nowrap align="right" width="15%">��Ŀ����:</td>
							<td width="35%">
								<select  name="proManager"  id="proManager" style="width:154px" onblur='yanzheng("5");' onchange="query();">
									<option  id="xxx" value="0">---��ѡ��---</option>
									<c:forEach items = "${requestScope.listXmglUser}" var = "user">
										<option  value = "${user.uid}"
											<c:if test="${user.uid==requestScope.xmglProjb.pjUid}">
												selected = "selected"
											</c:if>>
											${user.uname}
										</option>
									</c:forEach>
								</select>
							</td>
							<td nowrap align="right" width="18%">���״̬:</td>
							<td width="35%">
							<select name="proidcomplete" id='proidcomplete' style="width:154px"  onchange="panduan();" onblur='yanzheng("6");'>
								<option value="0">--��ѡ��--</option>
								<option   
										<c:if test="${requestScope.xmglProjb.pjState=='δ���'}">
										selected = "selected"
										</c:if> value="δ���" >δ���
								</option>
							</select>
							</td>
				        </tr>
						<tr>
						  <td nowrap="nowrap" align="right">Ԥ���ܳɱ�:</td>
						  <td><input name='proyszmoney' id='prozmoney' type="text" class="text" style="width:154px" onblur='yanzheng("7");' value=""/></td>	
							<td nowrap="nowrap" align="right">�ƻ���������:</td>
							<td><input name='projhbeginDate' id='probeginDate'  type="text" class="text" style="width:154px" onblur='yanzheng("8");' value="" /></td>
						</tr>
						<tr>
						  <td nowrap="nowrap" align="right">�ƻ��������:</td>
						  <td><input name='projhcompeteDate' id='procompeteDate' type="text" class="text" style="width:154px" onblur='yanzheng("9");' value=""/></td>
						  <td  align="right" >���ȼ�:</td>
						  <td >
                          <select name="promission" id='promission'  style="width:154px" onblur='yanzheng("10");' >
                             <option  id="xxx" value="0">---��ѡ��---</option>
                             <option id="xxx"  
                             	<c:if test="${requestScope.xmglProjb.pjYxj=='�ݲ�'}">
										selected = "selected"
								</c:if>
                             value="�ݲ�">�ݲ�</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.xmglProjb.pjYxj=='һ��'}">
										selected = "selected"
										</c:if>
                             value="һ��">һ��</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.xmglProjb.pjYxj=='��Ҫ'}">
										selected = "selected"
								</c:if> 
                             value="��Ҫ">��Ҫ</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.xmglProjb.pjYxj=='��'}">
									selected = "selected"
								</c:if> 
                             value="��">��</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.xmglProjb.pjYxj=='�ܼ�'}">
                             		selected = "selected"
                             	</c:if>
                             value="�ܼ�">�ܼ�</option>
							</select>
                          </td>
						</tr>
					  <tr>
					    <td  width="15%" nowrap align="right">��ע:</td>
					    <td colspan="3"><textarea name="probeizhu" id='probeizhu' cols="100" rows="10" onblur='yanzheng("11");' style="">${requestScope.xmglProjb.pjBz}</textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset></TD>
		</TR>
		</TABLE>
	 </td>
  </tr><TR>
		<TD colspan="2" align="center" height="50px">
			<input type="hidden" name="prono" value="1">
			<input type="button" name="save" id='save' onclick="save1();" value="����" class="button" />��			
			<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/>
		</TD>
		</TR>
		</TABLE>
</div>
</form>
</body>
</html>
