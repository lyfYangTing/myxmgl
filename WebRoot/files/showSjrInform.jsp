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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>

<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript">

  
$(document).ready(function(){
 $("#cha").click(function(){
     	$("#fom").attr("action","http://localhost:8080/xmgl/servlet/listtakexiaoxiServlet?methodName=chashijian&s=2&curPage=1");
     });
	$("#link1").click(function(){
		 var p = $("#textfield3").val();
        
         if(!/^[1-9][0-9]*$/.test(p)){
  				alert("���������֣�");
  				return false;
  		}
		if(p>"${requestScope.util.totalPage}"){
			alert("������Χ");
			return false;
		}
		
		if(p<1){
		   alert("������Χ");
		   return false;
		}
		 $("#fom").attr("action","<%=basePath%>/messageServlet.do?op=showAllUserInform&caozuo=sjr&page="+p);
	});
	
	 $("#quanxuan").click(function (){
		      $(":checkbox").attr("checked","checked");
     });
     
      $("#fanxuan").click(function (){
        var s = $(":checkbox").length;
       	 for(var i=0;i<s;i++){
       	 	if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
       	 		$(":checkbox:eq("+i+")").removeAttr("checked");
       	 		
       	 	}else {
       	 		 $(":checkbox:eq("+i+")").attr("checked","checked");
       	 	}
       	 }
		   
     });
     
     $("#link").click(function(){
        $("#fom").attr("action","<%=basePath%>/userServlet.do?op=getAllUsers&caozuo=sjr");
     });
     
     $("#linkdel").click(function(){
     	var size = $(":checkbox").length;
			var obj1 = document.getElementsByName("world");
			for (var i=0;i<size;i++){	
				if($(":checkbox:eq("+i+")").attr("checked")=="checked"){
					$(".hel:eq("+i+")").attr("value","yes");
				}else{
					$(".hel:eq("+i+")").attr("value","no");
				}
			}
	    	 $("#fom").attr("action","<%=basePath %>/messageServlet.do?op=deleteSomeInform&caozuo=sjr");
     });

});




function linkdel(){
	var obj = document.getElementsByName("delid");
	var obj1 = document.getElementsByName("world");
	alert(1);
	for (var i=0;i<obj.length;i++){
		if (obj[i].checked == true){
			obj1[i].value="yes";
		}else{
			obj1[i].value="no";
		}
	}
	//ɾ������ѡ�е���Ϣ
	document.getElementById("fom").action="<%= basePath%>/infoServlet.do?op=deleteAllInfo&caozuo=2";
	document.getElementById("fom").submit();
}



function on_load(){
	var loadingmsg=document.getElementById("loadingmsg");
	var mainpage=document.getElementById("mainpage");
	loadingmsg.style.display="";
	mainpage.style.display="none";
	
	loadingmsg.style.display="none";
	mainpage.style.display="";
}
</script>

