<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'listchengbenxinxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=basePath %>//css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>//css/style.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/jquery.js"></script>

</head>
<script type="text/JavaScript">	
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("http://localhost:8080/xmgl/files/gaojisouxiangmu.jsp","�߼���ѯ","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/XiangMuServlet?methodName=gaoJiCha"+returnv);
	   			}
	   		});
	   	});
	   	
</script>
<SCRIPT language=JavaScript>

$(document).ready(function (){
	
		//ȫѡ
		$("#allselect").click(function(){
		//alert($("#allselect"));
			 $(":checkbox").attr("checked","checked");
		});
		
		//��ѡ
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
	var r=confirm("ȷ��ɾ����");
	if (r==true)
  	{
  		document.getElementById("fom").action="<%=basePath%>/projbServlet.do?op=deleteProjb&tz=cost";
		document.getElementById("fom").submit();
  	}else{
  		return;
 	 }
	
}


</SCRIPT>
 <script type="text/javascript">
  	
  	$(document).ready(function (){
  		
  		//��ҳ
  		$("#gog").click(function(){
  			var curPage=$("#ij").val();
  			if(!/^[0-9]*$/.test(curPage)){
  				alert("���������֣�");
  				return false;
  			}
  			if(parseInt(curPage,10)<1){
  				aler(curPage);
  				curPage=1;
  			}
  			$("#fom").attr("action","<%=basePath%>/projbServlet.do?op=showOnePageProjb&tz=cost&curpage="+curPage);
  		});
  		
  		//�����Ŀ
  		$("#add").click(function(){
  			$("#fom").attr("action","<%=basePath%>/projbServlet.do?op=getCustomerAndUsers&tz=cost&caozuo=insert");
  			$("#fom").submit();
  		});
  		
  		//�ɱ���Ϣ��Ŀ��ѯ(����Ŀ���Ʋ�ѯ)
  		$("#chaxun").click(function(){
  		alert("111");
  			var proname=$("#proname").val();
  			alert(proname);
  			$("#fom").attr("action","<%=basePath%>/projbServlet.do?op=getOneProjb&caozuo=cha");
   			$("#fom").submit();
  		});
  	});
  </script>

<body>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="21"><img src="<%=basePath %>images/ico07.gif" width="20" height="18" /></td>
			<td width="550">�鿴���ݣ� ����Ŀ���ƣ�
             <input name="proname" id='proname' type="text" value="" size="12" />
             <input type="hidden" name="proname" id='proname' type="text" value="" size="12" />	
			 <input name="chaxun" type="submit" class="right-button02" id='chaxun' value="�� ѯ" /></td>
			 <td width="132" align="left"><a href="#" onclick="sousuo()">
			    <input name="Submit" type="submit" class="right-button07" id='find' value="�߼�����" /></a></td>	
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
              <td height="20"><span class="newfont07">ѡ��<input type="button" class="right-button02" value="ȫѡ" id='allselect'>-<input type="button" class="right-button02"  value="��ѡ" id='fanselect'></span>
	              <input name="Submit" type="button" class="right-button08" value="ɾ����ѡ��Ŀ��Ϣ" onclick="linkdel();" />
	              <input name="Submit2" id="add"  type="button" class="right-button08" value="�����Ŀ" /></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="13" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ɱ���Ϣ�б� &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="4%" align="center" bgcolor="#EEEEEE">ѡ��</td>
                    <td width="10%" height="20" align="center" bgcolor="#EEEEEE">��Ŀ����</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">��λ</td>
                    <td width="9%" align="center" bgcolor="#EEEEEE">��Ŀ�ܽ��</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">��Ŀ������</td>
                    <td width="9%" align="center" bgcolor="#EEEEEE">��Ŀ��������</td>
                    <td width="7%" align="center" bgcolor="#EEEEEE">�ɱ���֧��</td>
                    <td width="7%" align="center" bgcolor="#EEEEEE">��ʼʱ��</td>
                    <td width="7%" align="center" bgcolor="#EEEEEE">�ƻ����ʱ��</td>
					<td width="7%" align="center" bgcolor="#EEEEEE">ʵ�����ʱ��</td>
                    <td width="7%" align="center" bgcolor="#EEEEEE">�������ȼ�</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">���״̬</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">����</td>
                  </tr>
                  
                  <c:forEach items = "${requestScope.util.list}" var = "projb">
                  	<tr align = "center">
                  		<td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                  		<td height="20" bgcolor="#FFFFFF"><a href="<%=basePath%>/projbServlet.do?op=getOneProjb&caozuo=cha&pjid=${projb.pjId}">${projb.pjName}</a></td>
                  		<td bgcolor="#FFFFFF">${projb.xmglCustomer.cname}</td>
                  		<td bgcolor="#FFFFFF">${projb.pjMoney}</td>
                    	<td bgcolor="#FFFFFF">${projb.xmglUser.uname}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjDeveloperTotal}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjSjzcb}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjSjkfTime}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjWcdate}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjSjwcTime}</td>
                    	<td bgcolor="#FFFFFF">${projb.pjYxj}</td>
                        <td bgcolor="#FFFFFF">${projb.pjState}</td>
                        <td bgcolor="#FFFFFF">
                        <a href="<%=basePath%>/projbServlet.do?op=getCustomerAndUsers&tz=cost&caozuo=update&pjid=${projb.pjId}">�༭</a>
                       	|<a href="<%=basePath%>/projbServlet.do?op=getOneProjb&caozuo=cha&pjid=${projb.pjId}">�鿴</a></td>
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
          <td height="33">
		  <table width="100%" border="0" align="center" cellpadding="0" 
		  		cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">�� <span class="right-text09">${requestScope.util.curpage }</span> ҳ 
                | �� <span class="right-text09">${requestScope.util.totalPage}</span> ҳ 
                | <span class="right-text09">${requestScope.util.count}</span>����¼</td>
                <td width="49%" align="right">
                 [ <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&tz=cost&curpage=1" class="right-font08">��ҳ</a>
                 | <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&tz=cost&curpage=${requestScope.util.curpage>1?requestScope.util.curpage-1:1}" class="right-font08">��һҳ</a>
                 | <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&tz=cost&curpage=${requestScope.curpage<requestScope.util.totalPage?requestScope.util.curpage+1:requestScope.util.totalPage}" class="right-font08">��һҳ</a>
                 | <a href="<%=basePath%>/projbServlet.do?op=showOnePageProjb&tz=cost&curpage=${requestScope.util.totalPage}" class="right-font08">ĩҳ</a>] ת����</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                       <td width="1%"><input id="ij"  type="text" class="right-textfield03" size="1" /></td>
                       <td width="87%"><input name="gog" id='gog' type="submit" class="right-button06" value=" " />
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table>
		 </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
