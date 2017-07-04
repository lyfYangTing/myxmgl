<%@ page language="java" import="java.util.*,po.*,stopflush.*" pageEncoding="GBK"  contentType='text/html;charset=GB18030'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>客户系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
</head>


<script>
	$(document).ready(function(){
	    //全选功能点击触发事件
		$("#allselect").click(function(){
		     //将所有多选框：type='checkbox'的组件中的checked属性 赋值为 checked则表示选中该多选框
			 $(":checkbox").attr("checked","checked");
		});
		//反选功能点击触发事件  
		$("#fanselect").click(function(){
		    //统计type='checkbox'的组件的总数
			var size=$(":checkbox").length;
			//循环找出 已选的（有checked属性）多选框  删除该属性值  
			//将type='checkbox'的组件中的没有checked属性  的组件（以前没被选中）赋值为 checked则表示选中该多选框 
			for(var i=0;i<size;i++){
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(":checkbox:eq("+i+")").removeAttr("checked");
				}else{
					$(":checkbox:eq("+i+")").attr("checked","checked");
				}
			}
		});
		//删除所选人员信息（按钮点击事件）改变隐含域中将传递给后台标识可删除不可删除标识就是该隐含域的value值
		$("#linkdel").click(function(){
			var size = $(":checkbox").length;
			//获取隐含域对象 目的：传递到后台是否能够执行删除任务的标识  yes 标识表示可以删除  no 标识表示不能被删除
			var obj1 = document.getElementsByName("world");
			//提示框，提示用户是否完成该删除操作
			var r=confirm("请在删除客户之前完成该客户的所有项目，如果删掉相关联数据将被全部删除，是否确定删除？");
			//确认操作后 r返回true
			if(r==true){
			for (var i=0;i<size;i++){	
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(".world:eq("+i+")").attr("value","yes");
				}else{
					$(".world:eq("+i+")").attr("value","no");
				}
			}
			$("#fom").attr("action","<%=path%>/customerServlet.do?op=deleteCus");
		}
		});
		//文本框中填写页数 实现跳转
		$("#lik").click(function(){
		    //取出文本框中取出的值
			var curPage=$("#page").val();
  			if(!/^[1-9][0-9]*$/.test(curPage)){
  				alert("请输入数字！");
  				return  false;
  			}
			if(curPage <1 || curPage > "${requestScope.util.totalPage}"){
				alert("输入数字不正确！");
				return false;
			}   
			if(curPage==""){
				alert("请输入！");
				return false;
			}
			$("#fom").attr("action","<%=path%>/customerServlet.do?op=showAllcustomers&curPage="+curPage);
		});
		$("#chaxun").click(function(){
	        var cha=$("#clientname").val();
	        if(cha==""){
	       		  alert("请输入客户公司名称！");
	       		  $("#fom").attr("action","<%=path%>/customerServlet.do?op=getCustomerByName&page=1");
	       		 }else{
	       		 $("#fom").attr("action","<%=path%>/customerServlet.do?op=getCustomerByName&page=1");
	       		 }
		});
		$("#tian").click(function (){
			$("#fom").attr("action","<%=basePath%>/files/addkehu.jsp");
		});
	});
	
</script>
<body>
<!-- 
     防刷新机制
 -->
<%TokenUtil.getInstance().saveToken(request);%>
<form  name="fom" id="fom" method="post" action=''>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=path%>/images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		    
			  <td width="24"><img src="<%=basePath%>/images/ico07.gif" width="20" height="18" /></td>
			  <td width="519"><label>公司名称:
			      <input name="clientname" type="text" id="clientname" />
			  </label>
			    <input name="Submit" type="submit" id='chaxun' class="right-button02" value="查 询" /></td>
			   <td width="679" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>	
		    </tr>
          </table>

          </td>
        </tr>
    </table>
   </td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08" id='allselect'>全选</a>-<a href="#" class="right-font08" id='fanselect'>反选</a></span>
		           <input name="Submit" type="submit" class="right-button08" value="删除所选人员信息" id='linkdel' /> <input name="Submit" id='tian' type="submit" class="right-button08" value="添加人员信息" />
		           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	              </td>
          </tr>
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户详细列表 &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="8%" align="center" bgcolor="#EEEEEE">选择</td>
					<td width="12%" height="20" align="center" bgcolor="#EEEEEE">公司名称</td>
                    <td width="7%" align="center" bgcolor="#EEEEEE">联系人</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                    <td width="14%" align="center" bgcolor="#EEEEEE">联系地址</td>
					<td width="28%" align="center" bgcolor="#EEEEEE">公司背景</td>
					<td width="10%" align="center" bgcolor="#EEEEEE">添加时间</td>
                    <td width="11%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>

          <c:forEach items="${requestScope.util.list}" var="cl" varStatus="vs">

          <c:choose>
           <c:when test="${f:length(cl.cname) > 8}">
             <c:set var="title" value="${f:substring(cl.cname,0,8)}..."></c:set>
           </c:when>
           <c:otherwise>
             <c:set var="title" value="${cl.cname}"></c:set>
           </c:otherwise>
         </c:choose>
                 <tr>
				    <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
					<td height="20" bgcolor="#FFFFFF">
					<a href="<%=path%>/customerServlet.do?op=queryOne&cid=${cl.cid}&option=1">${cl.cname }</a>
					</td>
                    <td bgcolor="#FFFFFF">${cl.clxr}</td>
                    <td height="20" bgcolor="#FFFFFF">${cl.ctel}</td>
                    <td bgcolor="#FFFFFF">${cl.caddress}</td>
                    <td bgcolor="#FFFFFF">${cl.cbj}</td>
                    <td bgcolor="#FFFFFF">${cl.catime}</td>
					<td bgcolor="#FFFFFF"><a href="<%=path%>/customerServlet.do?op=queryOne&cid=${cl.cid}&option=2">编辑</a>&nbsp;|&nbsp;
					                      <a href="<%=path%>/customerServlet.do?op=queryOne&cid=${cl.cid}&option=1">查看<input type="hidden"  name="hello"  value="${cl.cid}"><input type="hidden"  class='world' name="world"  id='world'></a>
					                      </td>
                    </tr>
                   </c:forEach>     
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="<%=path%>/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">${requestScope.util.totalPage }</span> 页 | 第 <span class="right-text09">${ requestScope.curpage}</span> 页</td>
                <td width="49%" align="right">[<a href="<%=basePath%>/customerServlet.do?op=showAllcustomers&curPage=${1}" class="right-font08">首页</a>
                 | <a href="<%=path%>/customerServlet.do?op=showAllcustomers&curPage=${requestScope.curpage-1>0?requestScope.curpage-1 :"1"}" class="right-font08">上一页</a> 
                 | <a href="<%=path%>/customerServlet.do?op=showAllcustomers&curPage=${requestScope.curpage<requestScope.util.totalPage?requestScope.curpage+1:requestScope.util.totalPage }" class="right-font08">下一页</a> 
                 | <a href="<%=path%>/customerServlet.do?op=showAllcustomers&curPage=${requestScope.util.totalPage }" class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="page" name="page" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="" id='lik'  />
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
</body>
</html>