<script type="text/JavaScript">
		var dx,dy;
		var dx=(screen.height/2-105)+"";
	   	var dy=(screen.width/2-200)+"";
	   	$(document).ready(function (){
	   		$("#find").click(function(){
	   			var returnv=window.showModalDialog("http://localhost:8080/xmgl/files/listxiaoxisousuo.jsp","�߼���ѯ","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			//var returnv=window.open("http://localhost:8080/xmgl/files/listrenwusousuo.jsp","�߼���ѯ","dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=190px;dialogWidth=480px;help=no;fullscreen=1;status=no;center=yes");
	   			
	   			if(returnv != undefined){
	   				$("#fom").attr("action","http://localhost:8080/xmgl/servlet/listtakexiaoxiServlet?methodName=glistallxiaoxi&curPage=1&s=2"+returnv);
	   			}
	   		});
	   	});
</script>


</head>



<body onload="on_load()">
<form name="fom" id="fom" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="<%=basePath %>/images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="21"><img src="<%=basePath %>/images/ico07.gif" width="20" height="18" /></td>
			<td width="550">�鿴���ݣ���ʱ�䣺
			 <input name="t1" type="text" size="12" /><span class="newfont06">��</span>
			 <input name="t2" type="text" size="12" />	
			 <input name="Submit" type="submit" class="right-button02" value="�� ѯ" id='cha' />
			 <span  class="red">��ʽ��(yyy-mm-dd)</span>
			 </td>
			 <td width="132" align="left"><a href="#" onclick="sousuo()">
			   <input name="Submit" type="submit" class="right-button07" value="�߼�����" id='find'/></a></td>	
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
               <td height="20"><span class="newfont07">ѡ��<a href="#" class="right-font08" id="quanxuan" >ȫѡ</a>-<a href="#" class="right-font08" id="fanxuan">��ѡ</a></span>
	              <input name="Submit" type="submit" class="right-button08" value="ɾ����ѡ��Ϣ" id="linkdel"/>
	              <input name="Submit2" type="submit" class="right-button08" value="�½���Ϣ" id="link"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ռ���Ϣ�б� &nbsp;</td>
                    </tr>
                  <tr>
				    <td width="14%" align="center" bgcolor="#EEEEEE">ѡ��</td>
                    <td width="19%" height="20" align="center" bgcolor="#EEEEEE">����</td>
                    <td width="20%" align="center" bgcolor="#EEEEEE">������</td>
                    <td width="21%" align="center" bgcolor="#EEEEEE">�鿴ʱ��</td>
                    <td width="26%" align="center" bgcolor="#EEEEEE">����</td>
                  </tr>
                   
                   <c:forEach items = "${requestScope.util.list}" var = "sendInfo">
                   		<tr>
                   			<td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                   			<td height="20" bgcolor="#FFFFFF">${sendInfo.ititle}</td>
                   			<td bgcolor="#FFFFFF">${sendInfo.isjr}</td>
                   			<td bgcolor="#FFFFFF">${sendInfo.ictime}</td>
                    		<td bgcolor="#FFFFFF"><a href="<%=basePath %>/messageServlet.do?op=deleteOneInform&caozuo=sjr&id=${sendInfo.iid }">ɾ��</a>|<a href="<%=basePath %>/messageServlet.do?op=showOneInform&caozuo=sjr&id=${sendInfo.iid }">�鿴</a>
                    		 <input type='hidden' name='hello' id="hello" value='${sendInfo.iid}'> 
                			 <input type='hidden' class='hel' name='world' id="world"></td>
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
                
                <td width="50%">�� <span class="right-text09">${requestScope.curpage}</span> ҳ | �� <span class="right-text09">${requestScope.util.totalPage }</span> ҳ | <span class="right-text09">${requestScope.util.count }</span>����¼</td>
                <td width="49%" align="right">
                [<a href="<%=basePath %>/messageServlet.do?op=showAllUserInform&caozuo=sjr&page=1" class="right-font08">��ҳ</a> |
                 <a href="<%=basePath %>/messageServlet.do?op=showAllUserInform&caozuo=sjr&page=${requestScope.curpage>1?requestScope.curpage-1:1}" class="right-font08">��һҳ</a> |
                 <a href="<%=basePath %>/messageServlet.do?op=showAllUserInform&caozuo=sjr&page=${requestScope.curpage<requestScope.util.totalPage?requestScope.curpage+1:requestScope.util.totalPage}" class="right-font08">��һҳ</a> | 
                 <a href="<%=basePath %>/messageServlet.do?op=showAllUserInform&caozuo=sjr&page=${requestScope.util.totalPage}" class="right-font08">ĩҳ</a>] ת����
                </td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="textfield3" name="page" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" id="link1" value=" "  />
                      
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
	<img src="file:///F|/��Ŀ�����������/��Ŀ����ϵͳҳ��/images/loadon.gif" />
</div>

</body>
</html>
