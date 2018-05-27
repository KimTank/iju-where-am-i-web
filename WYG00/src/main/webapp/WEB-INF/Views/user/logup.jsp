<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>회원정보수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font: 20px Montserrat, sans-serif;
	line-height: 1.8;
	color: #f5f6f7;
}

p {
	font-size: 16px;
}

.margin {
	margin-bottom: 45px;
}

.bg-1 {
	background-color: #1abc9c; /* Green */
	color: #ffffff;
}

.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

.bg-3 {
	background-color: #ffffff; /* White */
	color: #555555;
}

.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
	color: #fff;
}

.bg-5 {
	background-color: #cc00cc; /* Black Purple */
	color: #fff;
}

.container-fluid {
	padding-top: 70px;
	padding-bottom: 70px;
}

.navbar {
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 12px;
	letter-spacing: 5px;
}

.navbar-nav  li a:hover {
	color: #1abc9c !important;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">메인</a> <a class="navbar-brand"
					href="#"> </a> <a class="navbar-brand" href="#">견적문의</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">로그인</a></li>
					<li><a href="#">정보수정</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- First Container -->
	<div class="container-fluid bg-5 text-center">
		<h3 class="margin">당신의 내일을 위해 Team HFT는 오늘도 야근합니다 :D</h3>

		<h3>
			<button style="background-color: black">확인</button>
			<Button style="background-color: black" onclick="history.back()">취소</Button>
		</h3>
	</div>

	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
		<p>
			made by Humanity From Technology <a
				href="http://www.president.go.kr/">Future has more chance for
				evolution</a>
		</p>
	</footer>

</body>