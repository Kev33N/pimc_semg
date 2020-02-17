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
	
	function checkUName(){
		var uName = $("#user_name").val();
		if(uName.trim()!=""){
			$("#uNameSpan").removeClass("error3");
			$("#uNameSpan").html("可以使用");
			$("#uNameSpan").css("color","white");
		}else{
			$("#uNameSpan").addClass("error3");
			$("#uNameSpan").html("请填写用户名");
			$("#uNameSpan").css("color","red");
		}
	}
	
	function checkPhone(){
		var phone = $("#user_phone").val();
		var re = /^1[3456789]\d{9}$/;
		if(!re.test(phone)){
			$("#phoneSpan").addClass("error5");
			$("#phoneSpan").html("手机号格式错误");
			$("#phoneSpan").css("color","red");
			return;
		}
		$("#phoneSpan").removeClass("error5");
		$("#phoneSpan").html("手机号可用");
		$("#phoneSpan").css("color","white");
	}
	
	function checkEmail(){
		var email = $("#user_email").val();
		var re = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
		if(!re.test(email)){
			$("#emailSpan").addClass("error6");
			$("#emailSpan").html("邮箱格式错误");
			$("#emailSpan").css("color","red");
			return;
		}
		$("#emailSpan").removeClass("error6");
		$("#emailSpan").html("邮箱可用");
		$("#emailSpan").css("color","white");
	}
	
	//可以阻止表单的提交
	function checkForm(){
		//先让校验的方法执行一次
		checkUName();
		checkPhone();
		checkEmail();
		//获取error的数量，如果数量>0,说明存在错误，不能提交表单
		if($(".error3").size()>0 || $(".error5").size()>0 || $(".error6").size()>0){
			return false;
		}
	}
	
</script>

</HEAD>

<BODY>
<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/user_alterInfo.action" onsubmit="return checkForm()" method=post>

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
                <TD style="HEIGHT: 20px">真实姓名：</TD>
                <TD style="HEIGHT: 20px">
                	<INPUT id="user_name" style="WIDTH: 130px" type="text" name="user_name" onblur="checkUName()" value=${existUser.user_name }>
                </TD>
                <TD style="HEIGHT: 20px">
                	<SPAN id="uNameSpan" style="FONT-WEIGHT: bold;"></SPAN>
                </TD>
              </TR>
              
              <TR>
                <TD style="HEIGHT: 20px">联系方式：</TD>
                <TD style="HEIGHT: 20px">
                	<INPUT id="user_phone" style="WIDTH: 130px" type="text" name="user_phone" onblur="checkPhone()" value=${existUser.user_phone }>
                </TD>
                <TD style="HEIGHT: 20px">
                	<SPAN id="phoneSpan" style="FONT-WEIGHT: bold;"></SPAN>
                </TD>
              </TR>
              
              <TR>
                <TD style="HEIGHT: 20px">邮箱地址：</TD>
                <TD style="HEIGHT: 20px">
                	<INPUT id="user_email" style="WIDTH: 130px" type="text" name="user_email" onblur="checkEmail()" value=${existUser.user_email }>
                </TD>
                <TD style="HEIGHT: 20px">
                	<SPAN id="emailSpan" style="FONT-WEIGHT: bold;"></SPAN>
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