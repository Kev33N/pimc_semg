<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>联系人列表</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    /* css 代码  */
</style>
<script src="${pageContext.request.contextPath }/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/js/exporting.js"></script>
<script src="${pageContext.request.contextPath }/js/highcharts-zh_CN.js"></script>

<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<SCRIPT language=javascript>
	function to_page(page){
		if(page){
			$("#page").val(page);
		}
		document.customerForm.submit();
	}
	
	$(function(){
		//发送异步的请求，获取到所有的patient
		var url1 = "${pageContext.request.contextPath}/patient_findAll.action";
		$.post(url1,function(data){
			$(data).each(function(){
				//先获取值栈中的值，使用EL表达式
				var vsId = "${model.patient.patient_id}";
				if(vsId == this.patient_id){
					$("#patientId").append("<option value='"+this.patient_id+"' selected='selected'>"+this.patient_name+"</option>")
				}else{
					$("#patientId").append("<option value='"+this.patient_id+"'>"+this.patient_name+"</option>")
				}
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

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm" action="${pageContext.request.contextPath }/diagnosis_findResultByPatientAndAction" method="post">
		
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
					<TD width=15 background="${pageContext.request.contextPath }/images/new_022.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：统计分析 &gt; 患者评估结果走势图</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height="40">
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR height="40">
													<TD>患者姓名：</TD>
													<TD>
														<select class=textbox style="WIDTH: 80px;height: 22px" name="patient.patient_id" id="patientId">
															<option value="">--请选择--</option>
														</select>
													</TD>
													<TD>评估动作：</TD>
													<TD>
														<TD>
															<select name="action.action_id" id="actionId">
																<option value="">--请选择--</option>
															</select>
														</TD>
													</TD>
													<TD>
														<INPUT class=button id=sButton2 type="submit" value="筛选 " name=sButton2>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								
								<TR>
									<TD>
										<div id="container" style="max-width:90%;height:400px"></div>
										<c:if test="${empty patient_name }">
											<script>
											var chart = Highcharts.chart('container', {
												title: {
														text: '患者评估结果走势图'
												},
												subtitle: {
														text: '数据来源：上海大学人工智能实验中心'
												},
												yAxis: {
														title: {
																text: ''
														}
												},
												legend: {
														layout: 'vertical',
														align: 'right',
														verticalAlign: 'middle'
												},
												plotOptions: {
														series: {
																label: {
																		connectorAllowed: false
																},
																pointStart: 1
														}
												},
												series: [{
														name: 'iEMG（肌电积分值）',
														data: []
												}, {
														name: 'RMS（均方根值）',
														data: []
												}, {
														name: 'MPF（平均功率频率）',
														data: []
												}, {
														name: 'MF（中值频率）',
														data: []
												}],
												responsive: {
														rules: [{
																condition: {
																		maxWidth: 500
																},
																chartOptions: {
																		legend: {
																				layout: 'horizontal',
																				align: 'center',
																				verticalAlign: 'bottom'
																		}
																}
																}]
														}
												});
									        </script>
										</c:if>
										<c:if test="${not empty patient_name }">
											<script>
											var chart = Highcharts.chart('container', {
												title: {
														text: '患者评估结果走势图'
												},
												subtitle: {
														text: '数据来源：上海大学人工智能实验中心'
												},
												yAxis: {
														title: {
																text: ''
														}
												},
												legend: {
														layout: 'vertical',
														align: 'right',
														verticalAlign: 'middle'
												},
												plotOptions: {
														series: {
																label: {
																		connectorAllowed: false
																},
																pointStart: 1
														}
												},
												series: [{
														name: 'iEMG（肌电积分值）',
														data: ${ yAxis_iemg }
												}, {
														name: 'RMS（均方根值）',
														data: ${ yAxis_rms }
												}, {
														name: 'MPF（平均功率频率）',
														data: ${ yAxis_mpf }
												}, {
														name: 'MF（中值频率）',
														data: ${ yAxis_mf }
												}],
												responsive: {
														rules: [{
																condition: {
																		maxWidth: 500
																},
																chartOptions: {
																		legend: {
																				layout: 'horizontal',
																				align: 'center',
																				verticalAlign: 'bottom'
																		}
																}
																}]
														}
												});
									        </script>
										</c:if>
									</td>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
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
