<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb18030" />
<title>��Ŀ����ϵͳ </title>

<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>jquery.js"></script>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://localhost:8080/xmgl/jquery.js"></script>
<script type="text/javascript">
  	
  	$(document).ready(function (){
  		
  		$("#goto").click(function(){
  			var curPage=$("#gotot").val();
  			if(!/^[1-9][0-9]*$/.test(curPage)){
  				alert("���������֣�");
  				return false;
  			}
			if(curPage <0 || curPage > "1"){
				alert("������ֲ���ȷ��");
				return false;
			}
			if(curPage==""){
				alert("�����룡");
				return false;
			}
  			$("#fom").attr("action","http://localhost:8080/xmgl/servlet/privateControlServlet?methodName=seeWorkInfo&curPage="+curPage+"&flag=1");
  		});
  		$("#begjh").click(function(){
  			var jno=$("#begjh").attr("name");
  			//alert(jno);
  			var path='http://localhost:8080/xmgl/servlet/privateControlServlet?methodName=zhixingWork';
  			$.post(path,{jno:jno});
  			$("#begjh").val("�ѿ�ʼ");
  			$("#begjh").attr("disabled","disabled");
  		});
  	});
  
  </script>
<script type="text/JavaScript">
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var path="http://localhost:8080/xmgl/files/listrenwusousuo.jsp";
	   			var returnv=window.showModalDialog(path,"�߼���ѯ","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			//var returnv=window.open("http://localhost:8080/xmgl/files/listrenwusousuo.jsp","�߼���ѯ","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			//alert(returnv);
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/privateControlServlet?methodName=chaxunWorkInfo&curPage=1"+returnv);
	   			}
	   		});
	   		$("#find0").click(function(){
	   			//alert("hello");
	   				var text1=$("#text1").val();
	   				var text2=$("#text2").val();
	   				//alert(text1+text2);
	   				//alert(/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(text1));
	   				if(text1!=""&&!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(text1)){
						alert("��ʽ����ȷ��ӦΪyyyy-mm-dd");
						return;
					}
					if(text2!=""&&!/^([1-2]\d{3})-(0?[1-9]|10|11|12)-([1-2]?[0-9]|0[1-9]|30|31)$/.test(text2)){
						alert("��ʽ����ȷ��ӦΪyyyy-mm-dd");
						return;
					}
	   				
	   				var path="http://localhost:8080/xmgl/servlet/privateControlServlet?methodName=chaxunWorkInfo&curPage=1&jtitle=&mgrname=&kehuname=&jmission=&createdatebegin="+text1+"&createdateend="+text2;
	   				//alert(path);
	   				$("#fom").attr("action",path);
	   		});
	   	});
</script>
</head>
<body>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="<%=basePath %>/images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="<%=basePath %>/images/ico07.gif" width="20" height="18" /></td>
			 <td width="538">�鿴���ݣ�&nbsp;��ʱ�䣺
				<input name="textfield" type="text" size="12" id='text1'/>
				<span class="newfont06">��</span>
				<input name="textfield" type="text" size="12" id='text2'/>
				<input name="Submit4" type="submit" class="right-button02" id='find0' value="�� ѯ" /></td>
			   <td width="144" align="left">
			     <input name="Submit3" type="submit" class="right-button07" id='find' value="�߼�����"  />
			  </td>	
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="7" align="center" style="font-size:16px;">����������Ϣ�б�</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
                    <td width="10%">�������</td>
					<td width="10%">����ʱ��</td>
                    <td width="10%">������</td>
					<td width="10%">ִ����</td>
					<td width="5%">���ȼ�</td>
					<td width="6%">����</td>
                  </tr>
                  
                  	<c:forEach items="${requestScope.util.list }" var="plan">
                  	    <tr bgcolor="#FFFFFF">
                        <td>${plan.ppName }</td>
					    <td>${plan.ppsCreateTime }</td>
                        <td>${plan.progn.xmglPromk.xmglProxq.xmglProjb.xmglUser.uname }</td>
                        <td>${plan.user.uname }</td>
                        <td>${plan.ppYxj }</td>
                        <td><a href="<%=basePath%>/projhServlet.do?op=getOneProjh&caozuo=rwlb&ppid=${plan.ppId}">�鿴</a>
		                <input type='submit' id='begjh' name='3' value='��ʼִ��'/></td>
                        </tr>
                  	</c:forEach>

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
                <td width="50%">��<span class="right-text09">${requestScope.util.curpage }</span>ҳ
               |��<span class="right-text09">${requestScope.util.totalPage}</span>ҳ 
               | <span class="right-text09">${requestScope.util.count}</span>����¼</td>
                <td width="49%" align="right">
                 [ <a href="<%=basePath%>/projhServlet.do?op=showMyRenwu&curpage=1" class="right-font08">��ҳ</a>
                 | <a href="<%=basePath%>/projhServlet.do?op=showMyRenwu&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">��һҳ</a>
                 | <a href="<%=basePath%>/projhServlet.do?op=showMyRenwu&curpage=${requestScope.util.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">��һҳ</a>
                 | <a href="<%=basePath%>/projhServlet.do?op=showMyRenwu&curpage=${requestScope.util.totalPage}" class="right-font08">ĩҳ</a>] ת����</td>
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
</td>
</tr>
</table>
</form>
</body>
</html>
