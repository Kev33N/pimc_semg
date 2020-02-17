<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>实验详情</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>


<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
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
								<TD class=manageHead>当前位置：康复评估管理 &gt;<a href="${pageContext.request.contextPath }/diagnosis_findByPage.action">评估记录列表</a> &gt; 评估记录详情</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<tr>
								<td>所属患者：</td>
								<td>
									<div style="width:180px">${model.patient.patient_name }</div>
								</td>
							</tr>
							<tr>
								<td>评估动作：</td>
								<td>
									<div style="width:180px">${model.action.action_name }</div>
								</td>
								<td>评估日期：</td>
								<td>
									<div style="width:180px">${model.diagnosis_date }</div>
								</td>
								
							</tr>
							<TR>
								<td>iEMG（肌电积分值）：</td>
								<td>
									<div style="width:180px">${model.diagnosis_iEMG }</div>
								</td>
								<td>RMS（均方根值）：</td>
								<td>
									<div style="width:180px">${model.diagnosis_RMS }</div>
								</td>
								
							</TR>
							<tr>
								<td>MPF（平均功率频率）：</td>
								<td>
									<div style="width:180px">${model.diagnosis_MPF }</div>
								</td>
								<td>MF（平均平率）：</td>
								<td>
									<div style="width:180px">${model.diagnosis_MF }</div>
								</td>
							</tr>
							<tr>
								<td>设备名称：</td>
								<td>
									<div style="width:180px">${model.device.dict_item_name }</div>
								</td>
								<td>配置信息：</td>
								<td>
									<div style="width:180px">${model.profile.dict_item_name }</div>
								</td>
							</tr>
							<tr>
								<td rowspan=2>
									<INPUT class=button type="button" value=" 返回 " onclick="location.href='${pageContext.request.contextPath }/diagnosis_findByPage.action?pageCode=${currPageCode }'" >
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
</BODY>
</HTML>
