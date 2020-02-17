<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>被试列表</TITLE> 
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
	
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm" action="${pageContext.request.contextPath }/dict_findProfileByPage.action"
		method=post>
		
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
								<TD class=manageHead>当前位置：系统管理 &gt; 软件配置管理</TD>
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
													<TD>软件配置：</TD>
													<TD>
														<INPUT class=textbox id=sChannel2 style="WIDTH: 80px" maxLength=50 name="dict_item_name" value="${model.dict_item_name}">
													</TD>
													<TD>
														<INPUT class=button id=sButton2 type="submit" value="筛选 " name=sButton2>
													</TD>
													<td>
														<input class=button type="button" value="新增软件配置" onclick="location.href='${pageContext.request.contextPath }/dict_initAddNewProfileUI.action'">
													</td>
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
													<TD>配置信息</TD>
													<TD>软件用途</TD>
													<TD>提供方</TD>
													<!-- <TD>是否管理员</TD> -->
													
												</TR>
												<c:forEach items="${page.beanList }" var="profile">
												<TR
													style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD>${profile.dict_item_name }</TD>
													<TD>${profile.dict_item_type }</TD>
													<TD>${profile.dict_item_country }</TD>
													<TD>
													<a href="${pageContext.request.contextPath }/dict_initEditProfileUI.action?dict_id=${profile.dict_id}">修改</a>
													&nbsp;&nbsp;
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
										<%-- <SPAN id=pagelink>
											<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
													<c:if test="${page.pageCode == 1 }">
														<a href="javascript:void(0)"
															aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>>
													</c:if>
													<c:if test="${page.pageCode != 1 }">
														<a
															href="${pageContext.request.contextPath}/customer_findByPage.action?pageCode=${page.pageCode-1}"
															aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
													</c:if>
										
										
													<c:forEach begin="${page.pageCode-5>0?page.pageCode-5:1 }" end="${page.pageCode+4>page.totalPage?page.totalPage:page.pageCode+4 }" var="n">
														<c:if test="${page.pageCode==n }">
															<a href="javascript:void(0)">${n }</a>
														</c:if>
														<c:if test="${page.pageCode!=n }">
															<a href="${pageContext.request.contextPath}/customer_findByPage.action?pageCode=${n}">${n }</a>
														</c:if>
													</c:forEach>
										
													<c:if test="${page.pageCode == page.totalPage }">
														<a href="javascript:void(0)" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														</a>
													</c:if>
													<c:if test="${page.pageCode != page.totalPage }">
														<a href="${pageContext.request.contextPath}/customer_findByPage.action?pageCode=${page.pageCode+1}"
															aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														</a>
													</c:if>
											</div>
										</SPAN> --%>
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
