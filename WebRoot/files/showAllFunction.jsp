<%@ page language="java" import="java.util.*,po.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>项目管理系统 by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/myxmgl/jquery.js"></script>
<link rel="StyleSheet" href="<%=path %>/dtree.css" type="text/css" />
<script src="<%=path %>/dtree.js" type="text/javascript" ></script>

<script type="text/javascript">
     function showFunction(){
          //创建驱动
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
			var sele = document.getElementById("js");
            var value = sele.value;
			//调用open
			xmlHttp.open("get","<%=path%>/roleServlet.do?op=getAllFuncs&roid="+value+"&number="+Math.random(), true);
			//绑定事件函数
		   xmlHttp.onreadystatechange=function(){
	           if(xmlHttp.readyState==4){
			        var json = eval(xmlHttp.responseText);
                    var funcs =  document.getElementsByName("fun"); 
                    for(var i=0;i<funcs.length;i++){
                        funcs[i].checked="";
                        for(var j=0;j<json.length;j++){
                            if(funcs[i].value==json[j]["fuid"]){
                                funcs[i].checked="checked";
                                break;
                            }
                        }
                    } 
		        }
		    }
		   xmlHttp.send();
		   return false;
     }
</script>
<script type="text/javascript">
    $(document).ready(function(){
	$("#allselect").click(function(){
			 $(":checkbox").attr("checked","checked");
		});
		$("#fanselect").click(function(){
			var size=$(":checkbox").length;
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
	$("#tj").click(function(){
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=getAllRoles&w=1");
	});
	$("#sc").click(function(){
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=getAllRoles&w=2");
	});
	//目的是把角色No带入到跳转地址中，以方便servlet获取
	$("#xiugai").click(function(){
		var s=$(":selected").val();
		$("#fom").attr("action","<%=basePath%>/roleServlet.do?op=updateFuncs&roid="+s);
	});
});

</script>

<script type="text/javascript"> 
var powerId = new dTree('powerId');
var root = 0;
var powerCode = false;
var check = false;
powerId.add(root,-1,'管理权限','');
function checkNode(nodeId){
	powerId.checkNode(nodeId);
}
</script>


</head>
<body >


<form  name="fom" id="fom" method="post" >

<div align="center"><input type="submit" value="添加角色" class="right-button08" id="tj">
<input type="submit" value="删除角色" class="right-button08" id="sc"></div>

<table border="1" align="center"  width="60%" cellspacing="0" cellpadding="0" >
  <tr>
    <td class="tablestyle_title" width="20%"><a href="#"
	class="right-font08" id="allselect"><font color="white">全选</font></a>-<a
	href="#" class="right-font08" id="fanselect"><font color="white">反选</font></a></td>

    <td  class="tablestyle_title">角色名称
     <select name="mc" id="js" onchange="showFunction()">
     <!-- 在下拉列表中显示所有的角色 -->
        <option value="0">--请选择--</option>
	    <c:forEach items="${requestScope.rolelist }" var="role">
	        <option value="${role.roid }">${role.roname }</option>    
	    </c:forEach>
	 </select>
	</td>
  </tr>
  
  <tr>
  	<td colspan = "2">
  		    <c:forEach items="${requestScope.listAll }" var="funall">
                   <script>
                       powerId.add("${funall.fuid}","${funall.pid}","${funall.funame}",true,"${funall.fuid}","fun","","${fun.fuhref}","${fun.funame}","mainFrame");
                   </script>
           </c:forEach>
                  
           <script type="text/javascript">
               document.write(powerId);
               powerId.openAll();
           </script>
  	</td>
  </tr>
  
</table>
<div align="center">
	<input type="submit"  class="right-button08" id="xiugai" value="确认修改" />
    <input type="reset" class="right-button08"   value="还原" /></div>
</form>
</body>
</html>
