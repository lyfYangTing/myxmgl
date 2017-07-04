<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="/xmgl/css/css.css" rel="stylesheet" type="text/css" />
<link href="/xmgl/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
</head>
<script>
	$(document).ready(function(){
		$("#lik").click(function(){
			var curPage1=$("#page1").val();
  			if(!/^[1-9][0-9]*$/.test(curPage1)){
  				alert("请输入数字！");
  				return false;
  			}
			if(curPage1 <1 || curPage1 > "1"){
				alert("输出数字不正确！");
				return false;
			}   
			if(curPage1==""){
				alert("请输入！");
				return false;
			}
			$("#fom").attr("action","/xmgl/servlet/clientServlet?methodName=queryClNa&clientname=万能电力&page="+curPage1);
		});
		$("#chaxun").click(function(){
			$("#fom").attr("action","/xmgl/servlet/clientServlet?methodName=queryClNa");
		});
		$("#tian").click(function (){
			$("#fom").attr("action","/xmgl/files/kehu.jsp");
		});
	});
	
</script>
<body>

<form  name="fom" id="fom" method="post" action=''>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="/xmgl/images/nav04.gif">

          </td>
        </tr>
    </table>
   </td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户详细列表 &nbsp;</td>
                    </tr>
                    <tr>
					 <td width="12%" height="20" align="center" bgcolor="#EEEEEE">公司名称</td>
                     <td width="7%" align="center" bgcolor="#EEEEEE">联系人</td>
                     <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                     <td width="14%" align="center" bgcolor="#EEEEEE">联系地址</td>
					 <td width="28%" align="center" bgcolor="#EEEEEE">公司背景</td>
					 <td width="10%" align="center" bgcolor="#EEEEEE">添加时间</td>
                    </tr>
                    <c:forEach items="${requestScope.customer}" var="c">
                        <tr>
					    <td height="20" bgcolor="#FFFFFF">${c.cname}</td>
                        <td bgcolor="#FFFFFF">${c.clxr}</td>
                        <td height="20" bgcolor="#FFFFFF">${c.ctel}</td>
                        <td bgcolor="#FFFFFF">${c.caddress}</td>
                        <td bgcolor="#FFFFFF">${c.cbj}</td>
                        <td bgcolor="#FFFFFF">${c.catime}</td>
                        </tr>
                    </c:forEach>     
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="/xmgl/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">1</span> 页 | 第 <span class="right-text09">1</span> 页</td>
                <td width="49%" align="right">[<a href="/xmgl/servlet/clientServlet?methodName=queryClNa&clientname=万能电力&page=1" class="right-font08">首页</a>
                 | <a href="/xmgl/servlet/clientServlet?methodName=queryClNa&clientname=万能电力&page=1" class="right-font08">上一页</a> 
                 | <a href="/xmgl/servlet/clientServlet?methodName=queryClNa&clientname=万能电力&page=1" class="right-font08">下一页</a> 
                 | <a href="/xmgl/servlet/clientServlet?methodName=queryClNa&clientname=万能电力&page=1" class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr><input type='hidden' name='clientname' value="万能电力"/>
                      <td width="1%"><input id="page1" name="page" type="text" class="right-textfield03" size="1" /></td>
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
