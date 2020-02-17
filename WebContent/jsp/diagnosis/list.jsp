<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>联系人列表</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		var url = "${pageContext.request.contextPath}/action_findAll.action";
		//获取评估动作信息
		$.post(url,function(data){
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
	<FORM id="customerForm" name="customerForm" action="${pageContext.request.contextPath }/diagnosis_findByPage" method="post">
		
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
								<TD class=manageHead>当前位置：康复评估管理 &gt; 评估记录列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>所属患者：</TD>
													<TD>
														<select name="patient.patient_id" id="patientId">
															<option value="">--请选择--</option>
														</select>
													</TD>
													<TD>评估动作：</TD>
													<TD>
														<select name="action.action_id" id="actionId">
															<option value="">--请选择--</option>
														</select>
													</TD>
													<TD><INPUT class=button id=sButton2 type=submit
														value=" 筛选 " name=sButton2></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							    
								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>所属被试</TD>
													<TD>iEMG（肌电积分值）</TD>
													<TD>RMS（均方根值）</TD>
													<TD>MPF（平均功率频率）</TD>
													<TD>MF（中值频率）</TD>
													<TD>评估日期</TD>
												</TR>
												<c:forEach items="${page.beanList }" var="diagnosis">
												<TR
													style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD>${diagnosis.patient.patient_name }</TD>
													<TD>${diagnosis.diagnosis_iEMG }</TD>
													<TD>${diagnosis.diagnosis_RMS }</TD>
													<TD>${diagnosis.diagnosis_MPF }</TD>
													<TD>${diagnosis.diagnosis_MF }</TD>
													<TD>${diagnosis.diagnosis_date }</TD>
													
													<TD>
													<a href="${pageContext.request.contextPath }/diagnosis_initDetail?diagnosis_id=${diagnosis.diagnosis_id}&pageCode=${page.pageCode}">详情</a>
													&nbsp;&nbsp;
													<a href="${pageContext.request.contextPath }/diagnosis_initUpdate?diagnosis_id=${diagnosis.diagnosis_id}">修改</a>
													&nbsp;&nbsp;
													<a href="${pageContext.request.contextPath }/diagnosis_delete?diagnosis_id=${diagnosis.diagnosis_id}" onclick="return window.confirm('确定删除吗？')">删除</a>
													</TD>
												</TR>
												
												</c:forEach>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
								
								<TR>
									<TD>
										<SPAN id=pagelink>
											<DIV style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B>${page.totalCount}</B>]条记录,共[<B>${page.totalPage}</B>]页
												,每页显示
												<select name="pageSize">
													<option value="5" <c:if test="${page.pageSize==5 }">selected</c:if>>5</option>
													<option value="6" <c:if test="${page.pageSize==6 }">selected</c:if>>6</option>
													<option value="7" <c:if test="${page.pageSize==7 }">selected</c:if>>7</option>
													<option value="8" <c:if test="${page.pageSize==8 }">selected</c:if>>8</option>
												</select>
												条
												
												<c:if test="${page.pageCode > 1 }">
													[<A href="javascript:to_page(${page.pageCode-1})">前一页</A>]
												</c:if>
												<B>${page.pageCode}</B>
												
												<c:if test="${page.pageCode < page.totalPage }">
													[<A href="javascript:to_page(${page.pageCode+1})">后一页</A>] 
												</c:if>
												到
												<input type="text" size="3" id="page" name="pageCode" />
												页
												
												<input type="button" value="Go" onclick="to_page()"/>
											</DIV>
										</SPAN>
									</TD>
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
