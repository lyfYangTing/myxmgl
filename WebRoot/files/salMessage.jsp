<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'listMonthYuanGongGongZi.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统 by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<link href="/xmgl/css/css.css" rel="stylesheet" type="text/css" />
<link href="/xmgl/css/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.location.href = "gz.do?op=load"; 
}
function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}
function link1(){
   var p = document.getElementById("textfield3").value;
   var t = "${requestScope.util.totalPage}";
   if(p>t){
     alert("没有此页");
     document.getElementById("textfield3").value='1';
   } 
   if(p<t){
     document.getElementById("textfield3").value=p;
   }
   if(p<1){
      document.getElementById("textfield3").value='1';
   }
   if(p==""){
   	  alert("请输入");
   }
    fom.action="<%=basePath%>gz.do?op=queryAllGz&page="+p;
}

</SCRIPT>
<script type="text/javascript" src="/xmgl/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$("#chaxun").click(function(){
			form.action="gz.do?op=load";
			form.submit();
	});
}); 
</script>


  
 <body>
<form name="form" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="../images/nav04.gif"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="24"><img src="../images/ico07.gif" width="20" height="18" /></td>
            <td width="519">年份:
                <select name="nianfen" id="nianfen">
                  <option value="2007">2007</option>
                  <option value="2008">2008</option>
                  <option value="2009">2009</option>
                  <option value="2010">2010</option>
                  <option value="2011" selected="selected">2011</option>
                </select>
              &nbsp;&nbsp;
              月份:
              <select name="yuefen" id="yuefen">
                        <option value="1" selected="selected">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                      </select>
              &nbsp;&nbsp;
                      <input name="Submit" type="button" id="chaxun" class="right-button02"   value="查询" /></td>
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
                	<td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 员工月工资列表 &nbsp;
                    </td>
            	</tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">序列</td>
                    <td width="8%" height="20" align="center" bgcolor="#EEEEEE">员工姓名</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">年份</td>
                     <td width="10%" align="center" bgcolor="#EEEEEE">月份</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">总工资</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">扣除工资</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">实发工资</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">状态</td>
                    <td width="13%" align="center" bgcolor="#EEEEEE">发款人</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">操作<br></td>
                 </tr>
                   
                    <c:forEach items = "${requestScope.util.list}"  var = "gz"> 
                  <tr id="${gz.gid}">
				    <td bgcolor="#FFFFFF"><div align="center">${gz.gid}</div></td>
                    <td height="20" bgcolor="#FFFFFF"><div align="center">${gz.uname }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                    ${gz.year }</div></td>
                     <td bgcolor="#FFFFFF"><div align="center">
                    ${gz.month }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                    ${gz.ubasepay}
				    </div></td>
                    <td bgcolor="#FFFFFF"><div align="center">${gz.gkouChu }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                   	${gz.ubasepay-gz.gkouChu}</div></td>
                    <td bgcolor="#FFFFFF"><div align="center" class="top-font01">
                    ${gz.state }</div></td>
                    <td bgcolor="#FFFFFF"><div align="center"><c:if test = "${sessionScope.user.uname=='李易峰' }">${sessionScope.user.uname }</c:if></div></td>
                    <td bgcolor="#FFFFFF"><div align="center">
                    <a href="gz.do?op=loadGz&gid=${gz.gid }">查看</a>|
                    <c:if test = "${gz.state=='未发放'}"><a href ="gz.do?op=sendGz&gid=${gz.gid }">发放</a></c:if>
                    </div>
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
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">
				第 <span class="right-text09">${param.page}</span> 页 | 
				共<span class="right-text09">${requestScope.util.totalPage}</span> 页
				| <span class="right-text09">${requestScope.util.count}</span>条记录</td>
			<td width="49%" align="right">
				[
				<a href="<%=basePath%>gz.do?op=queryAllGz&page=1" class="right-font08">首页</a> |
				<a href="<%=basePath%>gz.do?op=queryAllGz&page=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">上一页</a> |
				<a href="<%=basePath%>gz.do?op=queryAllGz&page=${requestScope.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">下一页</a> |
				<a href="<%=basePath%>gz.do?op=queryAllGz&page=${requestScope.util.totalPage }" class="right-font08">末页</a>] 转至：
			</td>
               <td width="1%">
					<table width="20" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="1%">
								<input id="textfield3" type="text" name="page"
									class="right-textfield03" size="1" />
							</td>
							<td width="87%">
								<input name="Submit23222" type="submit"
									class="right-button06" value="" onClick="link1();"/>
							</td>
						</tr>
					</table>
				</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
