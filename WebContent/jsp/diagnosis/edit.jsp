<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>试验记录修改</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
		type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
//页面的加载
$(function(){
	//发送ajax请求
	var url = "${pageContext.request.contextPath}/dict_findByCodeByAjax.action";
	//获取设备信息（对应Dict中dict_id为001的查询结果）
	var param = {"dict_type_code":"001"};
	//data为ajax请求结果
	$.post(url,param,function(data){
		//遍历data
		$(data).each(function(i,n){
			//先获取值栈中的值，使用EL表达式(上传的设备名称)
			var deviceName = "${model.device.dict_item_name}";
			//值栈中的deviceName值和遍历的deviceName值相同，让其被选中
			if(deviceName == n.dict_item_name){
				//JQ的DOM操作
				$("#deviceId").append("<option value='"+n.dict_id+"' selected='selected'>"+n.dict_item_name+"</option>");
			}else{
				$("#deviceId").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			}
		});
	},"json");
	
	//获取配置信息（对应Dict中dict_id为002的查询结果）
	var param = {"dict_type_code":"002"};
	$.post(url,param,function(data){
		$(data).each(function(i,n){
			var profileName = "${model.profile.dict_item_name}";
			if(profileName == n.dict_item_name){
				$("#profileId").append("<option value='"+n.dict_id+"' selected='selected'>"+n.dict_item_name+"</option>");
			}else{
				//JQ的DOM操作
				$("#profileId").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			}
			
		});
	},"json");
});
</script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/diagnosis_update.action" method=post>
		<input type="hidden" name="diagnosis_id" value="${model.diagnosis_id }"/>
		<input type="hidden" name="action.action_id" value="${model.action.action_id }"/>
		<input type="hidden" name="patient.patient_id" value="${model.patient.patient_id }"/>

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
								<TD class=manageHead>当前位置：康复评估管理 &gt;<a href="${pageContext.request.contextPath }/diagnosis_findByPage.action">评估记录列表</a> &gt;修改评估记录</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<TR>
								<td>所属患者：</td>
								<td>
									<div style="width:180px">${model.patient.patient_name }</div>
								</td>
								<td>评估日期：</td>
								<td>
									<INPUT type="datetime-local" class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_date" value="${model.diagnosis_date }">
								</td>
								
							</TR>
							<tr>
								<td>iEMG（肌电积分值）：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_iEMG" value="${model.diagnosis_iEMG }">
								</td>
								<td>RMS（均方根值）：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name=diagnosis_RMS value="${model.diagnosis_RMS }">
								</td>
							</tr>
							<TR>
								<td>MPF（平均功率频率）：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="diagnosis_MPF" value="${model.diagnosis_MPF }">
								</td>
								<td>MF（平均平率）：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name=diagnosis_MF value="${model.diagnosis_MF }">
								</td>
							</TR>
							<tr>
								<td>设备名称：</td>
								<td>
									<select name="device.dict_id" id="deviceId">
									</select>
								</td>
								<td>配置信息：</td>
								<td>
									<select name="profile.dict_id" id="profileId">
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan=2>
									<INPUT class=button id=sButton2 type=submit value="保存 " name=sButton2>&nbsp;
									<INPUT class=button type="button" value=" 取消 " onclick="location.href='${pageContext.request.contextPath }/diagnosis_findByPage.action'" >
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
