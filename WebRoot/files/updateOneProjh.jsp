<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/xmgl/">
    <title>My JSP 'editjihua.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
<script language="JavaScript" type="text/javascript">
 //��֤
function panduan(){
 var iscomplete=$("#iscomplete").val();	
		if(iscomplete=='δ���'){
			alert(iscomplete);
			document.getElementById("jrenddate").readOnly='readonly';
		}else if(iscomplete=='������'){
		alert(iscomplete);
			document.getElementById("jrenddate").readOnly='readonly';
		}else if(iscomplete=='�����'){
		alert(iscomplete);
			document.getElementById("jrenddate").readOnly=false;
		}

 	}
 
function save1(){
 			alert("1111");
 			var jtitle=$("#jtitle").val();
 			var jrbegindate=$("#jrbegindate").val();
 			var jrenddate=$("#jrenddate").val();
 			var iscomplete=$("#iscomplete").val();	
 			var jbeizhu=$("#jbeizhu").val();			
 			if(jtitle.length>10){
 				alert("�ƻ����ⲻ�ܴ���10���ֽڣ�");
 				$("#jtitle").attr("value",'');
 			}else if(jtitle==''){
 				alert("�ƻ����ⲻ��Ϊ�գ�");
 			}else if(iscomplete=='�����'){
	 				 document.getElementById("jrenddate").readOnly=false;
	 				 if(jrenddate==''){
	 					alert("��Ŀʵ�ʽ���ʱ�䲻��Ϊ�գ�");
	 				 }else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrenddate)){
						alert("��ʽ����ȷ��ӦΪyyyy-mm-dd");
						$("#jrenddate").attr("value",'');
					 }else if(jbeizhu.length>300){
				 			alert("��Ŀ��ע���ܴ���300���ֽڣ�");
				 			$("#jbeizhu").attr("value",'');
				 	 }else{
				 			alert("��������");
				 			fom.action="<%=basePath%>/projhServlet.do?op=updateProjh&ppid=${requestScope.xmglProplan.ppId}";
				  			fom.submit();
				 	 }
 			}else if(jbeizhu.length>300){
	 				alert("��Ŀ��ע���ܴ���300���ֽڣ�");
	 				$("#jbeizhu").attr("value",'');
	 		}else{
	 		        alert("������");
	 				fom.action="<%=basePath%>/projhServlet.do?op=updateProjh&ppid=${requestScope.xmglProplan.ppId}";
	  				fom.submit();
	 		}	
 		}
</script>
</head>

