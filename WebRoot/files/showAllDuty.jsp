<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'listzhiwu.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>
<link href="<%=basePath %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
</head>
<SCRIPT language=JavaScript>
function sousuo(){
	window.open("gaojisousuo.jsp","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
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

function link(){
    document.getElementById("fom").action="<%=basePath%>/dutyServlet.do?op=getAllDuty&caozuo=insert";
   document.getElementById("fom").submit();
}
//
function link1(){
   var p = document.getElementById("textfield3").value;
   var t = "${requestScope.util.totalPage}";
   if(p>t){
   	 alert("û�д�ҳ");
     document.getElementById("textfield3").value='1';
   } 
   if(p<t){
     document.getElementById("textfield3").value=p;
   }
   if(p<1){
      document.getElementById("textfield3").value='1';
   }
   if(p==""){
   	  alert("������");
   }
    fom.action="<%=basePath%>/dutyServlet.do?op=showOnePageDuty&curpage="+p;
}

function on_load(){
	var loadingmsg=document.getElementById("loadingmsg");
	var mainpage=document.getElementById("mainpage");
	loadingmsg.style.display="";
	mainpage.style.display="none";
	loadingmsg.style.display="none";
	mainpage.style.display="";
}

//ɾ��һ��
function deleteOne(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	for (var i=0;i<obj.length;i++){
		if (obj[i].checked == true){
			obj1[i].value="yes";
		}else{
			obj1[i].value="no";
		}
	}
	document.getElementById("fom").action="<%=basePath%>/dutyServlet.do?op=deleteDuty";
	document.getElementById("fom").submit();
}

</SCRIPT>
  
 <body>

<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="../images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="24">&nbsp;</td>
			  <td width="519">&nbsp;</td>
			  <td width="679" align="left"><a href="#" onclick="sousuo()"></a></td>	
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">ѡ��
               <a href="#" class="right-font08" onclick="selectAll();">ȫѡ</a>-
               <a href="#" class="right-font08" onclick="unselectAll();">��ѡ</a></span>
	              <input name="Submit" type="button" class="right-button08" value="ɾ����ѡְλ��Ϣ" onclick="deleteOne();"/>
	              <input name="Submit2" type="button" class="right-button08" value="���ְλ" onclick="link();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="4" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ְλ�б� &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">ѡ��</td>
                    <td width="21%" height="20" align="center" bgcolor="#EEEEEE">ְλ����</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">��ע</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">����</td>
                  </tr>
                  <c:forEach items="${requestScope.util.list }" var="duty">
                    <tr>
				    <td bgcolor="#FFFFFF">
				    <input type="checkbox" name="delid" value="${duty.did }" />
					<input type="hidden"  name="hello"  value="${duty.did }">
                 	<input type="hidden"  name="world" ></td>
                    <td height="20" bgcolor="#FFFFFF">${duty.dname}</td>
                    <td bgcolor="#FFFFFF">${duty.dtext}</td>
                    <td bgcolor="#FFFFFF"><a href="<%=basePath %>/dutyServlet.do?op=getAllDuty&caozuo=update&did=${duty.did}">�༭</a>ح<a href="<%=basePath %>/dutyServlet.do?op=getOneDuty&caozuo=cha&did=${duty.did }">�鿴</a>
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
                <td width="50%">�� <span class="right-text09">${requestScope.util.curpage}</span> ҳ |
                	 ��<span class="right-text09">${requestScope.util.totalPage }</span> ҳ| 
                <span class="right-text09">${requestScope.util.count }</span>����¼</td>
                <td width="49%" align="right">
                <a href="<%=basePath%>/dutyServlet.do?op=showOnePageDuty&curpage=1" class="right-font08">��ҳ</a> | 
                <a href="<%=basePath%>/dutyServlet.do?op=showOnePageDuty&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">��һҳ</a> | 
                <a href="<%=basePath%>/dutyServlet.do?op=showOnePageDuty&curpage=${requestScope.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">��һҳ</a> | 
                <a href="<%=basePath%>/dutyServlet.do?op=showOnePageDuty&curpage=${requestScope.util.totalPage}" class="right-font08">ĩҳ</a>] ת����</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="textfield3" name="page" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="" onclick="link1();"/>
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
