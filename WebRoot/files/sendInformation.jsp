<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ŀ����ϵͳ by www.eyingda.com</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">
/*
function tishi()
{
  var a=confirm('���ݿ��б����и���Ա������Ϣ���������޸Ļ�������Ϣ��');
  if(a!=true)return false;
  window.open("��ͻҳ.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}

function check()
{
document.getElementById("aa").style.display="";
}
*/
</script>
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>
<script type="text/javascript">
   var index=0;
	$(document).ready(function(){
		 $("#fid1").click(function(){
		        var s =$("#divid").val();
				if(s.length==0){
				    alert("���ⲻ��Ϊ��");
				    return false;	
				}else if(s.length>10||s.length<3){
					alert("����3��10λ֮��");
					return false; 
				}else{
				    var b = $("#name3").val();
		            if(b!=""){
		        	    $("#form").attr("action","<%=basePath%>/messageServlet.do?op=sendMessage&caozuo=sfjr");
		            }else {
		        	    alert("������д������Ϣ");
		        	    return false;
		            }
				}
		 });
	});
		
	function xuan(){
		$(document).ready(function (){
			//����������һ����ͬ���ˣ���ȡ��
			$("#name").val($("#name1").val());
				$("#name3").val(
				/*
					name1�����б�id
					find()�ж�option�����Ƿ�ѡ��
					.text()���ѡ�л�ȡ�ı����ݣ���<oprtion></option>֮�������
				*/
					$("#name1").find("option:selected").text()
				)
		});
	}
</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
<script language="JavaScript" type="text/javascript">
  var s = '';
  if(s !=""){
  	 var s = '';
     alert(s);
  }
 
</script>
  
  <form action="" method="post"  name="form" id='form'>
  <input type="hidden" value="1479081734573" name="token">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >�½���Ϣ</th>
  </tr>
  <tr>
    
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>�½���Ϣ</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					    
					    
					  <tr>
					    <td nowrap align="right" width="11%">��Ϣ����:</td>
					    <td width="27%"><input name='biaoti' type="text" class="text" style="width:154px" value="" id='divid'/>

					    </td>
				        	
					    <td align="right" width="25%">&nbsp;</td>
					    <td width="37%">&nbsp;</td>
					    </tr>
					  <tr>
                               <td width="11%" align="right" nowrap>������:</td>
									    <td colspan="3">
									    
									    <input type='text' name='name3' id='name3' class='text' style="width:154px;height:20px;left=150" disabled='disabled'>
									    <input type='hidden' name='name' id='name' class='text' style="width:154px;height:20px;left=150" >
									          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										      </td>
					   </tr>	
					  
					  <tr>
					    <td  width="11%" nowrap align="right">��Ϣ����:</td>
					    <td colspan="2"><textarea name="textarea" cols="100" rows="20" id='textarea'></textarea>
					    	
					    </td>
					    <td><table>
					    		<tr>
					    			<td>��ѡ������ߣ�</td>
					    		</tr>
					    		<tr>
					    			<td><select  multiple="multiple" size="18" name="name1" id='name1' onchange='xuan();' style='width:174px;left:0px'>
											
										 <c:forEach items="${requestScope.list }" var="u">
										     <c:if test="${sessionScope.user.uid!=u.uid }">
										          <option value='${u.uid}'>${u.uname}&nbsp;</option>
										     </c:if>
										 </c:forEach>
										</select></td>
					    		</tr></table></td>									   
					    </tr>
					  </table>
			  <br />
				</fieldset>			</TD>
		</TR>
		</TABLE>
	<table>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" value="����" class="button" id='fid1'/>��
			 
			<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</table>

</div>
</form>
</body>
</html>
