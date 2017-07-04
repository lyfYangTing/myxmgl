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
 //验证
function panduan(){
 var iscomplete=$("#iscomplete").val();	
		if(iscomplete=='未完成'){
			alert(iscomplete);
			document.getElementById("jrenddate").readOnly='readonly';
		}else if(iscomplete=='进行中'){
		alert(iscomplete);
			document.getElementById("jrenddate").readOnly='readonly';
		}else if(iscomplete=='已完成'){
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
 				alert("计划标题不能大于10个字节！");
 				$("#jtitle").attr("value",'');
 			}else if(jtitle==''){
 				alert("计划标题不能为空！");
 			}else if(iscomplete=='已完成'){
	 				 document.getElementById("jrenddate").readOnly=false;
	 				 if(jrenddate==''){
	 					alert("项目实际结束时间不能为空！");
	 				 }else if(!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(jrenddate)){
						alert("格式不正确，应为yyyy-mm-dd");
						$("#jrenddate").attr("value",'');
					 }else if(jbeizhu.length>300){
				 			alert("项目备注不能大于300个字节！");
				 			$("#jbeizhu").attr("value",'');
				 	 }else{
				 			alert("到这了吗");
				 			fom.action="<%=basePath%>/projhServlet.do?op=updateProjh&ppid=${requestScope.xmglProplan.ppId}";
				  			fom.submit();
				 	 }
 			}else if(jbeizhu.length>300){
	 				alert("项目备注不能大于300个字节！");
	 				$("#jbeizhu").attr("value",'');
	 		}else{
	 		        alert("到了吗");
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
      <th class="tablestyle_title" >项目计划编辑页面</th>
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
			<td class="TablePanel" ><input type="hidden" name="prono" value="${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.pjId }" />${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.xmglProjb.pjName}</td>
		</tr>
			<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>修改计划</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="15%">计划标题:</td>
					    <td width="35%"><input name='jtitle' id='jtitle' onblur='yanzheng("1");' type="text" class="text" style="width:154px" value="${requestScope.xmglProplan.ppName}" />
				        <span class="red">*</span></td>
					    <td width="16%" align="right" nowrap="nowrap">前置任务计划:</td>
					    <td width="34%">
					         <select style="width:154px" name='qzid'>
					    		<option value='0'>前置计划为空</option>
					    		<c:forEach items="${requestScope.qzrwlist}" var="qzrw">
					    		    <option value='${qzrw.ppId }' <c:if test="${qzrw.ppId==requestScope.xmglProplan.ppQzId }">selected='selected'</c:if>>${qzrw.ppName}</option>
					    		</c:forEach>
							</select>
					     </td>
					  </tr>
					    
					    
					  <tr>
					    <td nowrap="nowrap" align="right">实际开始时间:</td>
					    <td><input class="text" name='jrbegindate' id='jrbegindate' onblur='yanzheng("2");' style="width:154px" value="${requestScope.xmglProplan.ppsjStartTime}"/></td>
					    <td align="right">实际结束时间:</td>
					    <td><input class="text" name='jrenddate'id='jrenddate' onblur='yanzheng("3");'  readOnly="readonly" style="width:154px" value="${requestScope.xmglProplan.ppsjEndTime}" /><font color='red'>*状态为已完成才可填写!<font></td>
					  </tr>
					  <tr>
					    <td align="right">任务执行人:</td>
					    <td>
							<select name="jbyper" id='jbyper' onblur='yanzheng("4");' style="width:154px" class="text">
							 	<c:forEach items="${requestScope.zxrlist }" var="zxr">
							 	 <option value=${zxr.uid } <c:if test="${requestScope.xmglProplan.ppZxr==zxr.uid }">selected='selected'</c:if>>${zxr.uname}</option>
							 	</c:forEach>
							</select>
						</td>
					    <td align="right">优先级:</td>
					    <td>
							<select name="jmission" id='jmission' onblur='yanzheng("5");' style="width:154px">
							 <option id="xxx"  value="暂不" <c:if test="${requestScope.xmglProplan.ppYxj=='暂不' }">selected='selected'</c:if>>暂不</option>
                             <option id="xxx"  value="一般" <c:if test="${requestScope.xmglProplan.ppYxj=='一般' }">selected='selected'</c:if>>一般</option>
                             <option id="xxx"  value="需要" <c:if test="${requestScope.xmglProplan.ppYxj=='需要' }">selected='selected'</c:if>>需要</option>
                             <option id="xxx" value="急" <c:if test="${requestScope.xmglProplan.ppYxj=='急' }">selected='selected'</c:if>>急</option>
                             <option id="xxx" value="很急" <c:if test="${requestScope.xmglProplan.ppYxj=='很急' }">selected='selected'</c:if>>很急</option>
							</select>
						</td>
					  </tr>
					  <tr>
					    <td align="right">任务类型:</td>
						<td>
							<select name="jleixing" id='jleixing' onblur='yanzheng("6");' style="width:154px">
								<c:forEach items="${requestScope.rwlxlist }" var="rwlx">
							 	 <option value=${rwlx.rwId } <c:if test="${requestScope.xmglProplan.rwId==rwlx.rwId }">selected='selected'</c:if>>${rwlx.rwName}</option>
							 	</c:forEach>
							</select>
						</td>
					    <td align="right">状态:</td>
					    <td>
							<select name="iscomplete" id='iscomplete' onchange="panduan();" onblur='yanzheng("7");' style="width:154px">
							  <option    value="未开始" <c:if test="${requestScope.xmglProplan.ppState=='未开始' }">selected='selected'</c:if>>未开始</option>
							  <option    value="进行中" <c:if test="${requestScope.xmglProplan.ppState=='进行中' }">selected='selected'</c:if>>进行中</option>
							  <option    value="已完成" <c:if test="${requestScope.xmglProplan.ppState=='已完成' }">selected='selected'</c:if>>已完成</option>
							</select>
						</td>
					  </tr>
					  <tr>  	 
                         <td align="right">项目需求:</td>
					     <td >
					    	<input style="width:154px" value="${requestScope.xmglProplan.progn.xmglPromk.xmglProxq.pxTitle}" disabled="disabled"/>
						 </td>
						 
                        <td align="right">项目模块:</td>
					    <td>
					        <input style="width:154px" value="${requestScope.xmglProplan.progn.xmglPromk.pmName}" disabled="disabled"/>
						</td>
						<tr>
						<td align="right">项目功能:</td>
					    <td>
					         <input style="width:154px" value="${requestScope.xmglProplan.progn.pgName}" disabled="disabled"/>
					         <input type="hidden" name='gongneng' value="${requestScope.xmglProplan.progn.pgId }">
						</td>
						 <td align="right">是否审核:</td>
					     <td>
					        <select style="width:154px" name="isok" id='isok' onblur='yanzheng("10");'>
                                    <option  value="是" <c:if test="${requestScope.xmglProplan.ppshState=='是' }">selected='selected'</c:if>>是</option>
								    <option  value="否" <c:if test="${requestScope.xmglProplan.ppshState=='否' }">selected='selected'</c:if>>否</option>
							</select>
					     </td>
					    <td align="right"></td>
					    <td></td>
					    </tr>
					 
					  <tr>
					    <td align="right">计划备注:</td>
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
		<input type="button" name="save"  id='save' value="保存" onclick="save1();" class="button" />　			
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>		
				</TD>
		</TR>
		</TABLE>
	
	


</div>
</form>
</body>
</html>
