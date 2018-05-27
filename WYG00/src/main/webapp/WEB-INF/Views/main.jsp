<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href=".assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>지금어디Go 관제소</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/font-iropke-batang/1.2/font-iropke-batang.css">
<style>
@import
	url('//cdn.jsdelivr.net/font-iropke-batang/1.2/font-iropke-batang.css')
	;

p {
	font-size: 15px;
}

.a {body { font-family:'Iropke Batang', serif;
	
}

}
a {
	font-size: 25px;
}

.b {body { font-family:'Iropke Batang', serif;
	
}
}
</style>
<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./assets/css/demo.css" rel="stylesheet" />
</head>

<body class="index-page sidebar-collapse">
<%String id = (String)session.getAttribute("login"); //세션넘긴것을 얻어와서 제어하기위해 생성%>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
		<div class="container">
			<div class="navbar-translate">
				<table style="width: 580px">
					<tr style="width: 580px">
						<td style="width: 70px"><a class="navbar-brand; b;" href="index.jsp"
							><img class="n-logo" src="./assets/img/now-logo.png" alt=""></a>
							</td>
						<td style="width: 70px"></td>
						<td><a  style="width: 100px"class="navbar-brand; b;" href="index.jsp"
							rel="tooltip" data-placement="bottom">IRTLS란?</a></td>
						<td style="width: 70px"></td>
						<%
						if(id!=null) {
						%>
						<td><a  style="width: 100px"class="navbar-brand; b;" href="t1indoor"
							>Indoor</a></td>
						<td style="width: 70px"></td>
						<td><a  style="width: 100px"class="navbar-brand; b;" href="index.jsp"
							rel="tooltip" data-placement="bottom">문의</a></td>
						<%}else{} %>
					</tr>
				</table>

				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar bar1"></span> <span
						class="navbar-toggler-bar bar2"></span> <span
						class="navbar-toggler-bar bar3"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse justify-content-end"
				id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
				<ul class="navbar-nav">
					<% if(id!=null){ %>
					<li class="nav-item"><a class="nav-link" href="t1update">
							<i class="now-ui-icons loader_gear"></i>
							<p class="a">회원정보수정</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="t1logout">
							<i class="now-ui-icons sport_user-run"></i>
							<p class="a">로그아웃</p>
					</a></li>
					<%}else{%>
					<li class="nav-item"><a class="nav-link" href="t1signup">
							<i class="now-ui-icons files_box"></i>
							<p class="a">회원가입</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="t1login"> <i
							class="now-ui-icons files_paper"></i>
							<p class="a">로그인</p>
					</a></li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div class="wrapper">
		<div class="page-header clear-filter" filter-color="orange">
		<!-- 배경그림 -->
			<div class="page-header-image" data-parallax="true"
				style="background-image: url('./assets/img/kkk1.jpg');"></div>
			<div class="container">
				<div class="content-center brand">
					<%
					if(id==null) {
					%>
					<h3>당신의 사업장을 위한 맞춤 Indoor Real Time Location System</br>
					Indoor 관측 시스템사용을 위하여 로그인을 해주세요 :D</h3>
					<%
					} else {
					%>
					<h1>"<%=id %>"님의 접속을 환영합니다 :D</h1>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<!-- 마지막  -->
		        <footer class="footer">
            <div class="container">
                <div class="copyright" style="color: white;">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, Designed by
                    <a href="#" style="color: white;">정우령</a>. Coded by
                    <a href="#" style="color: white;">김창일 김태윤</a>.
                </div>
            </div>
        </footer>
	</div>
</body>
<!--   Core JS Files   -->
<script src="./assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="./assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./assets/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./assets/js/plugins/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// the body of this function is in assets/js/now-ui-kit.js
		nowuiKit.initSliders();
	});

	function scrollToDownload() {
		if ($('.section-download').length != 0) {
			$("html, body").animate({
				scrollTop : $('.section-download').offset().top
			}, 1000);
		}
	}
</script>

</html>