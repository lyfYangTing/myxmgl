<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'editjihua.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script language="JavaScript" type="text/javascript"> 
  //验证
function save1(){
 			//alert("1111");
 			var jtitle=$("#jtitle").val();
 			var jrbegindate=$("#jrbegindate").val();
 			var jrenddate=$("#jrenddate").val();
 			var jbyper=$("#jbyper").val();	
 			var jmission=$("#jmission").val();	
 			var jleixing=$("#jleixing").val();	
 			var iscomplete=$("#iscomplete").val();	
 			var jbeizhu=$("#jbeizhu").val();
 			var nno=$("#nno").val();
 			var prono=$("#prono").val();
 			var nno=$("#xuqiu1").val();
 			var modno=$("#mokuai").val();
 			var gno=$("#gongneng").val();
 			var jno=$("#qzrw").val();
 			
 			if(jtitle.length>10){
 				alert("计划标题不能大于10个字节！");
 				$("#jtitle").attr("value",'');
 				//$("#save").attr("disabled","disabled");
 			}else if(jtitle==''){
 				alert("计划标题不能为空！");
 				//$("#save").attr("disabled","disabled");
 			}else
 		
 			//jrbegindate
 			
  			 if(jrbegindate==''){
 					alert("项目计划开始时间不能为空！");
 				}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrbegindate)){
					alert("格式不正确，应为yyyy-mm-dd");
					$("#jrbegindate").attr("value",'');
				}else
 		
 		
 			//jrenddate
 		
  			 if(jrenddate==''){
 					alert("项目计划结束时间不能为空！");
 				}else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrenddate)){
					alert("格式不正确，应为yyyy-mm-dd");
					$("#jrenddate").attr("value",'');
				}else
 		
 			//jbyper
 			
 			if(!/^[0-9]*$/.test(jbyper)){
 				alert(jbyper);
 			}else
 	
 			//jmission
 			
 			if(jmission=="0"){
 				alert(jmission);
 			}else
 
 			//jleixing
 			
 			if(jleixing=="0"){
 				alert(jleixing);
 			}else

 			//iscomplete
 			
 			if(iscomplete=="0"){
 				alert(iscomplete);
 			}else
 			//项目，需求，模块，功能，前置计划
 			if(!/^[0-9]*$/.test(prono)){
 				alert(prono);
 			}else if(!/^[0-9]*$/.test(nno)){
 				alert(nno);
 				return false;
 			}else if(!/^[0-9]*$/.test(modno)){
 				alert(modno);
 				return false;
 			}else if(!/^[0-9]*$/.test(gno)){
 				alert(gno);
 				return false;
 			}else if(!/^[0-9]*$/.test(jno)){
 				alert(jno);
 				return false;
 			}else 
 
 			//jbeizhu
 			
 			if(jbeizhu.length>300){
 				alert("项目备注不能大于300个字节！");
 				$("#jbeizhu").attr("value",'');
 			}else
 
 			//jbeizhu
 			
 			if(nno.length>300){
 				alert("项目备注不能大于300个字节！");
 				$("#nno").attr("value",'');
 			}else{
 				fom.action="servlet/projhServlet.do?op=insertProjh";
	  			fom.submit();
 			
 			}
 		
 		}
</script>
<script type="text/javascript">
//根据项目id 生成需求下拉列表
function xuanxm(){
	var s = document.getElementById("prono").value;
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
	//调用open方法getAllProxqs
	xmlHttp.open("post","<%=basePath%>/gongNengServlet.do?op=getAllProxqs&pno="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		var liebiao = document.getElementById("xuqiu1");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				opt.value=zx[i].pxId;
				opt.text=zx[i].pxTitle;
				liebiao.add(opt);
			}
			xuanzxr();
	 	 }
	}
	//调用send方法
	xmlHttp.send();
	return false;
	//获取所有执行人
	function xuanzxr(){
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
	var s = document.getElementById("prono").value;
	xmlHttp.open("post","<%=basePath%>/projhServlet.do?op=getAllProzxr&pjid="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		var liebiao = document.getElementById("jbyper");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				opt.value=zx[i].uid;
				opt.text=zx[i].uname;
				liebiao.add(opt);
			}
	 	 }
	}
	//调用send方法
	xmlHttp.send();
	return false;
	}
}
</script>
<script type="text/javascript">
//根据需求获取所有的模块
function xuanmk(){
	var s = document.getElementById("xuqiu1").value;
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
	xmlHttp.open("post","<%=basePath%>/gongNengServlet.do?op=getAllProMks&xqno="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		var liebiao = document.getElementById("mokuai");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				opt.value=zx[i].pmId;
				opt.text=zx[i].pmName;
				liebiao.add(opt);
			}
	 	 }
	}
	//调用send方法
	xmlHttp.send();
	return false;
}
</script>
<script type="text/javascript">
//根据选择的模块，获取其下的所有功能
function xuangn(){
	var s = document.getElementById("mokuai").value;
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
	xmlHttp.open("post","<%=basePath%>/projhServlet.do?op=getAllProgn&pmid="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		var liebiao = document.getElementById("gongneng");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				opt.value=zx[i].pgId;
				opt.text=zx[i].pgName;
				liebiao.add(opt);
			}
	 	 }
	}
	//调用send方法
	xmlHttp.send();
	return false;
}
</script>
<script type="text/javascript">
//根据选择的功能，获取其下的所有计划
function xuanjh(){
	var s = document.getElementById("gongneng").value;
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
	xmlHttp.open("post","<%=basePath%>/projhServlet.do?op=getAllProjh&pgid="+s+"&num="+Math.random(),true);
	xmlHttp.onreadystatechange=function (){
	  if (xmlHttp.readyState==4){
	 		var zx = eval(xmlHttp.responseText);
	 		var liebiao = document.getElementById("qzrw");
	 		var len = liebiao.length;
	 		for(var i = 0; i < len ; i ++){
				liebiao.remove(0);
			}
			var opi = document.createElement("option");
			opi.text = "---请选择---";
			opi.value = "0";
			liebiao.add(opi);
			for(var i = 0 ; i < zx.length; i ++){
				var opt = document.createElement("option");
				opt.value=zx[i].ppId;
				opt.text=zx[i].ppName;
				liebiao.add(opt);
			}
	 	 }
	}
	//调用send方法
	xmlHttp.send();
	return false;
}
</script>
</head>

