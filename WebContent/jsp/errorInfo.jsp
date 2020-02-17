<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BCI</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>

<style type="text/css">
.bg {
	background-image: url(img/background.jpeg);
	background-repeat: no-repeat;
	text-align: center;
}
</style>

<body>
	<div class="container-fluid">
		<!-- 静态包含 -->
		<%@include file="/jsp/head.jsp"%>


		<!--
            	作者：Kevin_ker@163.com
            	时间：2019-04-01
            	描述：用户信息
            -->
		<div class="container-fluid">
			<div class="bg">
				<h3>对不起，你上传的用户信息存在问题</h3>
			</div>
		</div>
		<!--
            	作者：Kevin_ker@163.com
            	时间：2019-04-01
            	描述：页脚部分
            -->
		<div class="container-fluid">
			<div style="margin-top: 50px;">
				<img src="${pageContext.request.contextPath}/img/footer.jpg"
					width="100%" height="78" alt="我们的优势" title="我们的优势" />
			</div>

			<div style="text-align: center; margin-top: 5px;">
				<ul class="list-inline">
					<li><a href="info.html">关于我们</a></li>
					<li><a>联系我们</a></li>
					<li><a>招贤纳士</a></li>
					<li><a>法律声明</a></li>
					<li><a>友情链接</a></li>
					<li><a>支付方式</a></li>
					<li><a>配送方式</a></li>
					<li><a>服务声明</a></li>
					<li><a>广告声明</a></li>
				</ul>
			</div>
			<div
				style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
				Copyright &copy; 2012-2019 上海大学443  版权所有</div>
		</div>
	</div>
</body>

</html>