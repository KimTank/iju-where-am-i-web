<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="Pack01.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="Pack01.BbsDAO"%>
<%@ page import="Pack01.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<head>
<!-- jquery사용하기위한 구문 -->
<script src="//code.jquery.com/jquery-3.3.1.js"></script>
<!--  -->
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href=".assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>글 쓰기</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-iropke-batang/1.2/font-iropke-batang.css">
<style>
body {
	padding-top: 90px;
}

td {
	color: white;
}

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
	<%
		String id = (String) session.getAttribute("login"); //세션넘긴것을 얻어와서 제어하기위해 생성
	%>
	<%
		String strReferer = request.getHeader("referer");
		if (strReferer == null) {
	%>
	<script language="javascript">
		alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
		document.location.href = "t1main";
	</script>
	<%
		return;
		}
	%>
	<script>
	
	</script>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-nontransparent " color-on-scroll="400">
		<div class="container">
			<div class="navbar-translate">
				<table style="width: 580px">
					<tr style="width: 580px">
						<td style="width: 70px">
							<a class="navbar-brand; b;" href="index.jsp"><img class="n-logo" src="./assets/img/radar.png" alt=""></a>
						</td>
						<td style="width: 70px"></td>
						<td>
							<a style="width: 100px" class="navbar-brand; b;" href="index.jsp" rel="tooltip" data-placement="bottom">IRTLS란?</a>
						</td>
						<td style="width: 70px"></td>
						<%
							if (id != null) {
						%>
						<td>
							<a style="width: 100px" class="navbar-brand; b;" href="t1indoor">Indoor</a>
						</td>
						<td style="width: 70px"></td>
						<td>
							<a style="width: 100px" class="navbar-brand; b;" href="t1bbs" rel="tooltip" data-placement="bottom">문의</a>
						</td>
						<%
							} else {
							}
						%>
					</tr>
				</table>

				<button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-bar bar1"></span> <span class="navbar-toggler-bar bar2"></span> <span class="navbar-toggler-bar bar3"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
				<ul class="navbar-nav">
					<% if(id!=null){ %>
					<li class="nav-item"><a class="nav-link" href="t1update?id=<%=id%>"> <i class="now-ui-icons loader_gear"></i>
							<p class="a">회원정보수정</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="t1logout"> <i class="now-ui-icons sport_user-run"></i>
							<p class="a">로그아웃</p>
					</a></li>
					<%}else{%>
					<li class="nav-item"><a class="nav-link" href="t1signup"> <i class="now-ui-icons files_box"></i>
							<p class="a">회원가입</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="t1login"> <i class="now-ui-icons files_paper"></i>
							<p class="a">로그인</p>
					</a></li>
					<%} %>

				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div style="background-image: url('./assets/img/bbs.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
		<!-- 게시판부분 -->
		<form method="post" action="t2writeAction">
			<div class="container"style="padding-top: 30px;padding-bottom: 30px">
				<div class="row">
					<div data-background-color="orange" style="width: 1500px;">
						<table class="table table-striped" style="text-align: center; border: 1px solid #F5A9D0">
							<thead>
								<tr>
									<th style="background-color: #F8E0EC; text-align: center;">글쓰기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input class="form-control" type="text" placeholder="글 제목" name="bbsTitle" maxlength="50">
									</td>
								</tr>
								<tr>
									<td>
										<textarea class="form-control" type="text" placeholder="글 내용" name="bbsContent" maxlength="8192" style="height: 500px"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<a href="t1bbs" class="btn btn-primary">목록</a> <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="col-lg-4"></div>
	</form>
	<!-- 마지막  -->
	<footer class="footer" style="background-color: orange">
			<div class="container">
				<div class="copyright" style="color: white;">
					<script>
						document.write(new Date().getFullYear())
					</script>
					, 미래지향형 실내 측위 시스템<a href="#" style="color: white;">지금어디GO</a>
				</div>
			</div>
		</footer>
	</div>
</body>
<!--   Core JS Files   -->
<!-- <script src="./assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script> -->
<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="./assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
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