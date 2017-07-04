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
    
    <title>My JSP 'addmokuai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/xmgl/jquery.js"></script>
<script language="JavaScript" type="text/javascript">
 	
 //保存
 $(document).ready(function (){
 	 $("#save").click(function (){
	 	var r=confirm("确认保存？");
		if (r==true)
	  	{
	  		fom.action="<%=basePath%>/promkServlet.do?op=updateProxq";
	  		fom.submit();
	  	}else{
	  		return;
	 	 }
	 })
 })
</script>
<script language="JavaScript" type="text/javascript">
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
			xmlHttp.open("get","<%=basePath%>/promkServlet.do?op=getAllxq&pjid="+s+"&num="+Math.random(),true);
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
  <form action="" method="post" name="fom" id="fom"  >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目模块添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0"  id='t1' cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		<!--  
		<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		-->
		</td></tr>

		
		
		<tr align="center">
         <td class="TablePanel" >
         		项目模块添加页面
		  	  </td>
		  </tr>
		<TR id="model">
			<TD width="100%">
			<div  id='hello1'><div class="MainDiv" id='hello1'>
				<fieldset style="height:100%;">
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="13%">模块名字:</td>
					    <td width="46%"><input name="moname"  id="moname" onblur='yanzheng("1");' class="text" style="width:154px" type="text" size="40" />
				        <span class="red"> *</span></td>
					    <td align="right" width="9%">&nbsp;</td>
					    <td width="32%">&nbsp;</td>
					    </tr>
					  <tr>
					    <td nowrap align="right">模块标识:</td>
					    <td><input name="mobiaozhi" id="mobiaozhi" onblur='yanzheng("2");' class="text" style="width:154px" /></td>
					    <td  align="right" >优先级:</td>
						  <td >
 							<select name="modmission" id='modmission' onblur='yanzheng("3");' style="width:154px" >
							 <option >请选择优先级</option>
                             <option id="xxx" value="暂不">暂不</option>
                             <option id="xxx"  value="一般">一般</option>
                             <option id="xxx" value="需要">需要</option>
                             <option id="xxx"  value="急">急</option>
                             <option id="xxx" value="很急">很急</option>
							</select>
                          </td>
					  </tr>
					   <tr>
					    <td align="right">所属项目:</td>
					    <td>
					       <select id="prono" name="prono" onblur='yanzheng("3");' style="width:154px" onchange="huoquxuqiu();">
					           <option>--请选择--</option>
					           <c:forEach items="${requestScope.list }" var="projb">
					               <option value='${projb.pjId }' <c:if test="${projb.pjId==requestScope.promk.xmglProxq.xmglProjb.pjId  }">selected='selected'</c:if>>${projb.pjName }</option>
					           </c:forEach>        
                           </select>                        
                        </td>
					     <td nowrap="nowrap" align="right">所属需求:</td>
					    <td id="xmxuqiu">
					    	<div id="nno1" >
					      		<select id="modno" name="nno" style="width:154px" >  
					       			 <option selected="selected">${requestScope.promk.xmglProxq.pxTitle }</option>
					       			 <option >请先选择项目</option>
					      		</select>
					    	</div> 
					  	 </td>
					   
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">模块描述:</td>
					    <td colspan="3"><textarea id="moddescription" name="moddescription" onblur='yanzheng("5");' rows="5" cols="80"></textarea></td>
					    </tr>
						<tr>
					    <td nowrap align="right" height="120px">需求描述:</td>
					    <td colspan="3">
							<textarea id="modneedDescription" name="modneedDescription" onblur='yanzheng("6");' rows="5" cols="80"></textarea>						</td>
					    </tr>
					  </table>
			 <br />
				</fieldset>	
				<div class='hello' id='hell'></div>	</div>
					
			</TD>
		</TR>
		<TR  id="newmodel">
			
		</TABLE>	
	 </td>
  </tr>
  		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="hidden" name="token" value="1479392095868">
			<input type="button" name="save"  id='save' value="保存" class="button" />　			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
			</TD>
		</TR>
		</TABLE>
</div>
</form>
</body>
</html>
