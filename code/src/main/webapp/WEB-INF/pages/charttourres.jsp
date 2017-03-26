<!-- === BEGIN HEADER === -->
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<!-- Title -->
<title>NY Travel Company</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Styles -->
<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 500px;
	font-size: 11px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.css"
	rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="resources/css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/responsive.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/table.css" rel="stylesheet">
<!-- Google Fonts-->
<link
	href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=PT+Sans"
	type="text/css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="body-bg">
		<ul class="social-icons pull-right hidden-xs">
			<li class="social-youtube"><a href="#" target="_blank"
				title="Youtube"></a></li>
			<li class="social-skype"><a href="#" target="_blank"
				title="Skype"></a></li>
			<li class="social-facebook"><a href="#" target="_blank"
				title="Facebook"></a></li>
			<li class="social-googleplus"><a href="#" target="_blank"
				title="GooglePlus"></a></li>
		</ul>
		<div id="pre-header" class="container" style="height: 40px">
			<!-- Spacing above header -->
		</div>
		<div id="header">
			<div class="container">
				<div class="row">
					<!-- Logo -->
					<div class="logo">
						<a href="${pageContext.request.contextPath }/home" title=""> <img
							src="resources/img/logo.png" alt="Logo" />
						</a>
					</div>
					<!-- End Logo -->
				</div>
			</div>
		</div>
		<!-- Back To Top -->
		<div title="Về đầu trang" onmouseover="this.style.color='#590059'"
			onmouseout="this.style.color='#004993'" id="top-up">
			<img src="resources/img/hot-air-balloon.png" width="64px"
				height="auto"></img>
		</div>
		<!-- End Back To Top -->
		<!-- Top Menu -->
		<div id="hornav" class="container no-padding">
			<div class="row">
				<div class="col-md-12 no-padding">
					<div class="text-center visible-lg">
						<ul id="hornavmenu" class="nav navbar-nav">
							<li><a href="${pageContext.request.contextPath}/managetour"
								class="fa-cogs">Quản Lý Tour</a></li>
							<li><a
								href="${pageContext.request.contextPath}/manageregister"
								class="fa-list-ul">Quản Lý Đăng Ký</a></li>
							<li><a href="${pageContext.request.contextPath}/manageuser"
								class="fa-users">Quản Lý Tài Khoản</a></li>
							<li><a class="fa-bar-chart-o">Quản Lý Dữ Liệu</a>
								<ul>
									<li><a href="<c:url value="/import" />">Import</a></li>
									<li><a href="<c:url value="/export" />">Export</a></li>
									<li class="parent"><span>Thống kê</span>
										<ul>
											<li><a href="<c:url value="/toursales" />">Doanh số
													tour</a></li>
											<li><a href="<c:url value="/tourres" />">Tour đăng
													ký</a></li>
										</ul></li>
								</ul></li>
							<li><span class="fa-user"> ${userName}</span>
								<ul>
									<li><a href="<c:url value="/logout" />">Đăng xuất</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Top Menu -->

		<div id="post_header" class="container" style="height: 40px">
			<!-- Spacing below header -->
		</div>
		<div id="content-top-border" class="container"></div>
		<!-- === END HEADER === -->
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container background-white">
				<h1 align="center">Biểu đồ doanh tình hình bán tour</h1>
				<div class="container">
					<div class="row">
						<form role="form" class="form-inline">
							<div class="form-group">
								<label for="selectUser"
									style="float: left; padding: 6px 12px 2px 12px;">Năm:</label>
								<select id="selectUser" style="width: auto;"
									class="form-control selectWidth" name="year">
									<option class="">2016</option>
									<option class="">2017</option>
									<option class="">2018</option>
								</select>
							</div>
							<div class="btn-group">
								<button class="btn btn-default">Chọn</button>
							</div>
						</form>
					</div>
					<!-- Chart code -->
					<script>
						var chart = AmCharts.makeChart("chartdiv", {
							"type" : "pie",
							"theme" : "light",
							"dataProvider" : [ {
								"title" : "Số tour hủy",
								"value" : 4852
							}, {
								"title" : "Số tour đăng ký",
								"value" : 9899
							} ],
							"titleField" : "title",
							"valueField" : "value",
							"labelRadius" : 5,

							"radius" : "42%",
							"innerRadius" : "60%",
							"labelText" : "[[title]]",
							"export" : {
								"enabled" : true
							}
						});
					</script>

					<div class="row margin-vert-40">
						<div id="chartdiv"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- === END CONTENT === -->
		<%@ include file="adminfooter.jsp"%>