<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目管理系统 by www.ewahha.com</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">

</script>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<SCRIPT language=JavaScript>
$(document).ready(function (){
		//全选
		$("#allselect").click(function(){
		//alert($("#allselect"));
			 $(":checkbox").attr("checked","checked");
		});
		//反选
		$("#fanselect").click(function(){
			var size=$(":checkbox").length;
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					//alert($(":checkbox").attr("checked"));
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("http://localhost:8080/xmgl/files/xuqiugaoji.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   		    //alert(returnv);
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/NeedServlet?methodName=gaojiquery&curPage=1"+returnv);
	   			}
	   		});
	   	});
		
		
});
function linkdel(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	var r=confirm("是否确定删除");
	if(r==true){
	for (var i=0;i<obj.length;i++){		
		if (obj[i].checked == true){
			obj1[i].value="yes";
		}else{
			obj1[i].value="no";
		}
	}
	document.getElementById("fom").action="<%=basePath%>/prjXqServlet.do?op=deleteProjb";
	document.getElementById("fom").submit();
	}else{
	document.getElementById("fom").action="<%=basePath%>/prjXqServlet.do?op=queryAllProXqInfo&curpage=1";
	document.getElementById("fom").submit();
	}
}
</SCRIPT>
<script type="text/javascript">

  	$(document).ready(function (){
  		//alert("asd");
  		//分页
  		var t = ${requestScope.util.totalPage};
   		$("#gog").click(function(){
  			var curPage=$("#ij").val();
  			if(curPage>t){
     			curPage=${requestScope.util.curpage};
   			  } 
   			if(curPage<t){
    			curPage=curPage;
  			  }
  			if(curPage<1){
      			curPage=${requestScope.util.curpage};
  			  }
  			  $("#fom").attr("action","<%=basePath%>/prjXqServlet.do?op=queryAllProXqInfo&curpage="+curPage);
  		});
  		//添加需求
  		$("#add").click(function(){
  			$("#fom").attr("action","<%=basePath%>/prjXqServlet.do?op=getAllPrjInfo");
  			$("#fom").submit();
  		});
  		//范围查询
  		$("#fanwei").click(function(){
  	      
  		    var createbegin=$("#date1").val();
  		    var createend=$("#date2").val();
  		   if(createbegin!=""&&!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(createbegin)){
						alert("格式不正确，应为yyyy-mm-dd");
						return;
				}
  		   if(createend!=""&&!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(createend)){
					 	alert("格式不正确，应为yyyy-mm-dd");
						return;
				}
  		   if(createbegin==""||createend==""){
  		                alert("无查询条件");
  		                return 
  		   }
  		   	var path="http://localhost:8080/xmgl/servlet/NeedServlet?methodName=gaojiquery1&curPage=1&createbegin="+createbegin+"&createend="+createend;
  		    $("#fom").attr("action",path);
  		    $("#fom").submit();
  		    
  		});
  	});
  </script>
 
<body>


<form name="fom" id="fom" method="post" action="http://localhost:8080/xmgl/servlet/NeedServlet?methodName=gaojiquery1&curPage=1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=basePath %>/images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21">&nbsp; <img src="<%=basePath %>/images/ico07.gif" width="20" height="18" /></td>
			  <td width="523">查看内容：
                按时间：
<input name="createbegin" id="date1" type="text" size="12" />
<span class="newfont06">至</span>
<input name="createend" id="date2" type="text" size="12" />
<input name="Submit4" type="submit"  class="right-button02" value="查 询" /></td>
			   <td width="159" align="left"><a href="#" onclick="sousuo()">
			     <input name="Submit" type="submit" class="right-button07" id='find'value="高级搜索" /></a></td>	
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
         
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
                <td height="20"><span class="newfont07">选择：<input type="button" class="right-button02" value="全选" id='allselect'>-<input type="button" class="right-button02"  value="反选" id='fanselect'></span>
		           <input name="Submit" type="button" class="right-button08" value="删除所选需求信息" onclick="linkdel();"/> 
	              <input name="Submit2" id="add"  type="button" class="right-button08" value="添加需求" /></td>
	             
          </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

		 <tr>
                    <td colspan="9" bgcolor="#EEEEEE" class="tablestyle_title">
					  <div align="center" style="font-size:16px ">需求列表</div></td>
                    </tr>
                  <tr bgcolor="#EEEEEE" height="30">
				    <td width="9%">选择</td>
                    <td width="18%">需求主题</td>
                     <td width="18%">所属项目</td>
                    <td width="18%">创建时间</td>
                    <td width="18%">更新时间</td>
                    <td width="21%">操作</td>
                  </tr>
                 	
                 	<c:forEach items = "${requestScope.util.list}" var = "proxq">
	               		<tr bgcolor="#FFFFFF" height="20">
	                  		
					    <td><input type="checkbox" name="delid" value="${proxq.pxId}"/></td>
	                    <td><a href="<%=basePath%>/prjXqServlet.do?op=getPrJbById&caozuo=cha&xqid=${proxq.pxId}" onclick="">${proxq.pxTitle }</a></td>
	                    <td>${proxq.xmglProjb.pjName}</td>
	                    <td>${proxq.txCreateTime}</td>
	                    <td>${proxq.txUpdateTime}</td>
	                    <td><a href="<%=basePath%>/prjXqServlet.do?op=getPrJbById&xqid=${proxq.pxId}">编辑</a>
	                    |<a href="<%=basePath%>/prjXqServlet.do?op=getPrJbById&caozuo=cha&xqid=${proxq.pxId}">查看</a></td>
	              	</tr>
	               		<input type="hidden"  name="hello"  value="${proxq.pxId}">
	                     <input type="hidden"  name="world" >
                 	</c:forEach>
            </table></td>
        </tr>
      </table>
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">          
             <tr>
                <td width="50%">第 <span class="right-text09">${requestScope.util.curpage }</span> 页
                 | 共 <span class="right-text09">${requestScope.util.totalPage}</span> 页 
                 | <span class="right-text09">${requestScope.util.count}</span>条记录</td>
                <td width="49%" align="right"> 
                <table width="95%" cellspacing="0" cellpadding="0" border="0" align="center"><tbody><tr>
        <td height="6"><img height="1" width="1" src="../images/spacer.gif"></td> 
        </tr></tbody>
        </table>
        [<a href="<%=basePath%>/prjXqServlet.do?op=queryAllProXqInfo&curpage=1" class="right-font08">首页</a> 
        | <a href="<%=basePath%>/prjXqServlet.do?op=queryAllProXqInfo&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">上一页</a> 
        | <a href="<%=basePath%>/prjXqServlet.do?op=queryAllProXqInfo&curpage=${requestScope.util.curpage==requestScope.util.totalPage?requestScope.util.totalPage:requestScope.util.curpage+1}" class="right-font08">下一页</a>
        | <a href="<%=basePath%>/prjXqServlet.do?op=queryAllProXqInfo&curpage=${requestScope.util.totalPage}" class="right-font08">末页</a>] 转至：
        </td>
        <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="1%"><input id="ij"  type="text" class="right-textfield03" size="1" /></td>
              <td width="87%"><input name="gog" id='gog' type="submit" class="right-button06" value="" />
              </td>
            </tr>
        </table></td>
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
</table>
</form>
</body>
</html>
