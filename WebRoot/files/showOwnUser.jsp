<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb18030" />
<title>��Ŀ����ϵͳ </title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/jquery.js"></script>


<script>
	var index=0;
	function yanzheng(n){
 			//alert("dsf");
 			
 			$(document).ready(function (){
 			
 				if(n=='1'){
 					var pas=$("#ppassword").val();
 					//alert(pas.length);
 					if(pas.length>10){
 						if($("#d1").html()==""){
 							index++;
 						}
 						$("#d1").html("<font color='red'>���볤�����Ϊ10λ��</font>");
 						
 					}else if(pas.length==0){
 						if($("#d1").html()==""){
 							index++;
 						}
 						$("#d1").html("<font color='red'>���벻��Ϊ�գ�</font>");
 					}else{
 						if(index>0&&$("#d1").html()!=""){
 							index--;
 						}
 						$("#d1").html("<font color='#07925E'>������ã�</font>");
 						
 					}
 				}else if(n=='2'){
 					var emai=$("#pemail").val();
 					//alert(emai.length);
 					if(emai.length>30){
 						if($("#d2").html()==""){
 							index++;
 						}
 						$("#d2").html("<font color='red'>�����ַ���30λ��</font>");
 						
 					}else{
 						if(index>0&&$("#d2").html()!=""){
 							index--;
 						}
 						$("#d2").html("");
 						
 					}
 				}else if(n=='3'){
 					var tel=$("#ptelephone").val();
 					if(tel.length>15){
 						if($("#d3").html()==""){
 							index++;
 						}
 						$("#d3").html("<font color='red'>��ϵ�绰���15λ��</font>");
 					}else if(!/^[0-9]*$/.test(tel)){
 						if($("#d3").html()==""){
 							index++;
 						}
 						$("#d3").html("<font color='red'>��ϵ�绰����Ϊ�����֣�</font>");
 					}else{
 						if(index>0&&$("#d3").html()!=""){
 							index--;
 						}
 						$("#d3").html("");
 						
 					}
 				}else if(n=='4'){
 					var add=$("#paddr").val();
 					if(add.length>15){
 						if($("#d4").html()==""){
 							index++;
 						}
 						$("#d4").html("<font color='red'>��ס��ַ���15λ��</font>");
 					}else{
 						if(index>0&&$("#d4").html()!=""){
 							index--;
 						}
 						$("#d4").html("");
 					}
 				}else if(n=='5'){
 					var pb=$("#pbankName").val();
 					if(pb.length>10){
 						if($("#d5").html()==""){
 							index++;
 						}
 						$("#d5").html("<font color='red'>�����������10λ��</font>");
 					}else{
 						if(index>0&&$("#d5").html()!=""){
 							index--;
 						}
 						$("#d5").html("");
 					}
 				}else if(n=='6'){
 					var pbu=$("#pbankuser").val();
 					//alert(pbu);
 					if(pbu.length>30){
 						if($("#d6").html()==""){
 							index++;
 						}
 						$("#d6").html("<font color='red'>�����˻����10λ��</font>");
 					}else if(!/^[0-9]*$/.test(pbu)){
 						if($("#d6").html()==""){
 							index++;
 						}
 						if(pbu.length!=0){
 							$("#d6").html("<font color='red'>�����˻�����Ϊ�����֣�</font>");
 						}
 					}else{
 						if(index>0&&$("#d6").html()!=""){
 							index--;
 						}
 						$("#d6").html("");
 					}
 				}else if(n=='7'){
 					var pde=$("#pdescription").text();
 					if(pde.length>150){
 						if($("#d7").html()==""){
 							index++;
 						}
 						$("#d7").html("<font color='red'>�����������150�֣�</font>");
 					}else{
 						if(index>0&&$("#d7").html()!=""){
 							index--;
 						}
 						$("#d7").html("");
 						
 					}
 				}
				//alert(index);
 			});
 		}
</script>
</head>

