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
    <title>My JSP 'listxiangmuxinxi.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=basePath %>//css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>//css/style.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="<%=basePath%>/jquery.js"></script>
<script>
  	$(document).ready(function (){
  		//分页
  		$("#gog").click(function(){
  			var curPage=$("#ij").val();
  			if(!/^[0-9]*$/.test(curPage)){
  				alert("请输入数字！");
  				return false;
  			}
  			if(parseInt(curPage,10)<1){
  				aler(curPage);
  				curPage=1;
  			}
  			$("#fom").attr("action","<%=basePath%>/projbServlet.do?op=showOnePageProjb&curpage="+curPage);
  		});
  		
  		//添加项目
  		$("#add").click(function(){
  		alert(123123);
  			$("#fom").attr("action","<%=basePath%>/projbServlet.do?op=getCustomerAndUsers&caozuo=insert");
  			//alert($("#fom").attr("action"));
  			$("#fom").submit();
  		});  		
  		//时间查询
  		$("#chaxun").click(function(){
  		//alert("111");
  			var probuildDate=$("#probuildDate").val();
  			//alert(probuildDate);
  			if(probuildDate!=""&&!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(probuildDate)){
						alert("格式不正确，应为yyyy-mm-dd");
						return;
				}
			var enddate=$("#enddate").val();
  			//alert(enddate);
  			if(enddate!=""&&!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(enddate)){
						alert("格式不正确，应为yyyy-mm-dd");
						return;
				}
				
  			$("#fom").attr("action","http://localhost:8080/xmgl/servlet/XiangMuServlet?methodName=gaoJiCha&curPage="+curPage+"&proname=&proclname=&promrg=&promossion=");
  			
  		});
  		
  	});
  </script>
<script type="text/JavaScript">
		
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("http://localhost:8080/xmgl/files/gaojisouxiangmu.jsp","高级查询","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/XiangMuServlet?methodName=gaoJiCha"+returnv);
	   			}
	   		});
	   	});
	   	
</script>

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
		
		//删除
});


function linkdel(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	
	for (var i=0;i<obj.length;i++){
		//alert("hello");
		if (obj[i].checked == true){
			obj1[i].value="yes";
			//alert("hello");
		}else{
			obj1[i].value="no";
		}
	}
	var r=confirm("确认删除？");
	if (r==true)
  	{
  		document.getElementById("fom").action="<%=basePath%>/projbServlet.do?op=deleteProjb";
		document.getElementById("fom").submit();
  	}else{
  		return;
 	}
}



</SCRIPT>
 
<body onload="on_load()">

<form name="fom" id="fom" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="<%=basePath %>images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="550">查看内容：按时间：
              <input name="probuildDate" id='probuildDate' type="text" size="12" /><span class="newfont06">至</span>
			 <input name="enddate" id='enddate' type="text" size="12" />	
			 <input name="Submit" type="submit" class="right-button02" id='chaxun' value="查 询" /></td>
			 <td width="132" align="left"><a href="#" onclick="sousuo()">
			  <input name="Submit" type="submit" class="right-button07" id='find'  value="高级搜索" /> </a></td>	
		  </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

          	 <tr>
                 <td height="20"><span class="newfont07">选择：<input type="button" class="right-button02" value="全选" id='allselect'>-<input type="button" class="right-button02"  value="反选" id='fanselect'></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选项目信息" onclick="linkdel();"/>
	              <input name="Submit2" id="add"  type="button" class="right-button08" value="添加项目" /></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="13" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 项目信息列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">选择</td>
                    <td width="10%" height="20" align="center" bgcolor="#EEEEEE">项目名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">客户名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">项目经理</td>
                    <td width="5%" align="center" bgcolor="#EEEEEE">开发人数</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">立项时间</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">更新时间</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">任务优先级</td>
                    <td width="5%" align="center" bgcolor="#EEEEEE">状态</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>	   
                  <c:forEach items = "${requestScope.util.list}" var = "projb">
                  	<tr align = "center">
                  		<td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                  		<td height="20" bgcolor="#FFFFFF"><a href="<%=basePath%>/projbServlet.do?op=getOneProjb&caozuo=cha&pjid=${projb.pjId}">${projb.pjName}</a></td>
                  		<td bgcolor="#FFFFFF">${projb.xmglCustomer.cname}</td>
                    	<td bgcolor="#FFFFFF">${projb.xmglUser.uname}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjDeveloperTotal}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjLxsj}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjUpdateTime}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjYxj}</td>
                        <td bgcolor="#FFFFFF">${projb.pjState}</td>
                        <td bgcolor="#FFFFFF">
                        <a href="<%=basePath%>/projbServlet.do?op=getCustomerAndUsers&caozuo=update&pjid=${projb.pjId}">编辑</a>
                       	|<a href="<%=basePath%>/projbServlet.do?op=getOneProjb&caozuo=cha&pjid=${projb.pjId}">查看</a></td>
	                    <input type="hidden" name="hello" value="${projb.pjId}"> 
	                 	<input type="hidden" name="world">
                  	</tr>
                  </c:forEach> 
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
               <td width="50%">第 <span class="right-text09">${requestScope.util.curpage }</span> 页 
               | 共 <span class="right-text09">${requestScope.util.totalPage}</span> 页 
               | <span class="right-text09">${requestScope.util.count}</span>条记录</td>
                <td width="49%" align="right">
                 [ <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&curpage=1" class="right-font08">首页</a>
                 | <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">上一页</a>
                 | <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&curpage=${requestScope.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">下一页</a>
                 | <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&curpage=${requestScope.util.totalPage}" class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                       <td width="1%"><input id="ij"  type="text" class="right-textfield03" size="1" /></td>
                       <td width="87%"><input name="gog" id='gog' type="submit" class="right-button06" value=" " />
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>

<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">
	<img src="file:///F|/项目管理相关资料/项目管理系统页面/images/loadon.gif" />
</div>

</body>
</html>
	