<body class="ContentBody">
  <form action="" method="post"  name="fom"  id="fom" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >项目计划添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
			<td align="left">
				<!--  
		<input type="button" name="save"  id='save' value="保存" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		-->
				
			</td>
		</tr>
		<tr align="center">
		<td class="TablePanel">
		    <select name="prono" id="prono" onchange="xuanxm();">
		  	  <option  selected="selected">请选择项目</option>
		  	  <c:forEach items="${requestScope.pjlist }" var="pj">
		  	     <option value="${pj.pjId }">${pj.pjName}</option>
		  	  </c:forEach>
            </select></td>
		<td class="TablePanel">&quot;</td>
		</tr>
			<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加计划</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="15%">计划标题:</td>
					    <td width="35%"><input name='jtitle' id='jtitle' onblur='yanzheng("1");' type="text" class="text" style="width:154px"  />
				        <span class="red">*</span></td>
					    <td width="16%" align="right" nowrap="nowrap">前置任务计划:</td>
					    <td width="34%">
				        <select style="width:154px" id="qzrw" name="qzrw">
				    		<option value='0'>请先选择功能</option>
						</select>
						</td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">计划开始时间:</td>
					    <td><input class="text" name='jrbegindate' id='jrbegindate' onblur='yanzheng("2");' style="width:154px" /></td>
					    <td align="right">计划结束时间:</td>
					    <td><input class="text" name='jrenddate' id='jrenddate' onblur='yanzheng("3");' style="width:154px"  /></td>
					  </tr>
					  <tr>
					    <td align="right">任务执行人:</td>
					    <td>
							<select name="jbyper" id='jbyper' onblur='yanzheng("4");' style="width:154px" class="text">
							 	<option selected="selected">请选择任务执行人</option>	  
							</select>
						</td>
					    <td align="right">优先级:</td>
					    <td>
							<select name="jmission" id='jmission' onblur='yanzheng("5");' style="width:154px">
							<option value='0'>--请选择优先级--</option>
							  <option value="暂不">暂不</option>
                              <option value="一般">一般</option>
                              <option value="需要">需要</option>
                              <option value="急">急</option>
                              <option value="很急">很急</option>
							</select>
						</td>
					  </tr>
					  <tr>
					    <td align="right">任务类型:</td>
						<td>
							<select id='jleixing' name="jleixing" onblur='yanzheng("6");' style="width:154px" class="text" >
								 <option selected="selected" value='0'>请选择任务类型</option>
								 <c:forEach items="${requestScope.rwlxlist }" var="rwlx">
		  	                     <option value="${rwlx.rwId }">${rwlx.rwName}</option>
		  	                     </c:forEach>
							</select>
						</td>
					    <td align="right">状态:</td>
					    <td>
								<select id='iscomplete'  name="iscomplete" onblur='yanzheng("7");' style="width:154px" class="text">
								  <option selected="selected" value='0'>请选择完成状态</option>
								  <option value="未开始" >未开始</option>
								</select>
						</td>
					  </tr>
					  <tr>
					   <td align="right">项目需求:</td>
					    <td>
					    	<select style="width:154px" name="xqid" id="xuqiu1" onchange="xuanmk()">
					    	<option selected="selected">请先选择项目</option>
					    	</select>
						</td>
						 
                        <td align="right">项目模块:</td>
					    <td>
							<select  style="width:154px" class="text" id="mokuai" onchange="xuangn()">
							<option selected="selected">请先选择需求</option>
							</select>
						</td>
					    </tr>
					 <tr>
					 <td align="right">项目功能:</td>
					    <td>
							<select style="width:154px" id="gongneng" name = "gongneng" onchange="xuanjh()">
								<option selected="selected">请先选择模块</option>
							</select>
						</td>
					 </tr>
					 
					  <tr>
					    <td align="right">计划备注:</td>
					    <td colspan="3"><textarea id='jbeizhu' name="jbeizhu" onblur='yanzheng("8");' cols="100" rows="8" ></textarea></td>
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
			<input type="hidden" name="token" value="1479559541407">
			<input type="button" name="save"  id='save' value="保存" onclick="save1();"  class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>			
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
