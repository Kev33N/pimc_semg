<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>添加试验记录</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>


<META content="MSHTML 6.00.2900.3492" name=GENERATOR>

<SCRIPT language=javascript>
	$(function(){
		//发送异步的请求，获取到所有的patient
		var url1 = "${pageContext.request.contextPath}/patient_findAll.action";
		$.post(url1,function(data){
			$(data).each(function(){
				$("#patientId").append("<option value='"+this.patient_id+"'>"+this.patient_name+"</option>")
			});
		},"json");
		
		//发送ajax请求
		var url = "${pageContext.request.contextPath}/dict_findByCodeByAjax.action";
		//获取设备信息
		var param = {"dict_type_code":"001"};
		$.post(url,param,function(data){
			$(data).each(function(i,n){
				$("#deviceId").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			});
		},"json");
		
		//获取profile
		var param = {"dict_type_code":"002"};
		$.post(url,param,function(data){
			$(data).each(function(i,n){
				$("#profileId").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			});
		},"json");
		
		//发送ajax请求
		var url2 = "${pageContext.request.contextPath}/action_findAll.action";
		//获取评估动作信息
		$.post(url2,function(data){
			$(data).each(function(){
				//先获取值栈中的值，使用EL表达式
				var vsId = "${model.action.action_id}";
				if(vsId == this.action_id){
					$("#actionId").append("<option value='"+this.action_id+"' selected='selected'>"+this.action_name+"</option>")
				}else{
					$("#actionId").append("<option value='"+this.action_id+"'>"+this.action_name+"</option>")
				}
			});
		},"json");
	}); 
</SCRIPT>

</HEAD>
<BODY>
	<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/diagnosis_add.action" method=post enctype="multipart/form-data">
		

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
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
								<TD class=manageHead>当前位置：评估记录管理 &gt; 添加评估记录</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<tr>
								<td>所属患者：</td>
								<td>
									<select name="patient.patient_id" id="patientId">
										<option value="">--请选择--</option>
									</select>
								</td>
								
							</tr>
							<TR>
								<TD>评估动作：</TD>
								<TD>
									<select name="action.action_id" id="actionId">
										<option value="">--请选择--</option>
									</select>
								</TD>
								<td>评估日期：</td>
								<td>
									<INPUT type="datetime-local" class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_date" placeholder="请填写康复评估日期">
								</td>
								
							</TR>
							<TR>
								<TD>iEMG（肌电积分值）：</TD>
								<TD>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_iEMG" placeholder="请填写iEMG（肌电积分值）">
								</TD>
								<td>RMS（均方根值）：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_RMS" placeholder="请填写RMS（均方根值）">
								</td>
								
							</TR>
							<TR>
								<TD>MPF（平均功率频率）：</TD>
								<TD>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_MPF" placeholder="请填写MPF（平均功率频率）">
								</TD>
								<td>MF（平均频率）：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_MF" placeholder="请填写MF">
								</td>
								
							</TR>
							<tr>
								<td>设备名称：</td>
								<td>
									<select name="device.dict_id" id="deviceId">
										<option value="">&nbsp;----请选择----&nbsp;</option>
									</select>
								</td>
								<td>配置信息：</td>
								<td>
									<select name="profile.dict_id" id="profileId">
											<option value="">&nbsp;----请选择----&nbsp;</option>
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan=2>
									<INPUT class=button id=sButton2 type=submit value="保存 " name=sButton2>&nbsp;
									<INPUT class=button type="button" value=" 取消 " onclick="location.href='${pageContext.request.contextPath }/record_findByPage.action'" >
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
