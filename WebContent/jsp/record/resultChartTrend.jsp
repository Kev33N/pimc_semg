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
	}); 
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm" action="${pageContext.request.contextPath }/record_checkResultByPatient" method="post">
		
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
								<TD class=manageHead>当前位置：统计分析 &gt; 患者治疗结果走势图</TD>
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
									        	chart: {
									        		type: 'line'
									        	},
									        	title: {
									        		text: '患者治疗结果走势图'
									        	},
									        	subtitle: {
									        		text: '数据来源: 上海大学脑机接口实验室'
									        	},
									        	xAxis: {
									        		categories: []
									        	},
									        	yAxis: {
									        		title: {
									        			text: '治疗得分'
									        		}
									        	},
									        	plotOptions: {
									        		line: {
									        			dataLabels: {
									        				// 开启数据标签
									        				enabled: true          
									        			},
									        			// 关闭鼠标跟踪，对应的提示框、点击事件会失效
									        			enableMouseTracking: true
									        		}
									        	},
									        	series: [{
									        		name: '患者姓名',
									        		data: []
									        	}]
									        });
									        </script>
										</c:if>
										<c:if test="${not empty patient_name }">
											<script>
									        var chart = Highcharts.chart('container', {
									        	chart: {
									        		type: 'line'
									        	},
									        	title: {
									        		text: '患者治疗结果走势图'
									        	},
									        	subtitle: {
									        		text: '数据来源: 上海大学脑机接口实验室'
									        	},
									        	xAxis: {
									        		categories: ${xAxis}
									        	},
									        	yAxis: {
									        		title: {
									        			text: '治疗得分'
									        		}
									        	},
									        	plotOptions: {
									        		line: {
									        			dataLabels: {
									        				// 开启数据标签
									        				enabled: true          
									        			},
									        			// 关闭鼠标跟踪，对应的提示框、点击事件会失效
									        			enableMouseTracking: true
									        		}
									        	},
									        	series: [{
									        		name: '${patient_name}',
									        		data: ${yAxis}
									        	}]
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