<body class="ContentBody">

  <script type="text/javascript">
  	
  	$(document).ready(function (){
  		
  		$("#saveb").click(function(){
  			//alert(index);
  			if(index==0){
  				$("#fom").attr("action","<%=path%>/userServlet.do?op=updateUser");
  			}else{
  				alert("������д����ȷ�����޸ģ�");
  			}
  			
  		});
  	});
  
  </script>
  <form  method="post"  name="form1" id='fom'>
		<div class="MainDiv">
			<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  				<tr>
      				<th class="tablestyle_title" >Ա��������Ϣ��ѯ</th>
  				</tr>
 				 <tr>
   					 <td class="CPanel">
					 <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
						<tr>
							<td align="left"><br /></td>
						</tr>
				 		<tr>
							<td width="100%">
							<fieldset style="height:100%;">
							<legend>Ա����Ϣ</legend>
					  		<table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  		<tr>
					    		<td align="right" width="15%">Ա��Ψһ���:</td>
					    		<td width="35%"><input name='pno1' type="text" class="text" style="width:154px" disabled='disabled' value="${sessionScope.user.uid }" />
				        					<input name='uuid' type="hidden" class="text" style="width:154px"  value="${sessionScope.user.uid }" />
				        		<span class="red">*</span></td>
					   		    <td width="16%" align="right" nowrap="nowrap">����:</td>
					   		    <td width="17%"><input type='password' class="text" id='ppassword' name='ppassword' onblur='yanzheng("1")' style="width:154px" value="${sessionScope.user.upassword }"/></td><td width='17%'><div id='d1'></div></td>
					 	    </tr>
					    
					    
						  <tr>
						    <td nowrap="nowrap" align="right">��ʵ����:</td>
						    <td><input class="text" name='pname1' style="width:154px" disabled='disabled' value="${sessionScope.user.uname }"/>
						    <input class="text" type='hidden' name='pname' style="width:154px"  value="${sessionScope.user.uname }"/></td>
						    <td align="right">�Ա�:</td>
						    <td><input class="text" name='psex1' style="width:154px" disabled='disabled' value="${sessionScope.user.usex==0 ? '��' : 'Ů' }"/>
						    	<input class="text" type='hidden' name='psex' type='hidden' value="${sessionScope.user.usex }"/></td>
						  </tr>
					  
						  
						  <tr>
						    <td align="right">��������:</td>
						    <td><input class="text" name='pbirthday1' style="width:154px" disabled='disabled' value="${sessionScope.user.ubirthday }"/>
						    <input class="text" name='pbirthday'  type='hidden' style="width:154px" value="${sessionScope.user.ubirthday }"/></td>
						    <td align="right">���֤����:</td>
						    <td><input class="text" name='pid1' style="width:154px" disabled='disabled' value="${sessionScope.user.uIDcard }"/>
						    <input class="text" name='pid' type='hidden' style="width:154px"  value="${sessionScope.user.uIDcard }"/></td>
						  </tr>
						  <tr>
						    <td align="right">��������:</td>
						    <td><table><tr><td><input class="text" name='pemail' id='pemail' style="width:154px" onblur='yanzheng("2")' value="${sessionScope.user.uemail } "/></td><td><div id='d2'></div></td></tr></table></td>
						    <td align="right">�绰����:</td>
						    <td><input class="text" name='ptelephone' id='ptelephone' onblur='yanzheng("3")' style="width:154px" value="${sessionScope.user.utelephone }"/></td><td><div id='d3'></div></td>
						  </tr>
						  <tr>
						    <td align="right">��ס��ַ:</td>
						    <td><table><tr><td><input name="paddr" id='paddr'  onblur='yanzheng("4")' type="text" size="30" value="${sessionScope.user.uaddress }"/></td><td><div id='d4'></div></td></tr></table></td>
						    <td align="right">ְλ:</td>
						    <td><input class="text" name='zwname' style="width:154px" disabled='disabled' value="${sessionScope.user.duty.dname }"/>
						        <input type='hidden' name='zwno' value="${sessionScope.user.edid }"/></td>
						  </tr>
						  <tr>
						    <td align="right">Ա������:</td>
						    <td><input class="text" name='plei1' style="width:154px" disabled='disabled' value="${sessionScope.user.ustaffType==0 ? 'ʵϰ' : '��ְ'}"/>
						    	<input class="text" name='plei' type='hidden' value="${sessionScope.user.ustaffType }"/></td>
						    <td align="right">��������:</td>
						    <td><input class="text" name='pbankName' id='pbankName' onblur='yanzheng("5")' style="width:154px" value="${sessionScope.user.ubank }"/>
						    </td><td><div id='d5'></div></td>
						  </tr>
						  <tr>
						    <td align="right">�����˻�:</td>
						    <td><table><tr><td><input class="text" name='pbankuser' id='pbankuser' onblur='yanzheng("6")' style="width:154px" value="${sessionScope.user.ubankAccount }"/></td><td><div id='d6'></div></td></tr></table></td>
						    <td align="right">��������:</td>
						    <td><input class="text" name='pfsalary' style="width:154px" disabled='disabled' value="${sessionScope.user.ubasePay }"/>
						    <input class="text" name='pfsalary' type='hidden' style="width:154px"  value="${sessionScope.user.ubasePay }"/></td>
						  </tr>
						  <tr>
						    <td align="right">����:</td>
						    <td><input class="text" name='pgsalary1' style="width:154px" disabled='disabled' value="${sessionScope.user.ubonus }"/>
						    <input class="text" name='pgsalary' type='hidden' style="width:154px"  value="${sessionScope.user.ubonus }"/></td>
						    <td align="right">����������:</td>
						    <td><input class="text" name='posalary' style="width:154px" disabled='disabled' value="${sessionScope.user.ubuzhujin }"/>
						    <input class="text" name='posalary' type='hidden' style="width:154px"  value="${sessionScope.user.ubuzhujin }"/></td>
						  </tr>
						  <tr>
						    <td align="right">��ְʱ��:</td>
						    <td><input class="text" name='pbydate' style="width:154px" disabled='disabled' value="${sessionScope.user.entryDate }"/>
						    <input class="text" name='pbydate' type='hidden' style="width:154px" value="${sessionScope.user.entryDate }"/></td>
						     <td align="right">��ǰ��ɫ:</td>
						    <td><input class="text" name='juename' style="width:154px" disabled='disabled' value="${sessionScope.user.role.roname }"/>
						         <input class="text" type='hidden' name='jueno' value="${sessionScope.user.uroid}"/></td>
						  
						     
						   </tr>
						   <tr>
						    <td align="right">�ϼ��쵼:</td>
						    <td> <input class="text" name='sjld' style="width:154px" disabled='disabled' value="${sessionScope.user.pname }"/>
						         <input class="text" type='hidden' name='sjldid' value="${sessionScope.user.upid }"/></td>
						    </tr>
						 
					  	  <tr>
						    <td align="right">����:</td>
						    <td colspan="3"><textarea name="pdescription" id='pdescription' onblur='yanzheng("7")'  cols="100" rows="8">${sessionScope.user.udescrible }</textarea></td><td><div id='d7'></div></td>
					     </tr>
					  </table>
			 				 <br />
				</fieldset>			
				</td>
			
			</tr>
		</table>
		 </td>
 		 </tr>
		<tr>
			<td colspan="2" align="center" height="50px">
			<input type="submit" id='saveb' value="����" class="button"/>��
			<input type="button" name="Submit2" value="����" class="button" onclick="window.history.go(-1);"/></td>
		</tr>
	</table>
</div>
</form>
</body>
</html>

