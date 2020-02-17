<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>修改被试信息</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>


<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/patient_update.action" method=post>
		<input type="hidden" name="patient_id" value="${model.patient_id }"/>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background=${pageContext.request.contextPath }/images/new_020.jpg
						height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：患者管理 &gt;<a href="${pageContext.request.contextPath }/patient_findByPage.action">患者列表</a> &gt; 修改患者信息</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						
						<TABLE cellSpacing=0 cellPadding=5  border=0>
						  
						    
							<TR>
								<td>患者姓名：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_name" value="${model.patient_name }">
								</td>
								<td>身份证号：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_code" value="${model.patient_code }">
								</td>
							</TR>
							
							<TR>
								<td>性别：</td>
								<td>
									<c:if test="${model.patient_gender == '男' }">
				                    	<input type="radio" class="man" name="patient_gender" checked="checked" value="男">男
				                    	<input type="radio" class="women" name="patient_gender" value="女">女
				                    </c:if>
				                    <c:if test="${model.patient_gender == '女' }">
				                    	<input type="radio" class="man" name="patient_gender" value="男">男
				                    	<input type="radio" class="women" name="patient_gender" checked="checked" value="女">女
				                    </c:if>
								</td>
								<td>年龄：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_age" value="${model.patient_age }">
								</td>
							</TR>
							
							<TR>
								<td>出生日期：</td>
								<td>
									<INPUT type="date" class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_birthday" value="${model.patient_birthday }">
								</td>
								<td>联系方式：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_phone" value="${model.patient_phone }">
								</td>
							</TR>
							
							<TR>
								<td>邮箱 ：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_email" value="${model.patient_email }">
								</td>
								<td>地址：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="patient_address" value="${model.patient_address }">
								</td>
							</TR>
							
							<TR>
								<td>备注 ：</td>
								<td>
									<textarea name="patient_additional" cols="30" rows="3">${model.patient_additional }</textarea>
								</td>
							</TR>
							<tr>
								<td rowspan=2>
									<INPUT class=button id=sButton2 type=submit value=" 保存 " name=sButton2>
								</td>
								<td rowspan=2>
									<INPUT class=button type="button" value=" 取消 " onclick="location.href='${pageContext.request.contextPath }/patient_findByPage.action'" >
								</td>
							</tr>
						</TABLE>
						
						
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
					<IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