<body class="ContentBody">
  <form action="" method="post"  name="fom" id="fom" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >��Ŀ�ƻ��༭ҳ��</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
			<td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="����" class="button" />��			
		<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td>
		</tr>
		<tr align="center">
			<td class="TablePanel" ><input type="hidden" name="prono" value="${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.pjId }" />${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.pjName}</td>
		</tr>
			<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>�޸ļƻ�</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="15%">�ƻ�����:</td>
					    <td width="35%"><input name='jtitle' id='jtitle' onblur='yanzheng("1");' type="text" class="text" style="width:154px" value="${requestScope.xmglProplan.ppName}" />
				        <span class="red">*</span></td>
					    <td width="16%" align="right" nowrap="nowrap">ǰ������ƻ�:</td>
					    <td width="34%">
					         <select style="width:154px" name='qzid'>
					    		<option value='0'>ǰ�üƻ�Ϊ��</option>
					    		<c:forEach items="${requestScope.qzrwlist}" var="qzrw">
					    		    <option value='${qzrw.ppId }' <c:if test="${qzrw.ppId==requestScope.xmglProplan.ppQzId }">selected='selected'</c:if>>${qzrw.ppName}</option>
					    		</c:forEach>
							</select>
					     </td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">ʵ�ʿ�ʼʱ��:</td>
					    <td><input class="text" name='jrbegindate' id='jrbegindate' onblur='yanzheng("2");' style="width:154px" value="${requestScope.xmglProplan.ppsjStartTime}"/></td>
					    <td align="right">ʵ�ʽ���ʱ��:</td>
					    <td><input class="text" name='jrenddate'id='jrenddate' onblur='yanzheng("3");'  readOnly="readonly" style="width:154px" value="${requestScope.xmglProplan.ppsjEndTime}" /><font color='red'>*״̬Ϊ����ɲſ���д!<font></td>
					  </tr>
					  <tr>
					    <td align="right">����ִ����:</td>
					    <td>
							<select name="jbyper" id='jbyper' onblur='yanzheng("4");' style="width:154px" class="text">
							 	<c:forEach items="${requestScope.zxrlist }" var="zxr">
							 	 <option value=${zxr.uid } <c:if test="${requestScope.xmglProplan.ppZxr==zxr.uid }">selected='selected'</c:if>>${zxr.uname}</option>
							 	</c:forEach>
							</select>
						</td>
					    <td align="right">���ȼ�:</td>
					    <td>
							<select name="jmission" id='jmission' onblur='yanzheng("5");' style="width:154px">
							 <option id="xxx"  value="�ݲ�" <c:if test="${requestScope.xmglProplan.ppYxj=='�ݲ�' }">selected='selected'</c:if>>�ݲ�</option>
                             <option id="xxx"  value="һ��" <c:if test="${requestScope.xmglProplan.ppYxj=='һ��' }">selected='selected'</c:if>>һ��</option>
                             <option id="xxx"  value="��Ҫ" <c:if test="${requestScope.xmglProplan.ppYxj=='��Ҫ' }">selected='selected'</c:if>>��Ҫ</option>
                             <option id="xxx" value="��" <c:if test="${requestScope.xmglProplan.ppYxj=='��' }">selected='selected'</c:if>>��</option>
                             <option id="xxx" value="�ܼ�" <c:if test="${requestScope.xmglProplan.ppYxj=='�ܼ�' }">selected='selected'</c:if>>�ܼ�</option>
							</select>
						</td>
					  </tr>
					  <tr>
					    <td align="right">��������:</td>
						<td>
							<select name="jleixing" id='jleixing' onblur='yanzheng("6");' style="width:154px">
								<c:forEach items="${requestScope.rwlxlist }" var="rwlx">
							 	 <option value=${rwlx.rwId } <c:if test="${requestScope.xmglProplan.rwId==rwlx.rwId }">selected='selected'</c:if>>${rwlx.rwName}</option>
							 	</c:forEach>
							</select>
						</td>
					    <td align="right">״̬:</td>
					    <td>
							<select name="iscomplete" id='iscomplete' onchange="panduan();" onblur='yanzheng("7");' style="width:154px">
							  <option    value="δ��ʼ" <c:if test="${requestScope.xmglProplan.ppState=='δ��ʼ' }">selected='selected'</c:if>>δ��ʼ</option>
							  <option    value="������" <c:if test="${requestScope.xmglProplan.ppState=='������' }">selected='selected'</c:if>>������</option>
							  <option    value="�����" <c:if test="${requestScope.xmglProplan.ppState=='�����' }">selected='selected'</c:if>>�����</option>
							</select>
						</td>
					  </tr>
					  <tr>  	 
                         <td align="right">��Ŀ����:</td>
					     <td >
					    	<input style="width:154px" value="${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.pxTitle}" disabled="disabled"/>
						 </td>
						 
                        <td align="right">��Ŀģ��:</td>
					    <td>
					        <input style="width:154px" value="${requestScope.xmglProplan.progn.xmglPromk.pmName}" disabled="disabled"/>
						</td>
						<tr>
						<td align="right">��Ŀ����:</td>
					    <td>
					         <input style="width:154px" value="${requestScope.xmglProplan.progn.pgName}" disabled="disabled"/>
					         <input type="hidden" name='gongneng' value="${requestScope.xmglProplan.progn.pgId }">
						</td>
						 <td align="right">�Ƿ����:</td>
					     <td>
					        <select style="width:154px" name="isok" id='isok' onblur='yanzheng("10");'>
                                    <option  value="��" <c:if test="${requestScope.xmglProplan.ppshState=='��' }">selected='selected'</c:if>>��</option>
								    <option  value="��" <c:if test="${requestScope.xmglProplan.ppshState=='��' }">selected='selected'</c:if>>��</option>
							</select>
					     </td>
					    <td align="right"></td>
					    <td></td>
					    </tr>
					 
					  <tr>
					    <td align="right">�ƻ���ע:</td>
					    <td colspan="3"><textarea name="jbeizhu" id='jbeizhu' onblur='yanzheng("8");' cols="100" rows="8" style="color:gray" >${requestScope.xmglProplan.ppBeizhu}</textarea></td>
					    </tr>
					  </table>
			  <br />
				</fieldset>			</TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
  
  
		
		
		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="hidden" name="jnoo" value="1">
		<input type="button" name="save"  id='save' value="����" onclick="save1();" class="button" />��			
		<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/>		
				</TD>
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
