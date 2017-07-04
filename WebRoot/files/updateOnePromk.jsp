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
 	
 //保存
 $(document).ready(function (){
 	 $("#save").click(function (){
	 	var r=confirm("确认保存？");
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
   //验证
function yanzheng(n){
 $(document).ready(function (){
 		if(n=='1'){
 			//moname
 			var moname=$("#moname").val();
 			if(moname.length>10){
 				alert("模块标题不能大于10个字节！");
 				$("#moname").attr("value",'');
 				//$("#save").attr("disabled","disabled");
 			}else if(moname==''){
 				alert("模块标题不能为空！");
 				//$("#save").attr("disabled","disabled");
 			}
 			
 		}else if(n=='2'){
 			//mobiaozhi
 			var mobiaozhi=$("#mobiaozhi").val();
 			if(mobiaozhi.length>10){
 				alert("计划标识不能大于5个字节！");
 				$("#mobiaozhi").attr("value",'');
 				//$("#save").attr("disabled","disabled");
 			}else if(mobiaozhi==''){
 				alert("计划标识不能为空！");
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
 				alert("项目备注不能大于150个字节！");
 				$("#moddescription").attr("value",'');
 			}
 		}else if(n=='6'){
 			//modneedDescription
 			var modneedDescription=$("#modneedDescription").val();
 			if(modneedDescription.length>300){
 				alert("项目备注不能大于300个字节！");
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
			         alert("您的浏览器不支持AJAX！");
			         return false;
			      }
			   }
			
			}
			alert(1);
			xmlHttp.open("get","<%=basePath%>/promkServlet.do?op=getAllxq&pjid="+s,true);
		    alert(2);
			//回调函数
			
		    xmlHttp.onreadystatechange=function(){
			    if (xmlHttp.readyState == 4){	
				    var zx = eval(xmlHttp.responseText);
				 	var liebiao = document.getElementById("modno");
				 	var len = liebiao.length;
					for(var i = 0;i < len;i++){//先移除下拉列表中已经存在的值
						liebiao.remove(0);
					}
					//添加请选择列
				 	var opi = document.createElement("option");
					opi.text="---请选择----";
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
      <th class="tablestyle_title" >项目模块修改页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td></tr>

		
		
		<tr align="center">
          <td class="TablePanel">${requestScope.promk.xmglProxq.xmglProjb.pjName}</td>
		  </tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>项目模块信息</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">					 
					  <tr>
					    <td nowrap align="right" width="13%">模块名字:</td>
					    <td width="46%"><input name="moname" id='moname' onblur='yanzheng("1");' value="${requestScope.promk.pmName }" class="text" style="width:154px" type="text" size="40" />
				        <span class="red"> *</span></td>
					    <td nowrap="nowrap" align="right">模块标识:</td>
					    <td><input name="mobiaozhi" id="mobiaozhi" onblur='yanzheng("2");' value="${requestScope.promk.pmBiaoShi }"  class="text" style="width:154px" /></td>
					  </tr>
					  <tr>
					    <td align="right">所属项目:</td>
					    <td>
					       <select id="prono" name="prono" onblur='yanzheng("3");' style="width:154px" onchange="huoquxuqiu();">
					           <c:forEach items="${requestScope.list }" var="projb">
					               <option value='${projb.pjId }' <c:if test="${projb.pjId==requestScope.promk.xmglProxq.xmglProjb.pjId  }">selected='selected'</c:if>>${projb.pjName }</option>
					           </c:forEach>        
                           </select>                        
                        </td>
                        
                        
					    <td nowrap="nowrap" align="right">所属需求:</td>
					    <td id="xmxuqiu">
					    	<div id="nno" >
					      		<select id="modno" name="nno" style="width:154px" >  
					       			 <option selected="selected" value="${requestScope.promk.xmglProxq.pxId }">${requestScope.promk.xmglProxq.pxTitle }</option>
					       			 <option >请先选择项目</option>
					      		</select>
					    	</div> 
					  	 </td>
					  </tr>
					   <tr>
					   
					      <td  align="right" >优先级:</td>
						  <td >
						 <select name="modmission" id='modmission' onblur='yanzheng("4");' style="width:154px" >
                             <option id = "xxx" value = "0">---请选择---</option>
                             <option id="xxx"  
                             	<c:if test="${requestScope.promk.pmYxj=='暂不'}">
										selected = "selected"
								</c:if>
                             value="暂不">暂不</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='一般'}">
										selected = "selected"
										</c:if>
                             value="一般">一般</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='需要'}">
										selected = "selected"
								</c:if> 
                             value="需要">需要</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='急'}">
									selected = "selected"
								</c:if> 
                             value="急">急</option>
                             <option id="xxx" 
                             	<c:if test="${requestScope.promk.pmYxj=='很急'}">
                             		selected = "selected"
                             	</c:if>
                             value="很急">很急</option>
							</select>
                          
                          </td>
					    <td align="right"></td>
					    <td></td>
					    
					  </tr>
					  <tr align="top">
					    <td nowrap align="right" height="120px">模块描述:</td>
					    <td colspan="3">
							<textarea id="moddescription" name="moddescription" onblur='yanzheng("5");' style="" rows="6" cols="80">${requestScope.promk.pmKms }</textarea>						</td>
					    </tr>
						<tr align="top">
					    <td nowrap align="right" height="120px">需求描述:</td>
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
			<input type="hidden" name="modno" value="21" />　
			<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>						
			</TD>
		</TR>
		</TABLE>

</div>
</form>
</body>
</html>
