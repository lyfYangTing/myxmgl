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
    
    <title>My JSP 'editmokuai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" type="text/javascript">
 	
 //����
 $(document).ready(function (){
 	 $("#save").click(function (){
	 	var r=confirm("ȷ�ϱ��棿");
		if (r==true)
	  	{
	  		fom.action="<%=basePath%>/promkServlet.do?op=updateProxq&pmid=${requestScope.promk.pmId }";
	  		fom.submit();
	  	}else{
	  		return;
	 	 }
	 });
 }); 	
</script>
<script language="JavaScript" type="text/javascript">
   //��֤
function yanzheng(n){
 $(document).ready(function (){
 		if(n=='1'){
 			//moname
 			var moname=$("#moname").val();
 			if(moname.length>10){
 				alert("ģ����ⲻ�ܴ���10���ֽڣ�");
 				$("#moname").attr("value",'');
 				//$("#save").attr("disabled","disabled");
 			}else if(moname==''){
 				alert("ģ����ⲻ��Ϊ�գ�");
 				//$("#save").attr("disabled","disabled");
 			}
 			
 		}else if(n=='2'){
 			//mobiaozhi
 			var mobiaozhi=$("#mobiaozhi").val();
 			if(mobiaozhi.length>10){
 				alert("�ƻ���ʶ���ܴ���5���ֽڣ�");
 				$("#mobiaozhi").attr("value",'');
 				//$("#save").attr("disabled","disabled");
 			}else if(mobiaozhi==''){
 				alert("�ƻ���ʶ����Ϊ�գ�");
 				//$("#save").attr("disabled","disabled");
 			}
 			
 		}else if(n=='3'){
 			//prono
 			var prono=$("#prono").val();
 			if(!/^[0-9]*$/.test(prono)){
 				alert(prono);
 			}
 			
 		}else if(n=='4'){
 			//modmission
 			var modmission=$("#modmission").val();
 			if(!/^[0-9]*$/.test(modmission)){
 				alert(modmission);
 			}
 		}else if(n=='5'){
 			//moddescription
 			var moddescription=$("#moddescription").val();
 			if(moddescription.length>300){
 				alert("��Ŀ��ע���ܴ���150���ֽڣ�");
 				$("#moddescription").attr("value",'');
 			}
 		}else if(n=='6'){
 			//modneedDescription
 			var modneedDescription=$("#modneedDescription").val();
 			if(modneedDescription.length>300){
 				alert("��Ŀ��ע���ܴ���300���ֽڣ�");
 				$("#modneedDescription").attr("value",'');
 			}
 		}
		
 		
 		});
 	}
</script>
<script type="text/javascript">
function huoquxuqiu(){
	var s=document.getElementById("prono").value;
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
			alert(1);
			xmlHttp.open("get","<%=basePath%>/promkServlet.do?op=getAllxq&pjid="+s,true);
		    alert(2);
			//�ص�����
			
		    xmlHttp.onreadystatechange=function(){
			    if (xmlHttp.readyState == 4){	
				    var zx = eval(xmlHttp.responseText);
				 	var liebiao = document.getElementById("modno");
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
						opt.value=zx[i].pxId;
						opt.text=zx[i].pxTitle;
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
  <form action="" method="post"  name="fom" id="fom"  >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >��Ŀģ���޸�ҳ��</th>
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
          <td class="TablePanel">${requestScope.promk.xmglProxq.xmglProjb.pjName}</td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>��Ŀģ����Ϣ</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">					 
					  <tr>
					    <td nowrap align="right" width="13%">ģ������:</td>
					    <td width="46%"><input name="moname" id='moname' onblur='yanzheng("1");' value="${requestScope.promk.pmName }" class="text" style="width:154px" type="text" size="40" />
				        <span class="red"> *</span></td>
					    <td nowrap="nowrap" align="right">ģ���ʶ:</td>
					    <td><input name="mobiaozhi" id="mobiaozhi" onblur='yanzheng("2");' value="${requestScope.promk.pmBiaoShi }"  class="text" style="width:154px" /></td>
					  </tr>
					  <tr>
					    <td align="right">������Ŀ:</td>
					    <td>
					       <select id="prono" name="prono" onblur='yanzheng("3");' style="width:154px" onchange="huoquxuqiu();">
					           <c:forEach items="${requestScope.list }" var="projb">
					               <option value='${projb.pjId }' <c:if test="${projb.pjId==requestScope.promk.xmglProxq.xmglProjb.pjId  }">selected='selected'</c:if>>${projb.pjName }</option>
					           </c:forEach>        
                           </select>                        
                        </td>
                        
                        
					    <td nowrap="nowrap" align="right">��������:</td>
					    <td id="xmxuqiu">
					    	<div id="nno" >
					      		<select id="modno" name="nno" style="width:154px" >  
					       			 <option selected="selected" value="${requestScope.promk.xmglProxq.pxId }">${requestScope.promk.xmglProxq.pxTitle }</option>
					       			 <option >����ѡ����Ŀ</option>
					      		</select>
					    	</div> 
					  	 </td>
					  </tr>
					   <tr>
					   
					      <td  align="right" >���ȼ�:</td>
						  <td >
						 <select name="modmission" id='modmission' onblur='yanzheng("4");' style="width:154px" >
                             <option id = "xxx" value = "0">---��ѡ��---</option>
                             <option id="xxx"  
                             	<c:if test="${requestScope.promk.pmYxj=='�ݲ�'}">
										selected = "selected"
								</c:if>
                             value="�ݲ�">�ݲ�</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='һ��'}">
										selected = "selected"
										</c:if>
                             value="һ��">һ��</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='��Ҫ'}">
										selected = "selected"
								</c:if> 
                             value="��Ҫ">��Ҫ</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='��'}">
									selected = "selected"
								</c:if> 
                             value="��">��</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='�ܼ�'}">
                             		selected = "selected"
                             	</c:if>
                             value="�ܼ�">�ܼ�</option>
							</select>
                          
                          </td>
					    <td align="right"></td>
					    <td></td>
					    
					  </tr>
					  <tr align="top">
					    <td nowrap align="right" height="120px">ģ������:</td>
					    <td colspan="3">
							<textarea id="moddescription" name="moddescription" onblur='yanzheng("5");' style="" rows="6" cols="80">${requestScope.promk.pmKms }</textarea>						</td>
					    </tr>
						<tr align="top">
					    <td nowrap align="right" height="120px">��������:</td>
					    <td colspan="3">
							<textarea id="modneedDescription" name="modneedDescription" onblur='yanzheng("6");' rows="6" style="" cols="80">${requestScope.promk.pmXqms}</textarea>						</td>
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
			<input type="hidden" name="modno" value="21" />��
			<input type="button" name="save"  id='save' value="����" class="button" />��			
		<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/>						
			</TD>
		</TR>
		</TABLE>

</div>
</form>
</body>
</html>
