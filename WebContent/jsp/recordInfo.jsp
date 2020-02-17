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
				var deviceName = "${deviceName}";
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
				var profileName = "${profileName}";
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
		/* height: 106px;
		border: none;
		font-size: 300px;
		opacity: 0;
		filter: alpha(opacity = 0);
		cursor: pointer;
		position: absolute; */
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
	
	.Content-Main .sel{
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
</head>

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
					<form action="${pageContext.request.contextPath }/record_save.action" method="post" class="form-userInfo" enctype="multipart/form-data">
						<h2>治疗记录信息</h2>
						<p>
							<!--<div class="fileInputContainer">
	                    <input class="fileInput" id="" type="file" name="">
	                </div>-->
					<label>
	                    <span>治疗日期：</span>
	                    <input type="text" name="record_date" value="${tempRecord.record_date }" placeholder="请填写治疗日期">
	                </label>
					<label>
	                    <span>治疗时长：</span>
	                    <input type="text" name="record_duration" value="${tempRecord.record_duration }" placeholder="请填写康复治疗时长">
	                </label>
					<label>
	                    <span>治疗得分：</span>
	                    <input type="text" name="record_score" value="${tempRecord.record_score }" placeholder="请填写康复治疗得分">
	                </label>
					<label>
	                    <span>治疗数据：</span>
	                    <input type="file" name="upload" class="fileInput"/>
	                </label>
					<label>
	                    <span>治疗标签：</span>
	                    <input type="file" name="upload" class="fileInput"/>
	                </label>
					<label>
	                    <span>设备名称:</span>
	                    <select class="sel" name="device.dict_id" id="deviceId">
						</select>
	                </label>
					<label>
	                    <span>配置名称:</span>
	                    <select class="sel" name="profile.dict_id" id="profileId">
						</select>
	                </label>
					<label>
	                    <input type="submit" class="button" value="确定">
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
			<%-- <div style="margin-top: 50px;">
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
			</div> --%>
			<div
				style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
				Copyright &copy; 2012-2019 上海大学443  版权所有</div>
		</div>
	</div>
</body>

</html>