<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/frameset.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
	BODY {
		FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
	}
	TD {
		FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
	}
	
	.error{
		color:red;
	}

</STYLE>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR>

<!-- 引入JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	
	//密码提示
	function promptPassword(){
		$("#passwordValidate").html("密码长度至少6位，必须同时包含数字和字母");
		$("#passwordValidate").css("color","white")
	}
	
	function checkPasswordFormate(){
		var password = $("#user_password").val();
		var re = /[a-zA-Z](?=.*?[1-9].*?)[a-zA-Z1-9]+|[1-9](?=.*?[a-zA-Z].*?)[a-zA-Z1-9]+/g;
		if(password.length<6){
			$("#passwordValidate").addClass("error4");
			$("#passwordValidate").html("密码长度不能小于6位");
			$("#passwordValidate").css("color","red");
			return;
		}if(!re.test(password)){
			$("#passwordValidate").addClass("error4");
			$("#passwordValidate").html("密码必须同时包含数字和字母");
			$("#passwordValidate").css("color","red");
			return;
		}
		$("#passwordValidate").removeClass("error4");
		$("#passwordValidate").html("密码可用");
		$("#passwordValidate").css("color","white");
	}
	
	function checkPasswordSame(){
		var password = $("#user_password").val();
		var password2 = $("#user_password2").val();
		if(password==password2 && password.trim()!=""){
			$("#passwordSpan").removeClass("error2");
			$("#passwordSpan").html("密码正确");
			$("#passwordSpan").css("color","white");
		}else{
			$("#passwordSpan").addClass("error2");
			$("#passwordSpan").html("请输入相同密码");
			$("#passwordSpan").css("color","red");
		}
	}
	
	//可以阻止表单的提交
	function checkForm(){
		//先让校验的方法执行一次
		checkPasswordFormate();
		checkPasswordSame();
		//获取error的数量，如果数量>0,说明存在错误，不能提交表单
		if($(".error4").size()>0 || $(".error2").size()>0){
			return false;
		}
	}
	
</script>

</HEAD>

<BODY>
<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/user_alterCode.action" onsubmit="return checkForm()" method=post>

<DIV id=UpdatePanel1>
<DIV id=div1 
style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>
<DIV id=div2 
style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>


<DIV>&nbsp;&nbsp; </DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width=900 align=center border=0>
  <TBODY>
  <TR>
    <TD style="HEIGHT: 105px"><IMG src="${pageContext.request.contextPath }/images/login_register_1.jpg" 
  border=0></TD></TR>
  <TR>
    <TD background="${pageContext.request.contextPath }/images/login_2_shu.jpg" height=300>
      <TABLE height=300 cellPadding=0 width=900 border=0>
        <TBODY>
        <TR>
          <TD colSpan=2 height=35></TD></TR>
        <TR>
          <TD width=360></TD>
          <TD>
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR>
                <TD style="HEIGHT: 7px"></TD>
                <TD style="HEIGHT: 7px"></TD>
                <TD style="HEIGHT: 7px"></TD></TR>
              <TR>
              <TR>
                <TD style="HEIGHT: 20px" width=80>原密码：</TD>
                <TD style="HEIGHT: 20px">
                	<INPUT id="user_code" style="WIDTH: 130px" type=password name="user_oldPassword">
                </TD>
                <TD style="HEIGHT: 20px" width=370>
                	<SPAN id="codeId" style="FONT-WEIGHT: bold;"><font color=red>${oldPasswordError }</font></SPAN>
                </TD>
              </TR>
              
              <TR>
                <TD style="HEIGHT: 20px">新密码：</TD>
                <TD style="HEIGHT: 20px">
                	<INPUT id="user_password" style="WIDTH: 130px" type=password name="user_password" onblur="checkPasswordFormate()" onfocus="promptPassword()"></TD>
                <TD style="HEIGHT: 20px">
                	<SPAN id="passwordValidate" style="FONT-WEIGHT: bold;"></SPAN>
                </TD>
              </TR>
              
              <TR>
                <TD style="HEIGHT: 20px">新密码：</TD>
                <TD style="HEIGHT: 20px">
                	<INPUT id="user_password2" style="WIDTH: 130px" type=password onblur="checkPasswordSame()"></TD>
                <TD style="HEIGHT: 20px">
                	<SPAN id="passwordSpan" style="FONT-WEIGHT: bold; COLOR: red"></SPAN>
                </TD>
              </TR>
              
              <TR>
					<td><font size=4></font></td>
					<td>
						<div style="width:180px"><font size=4></font></div>
					</td>
				</TR>
				<TR>
					<td><font size=4></font></td>
					<td>
						<div style="width:180px"><font size=4></font></div>
					</td>
				</TR>
              </TBODY>
          </TABLE>
          
          <table>
              <TR>
                <TD style="HEIGHT: 1px"></TD>
                <TD style="HEIGHT: 1px"></TD>
                <TD style="HEIGHT: 1px"></TD>
              </TR>
             <TR>
                <TD width="80"></TD>
                <TD width=220>
                	<input type="submit" value="确认修改">
              	</td>
              	<td rowspan=2>
						<INPUT class=button type="button" value="返回 " onclick="location.href='${pageContext.request.contextPath }/user_center.action'" >
					</td>
              </tr>
          </table>
          
          </TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG src="${pageContext.request.contextPath }/images/login_register_3.jpg" 
border=0></TD></TR></TBODY></TABLE></DIV></DIV>


</FORM></BODY></HTML>


</body>
</html>