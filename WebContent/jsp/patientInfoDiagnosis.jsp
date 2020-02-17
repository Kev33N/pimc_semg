<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WRC_MI</title>
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
}

.footer {
	height: 100px;
	background: red;
	width: 100%;
	position: absolute;
	bottom: 0;
	left: 10;
}

.Content-Main {
	max-width: 500px;
	margin: auto;
	border: none;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
	text-shadow: 1px 1px 1px #444;
	color: #D3D3D3;
	background: #3c6ba4;
}

.Content-Main h1 {
	padding: 8px 0px 40px 10px;
	display: block;
	border-bottom: 1px solid #444;
}

.text1 {
	margin-left: 3px;
}

.Content-Main label {
	margin: 0px 0px 5px;
	display: block;
}

.fileInputContainer {
	height: 99px;
	width: 99px;
	margin: 20px 20px 20px 20px;
	border: none;
	background: url("img/Example.jpg");
	overflow: hidden;
	position: relative;
}

.fileInput {
	height: 106px;
	border: none;
	font-size: 300px;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer;
	position: absolute;
}

.Content-Main label>span {
	width: 20%;
	float: left;
	text-align: right;
	padding-right: 10px;
	margin-top: 10px;
	font-weight: bold;
}

.Main-sex {
	padding-right: 13px;
	padding-bottom: 13px;
	font-weight: bold;
	line-height: 4px;
}

.Main-sex input[type=checkbox] {
	margin-top: 6px;
	vertical-align: middle;
}

.Content-Main input[type="text"], .Content-Main input[type="email"],
	.Content-Main textarea {
	height: 25px;
	width: 70%;
	line-height: 15px;
	padding: 5px 0px 5px 5px;
	margin-bottom: 16px;
	margin-right: 6px;
	margin-top: 2px;
	border: none;
	border-radius: 2px;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	outline: 0 none;
	background: #DFDFDF;
	color: #525252;
}

.Content-Main textarea {
	height: 100px;
	width: 70%;
	padding: 5px 0px 0px 5px;
}

.Content-Main .button {
	padding: 8px 44px 8px 44px;
	margin-bottom: 8px;
	margin-left:360px;
	border: none;
	border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	font-weight: bold;
	text-shadow: 1px 1px 1px #FFE477;
	box-shadow: 1px 1px 1px #3D3D3D;
	-moz-box-shadow: 1px 1px 1px #3D3D3D;
	-webkit-box-shadow: 1px 1px 1px #3D3D3D;
	color: #585858;
	background: #f6ff0a;
}

.Content-Main .button:hover {
	color: #333;
	background-color: #EBEBEB;
}
</style>

<body>
	<div class="container-fluid">
		<!-- 静态包含 -->
		<%-- <%@include file="/jsp/head.jsp"%> --%>


		<!--
            	作者：Kevin_ker@163.com
            	时间：2019-04-01
            	描述：用户信息
            -->
		<div class="container-fluid">
			<div class="bg">
				<div class="Content-Main">
					<form action="${pageContext.request.contextPath }/patient_saveForDiagnosis" method="post" class="form-userInfo">
						<h2 align="center">患者信息</h2>
						<br>
						<p>
							<!--<div class="fileInputContainer">
	                    <input class="fileInput" id="" type="file" name="">
	                </div>-->
					<label>
	                    <span>姓名:</span>
	                    <input type="text"  name="patient_name" value="${tempPatient.patient_name }" placeholder="请填写姓名">
	                </label>
					<label>
	                    <span>身份证号:</span>
	                    <input type="text" name="patient_code" value="${tempPatient.patient_code }" placeholder="请填写身份证号">
	                </label>
					<label class="Main-sex">
	                    <span>性别:</span>
	                    <c:if test="${tempPatient.patient_gender == '男' }">
	                    	<input type="radio" class="man" name="patient_gender" checked="checked" value="男">男
	                    	<input type="radio" class="women" name="patient_gender" value="女">女
	                    </c:if>
	                    <c:if test="${tempPatient.patient_gender == '女' }">
	                    	<input type="radio" class="man" name="patient_gender" value="男">男
	                    	<input type="radio" class="women" name="patient_gender" checked="checked" value="女">女
	                    </c:if>
	                </label>
					<label>
	                    <span>年龄:</span>
	                    <input type="text" name="patient_age" value="${tempPatient.patient_age }" placeholder="请填写年龄">
	                </label>
					<label>
	                    <span>出生日期:</span>
	                    <input type="text" name="patient_birthday" value="${tempPatient.patient_birthday }" placeholder="请填写出生日期">
	                </label>
					<label>
	                    <span>联系方式:</span>
	                    <input type="text" name="patient_phone" value="${tempPatient.patient_phone }" placeholder="请填写联系方式">
	                </label>
					<label>
	                    <span>邮箱 :</span>
	                    <input type="text" name="patient_email" value="${tempPatient.patient_email }" placeholder="请填写邮箱">
	                </label>
					<label>
	                    <span>地址:</span>
	                    <input type="text" name="patient_address" value="${tempPatient.patient_address }" placeholder="请填写地址">
	                </label>
					<label>
	                    <span>备注:</span>
	                    <textarea id="message" name="patient_additional" placeholder="Your message to us">${tempPatient.patient_additional }</textarea>
	                </label>
					<label>
	                    <input type="submit" class="button" value="下一步">
	                </label>
					</form>
				</div>
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