<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>联系人列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<link rel="icon"
	href="https://jscdn.com.cn/highcharts/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* css 代码  */
</style>
<script src="${pageContext.request.contextPath }/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/js/exporting.js"></script>
<script src="${pageContext.request.contextPath }/js/highcharts-zh_CN.js"></script>

<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css"
	type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/record_checkResultByPatient"
		method="post">

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%"
						background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15
						background="${pageContext.request.contextPath }/images/new_022.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg"
						border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：统计分析 &gt; 实验结果分布</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD>
										<div id="container" style="max-width: 90%; height: 360px"></div>
										<script>
											var chart = Highcharts
													.chart(
															'container',
															{
																chart : {
																	type : 'bar'
																},
																title : {
																	text : '离线排行榜'
																},
																subtitle : {
																	text : '数据来源:上海大学脑机接口研究中心'
																},
																xAxis : {
																	categories : ${names},
																	title : {
																		text : null
																	}
																},
																yAxis : {
																	min : 0,
																	title : {
																		text : '识别率 (%))',
																		align : 'high'
																	},
																	labels : {
																		overflow : 'justify'
																	}
																},
																tooltip : {
																	valueSuffix : ' %'
																},
																plotOptions : {
																	bar : {
																		dataLabels : {
																			enabled : true,
																			allowOverlap : true
																		// 允许数据标签重叠
																		}
																	}
																},
																legend : {
																	layout : 'vertical',
																	align : 'right',
																	verticalAlign : 'top',
																	x : -40,
																	y : 100,
																	floating : true,
																	borderWidth : 1,
																	backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
																	shadow : true
																},
																series : [ {
																	name : '识别率',
																	data : ${accracy}
																} ]
															});
										</script>
									</td>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15
						background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg"
						height=15></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>