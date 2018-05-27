<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<head>
<!-- jquery사용하기위한 구문 -->
<script src="//code.jquery.com/jquery-3.3.1.js"></script>
<!-- 유효성검사를 위한 플러그인 -->
<script type="text/javascript" src="js/plugins/validation/jquery.validate.min.js"></script>
<!-- 유효성검사 오류시 나타내줄 빨간경고문구 표시 -->
<!-- 	<style type="text/css">
        #iform label.error { margin-left: 10px; color:red; }
    </style>	 --> 
<script type="text/javascript">
//아이디중복부분체크
function checkId() {
	var inputed = document.getElementById("iid").value;
	var id = document.getElementById("iid");
	var btn = document.getElementById("ibtn1");
	
	$.ajax({
		type: "POST",
		dataType : "JSON",
		data : {
			userId : inputed
		},
		url : "checkId.jy",
		success : function(data) {
			if((data.idCheck==1||inputed=="")) {
				id.style.backgroundColor="#aa4444"; 
				$btn = $('#ibtn1').attr('disabled', true);
			} else {
				id.style.backgroundColor="#44aa44";
				nullCheck();//필수값안들어갔을때 버튼제어
			}
		},
		error : function(data) {//실패하면 error
			alert(3);
		}
	});
}

function nullCheck() {
	var pass = document.getElementById("ipass");
	var passR = document.getElementById("ipassR");
	var passInput = document.getElementById("ipass").value;
	var passRInput = document.getElementById("ipassR").value;
	var btn = document.getElementById("ibtn1");
	if((passInput==passRInput&&passInput==""&&passRInput=="")||passInput!=passRInput) {
		nameCheck();
		pass.style.backgroundColor="#aa4444";
		passR.style.backgroundColor="#aa4444";
	} else if(passInput==passRInput) {
		nameCheck();
		pass.style.backgroundColor="#44aa44";
		passR.style.backgroundColor="#44aa44";
	}
}
//이름빈칸일때제어
function nameCheck() {
	var nameInput = document.getElementById("iname").value;
	var name = document.getElementById("iname");
	var btn = document.getElementById("ibtn1");
	if(nameInput=="") {
		$btn = $('#ibtn1').attr('disabled', true);
		name.style.backgroundColor="aa4444";
	} else {
		$btn = $('#ibtn1').attr('disabled', false);
		name.style.backgroundColor="44aa44";
	}
}

//---------------------submit버튼 클릭할때 잘못된값 있을 시 alert띄우기-------------------------------
        /* $(document).ready(function () {          
        //기본형태
        $('#iform').validate(); //유효성 검사를 적용
       
        //validate signup form on keyup and submit
        //확장옵션
        $('#iform').validate({
            rules: {
                iid:{required:true, minlength:5, maxlength:10},
                ipass: {required:true, minlength:5, maxlength:20,}
                ipassR: {required:true, minlength:5, maxlength:20, equalTo:'#ipass'},               
                iname: {required:true, minlength:2, maxlength:5,},
                iemail: {required:true, email:true},
                icell: {required:true, digits:true, minlength:10, maxlength:11,}
            },
            messages: {
                iid: {
                     required:"아이디를 입력하시오.",
                     minlength: jQuery.format("아이디는 {0}자 이상 입력해주세요!"),
                     maxlength: jQuery.format("아이디는 {0}자 이하 입력해주세요!")
                },
                ipass: {
                    required:"암호를 입력하시오.",
                    minlength: jQuery.format("암호는 {0}자 이상 입력해주세요!"),
                    maxlength: jQuery.format("암호는 {0}자 이하 입력해주세요!")
               },
                ipassR: {
                    required: "암호확인를 입력하시오.",
                    minlength: jQuery.format("암호는 {0}자 이상 입력해주세요!"),
                    maxlength: jQuery.format("암호는 {0}자 이하 입력해주세요!")
                    equalTo:"암호를 다시 확인하세요"
                },
                iname: {
                	required:"이름을 입력하시오."
              		minlength: jQuery.format("암호는 {0}자 이상 입력해주세요!"),
					maxlength: jQuery.format("암호는 {0}자 이하 입력해주세요!")
                },
                iemail: {
                    required:"이메일을 입력하시오.",
                    email:"올바른 이메일을 입력하시오."
                },
                icell: {
                	required: "전화번호를 입력하시오.",
                	digits: "숫자만 입력하시오.",
                    minlength: jQuery.format("암호는 {0}자 이상 입력해주세요!"),
                    maxlength: jQuery.format("암호는 {0}자 이하 입력해주세요!")
                }
            },
            submitHandler: function (frm){
                frm.submit();   //유효성 검사를 통과시 전송
            },
            success: function(e){
                //
            }
           
        });
      }); */ //end ready()
</script>
<!--  -->
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href=".assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>회원가입</title>
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
	<%
		String id = (String) session.getAttribute("login"); //세션넘긴것을 얻어와서 제어하기위해 생성
	%>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
		<div class="container">
			<div class="navbar-translate">
				<table style="width: 580px">
					<tr style="width: 580px">
						<td style="width: 70px"><a class="navbar-brand; b;"
							href="index.jsp"><img class="n-logo"
								src="./assets/img/now-logo.png" alt=""></a></td>
						<td style="width: 70px"></td>
						<td><a style="width: 100px" class="navbar-brand; b;"
							href="index.jsp" rel="tooltip" data-placement="bottom">IRTLS란?</a></td>
						<td style="width: 70px"></td>
						<%
							if (id != null) {
						%>
						<td><a style="width: 100px" class="navbar-brand; b;"
							href="t1indoor">Indoor</a></td>
						<td style="width: 70px"></td>
						<td><a style="width: 100px" class="navbar-brand; b;"
							href="index.jsp" rel="tooltip" data-placement="bottom">문의</a></td>
						<%
							} else {
							}
						%>
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
					<%
						if (id != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="t1update">
							<i class="now-ui-icons loader_gear"></i>
							<p class="a">회원정보수정</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="t1logout">
							<i class="now-ui-icons sport_user-run"></i>
							<p class="a">로그아웃</p>
					</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="t1signup">
							<i class="now-ui-icons files_box"></i>
							<p class="a">회원가입</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="t1login"> <i
							class="now-ui-icons files_paper"></i>
							<p class="a">로그인</p>
					</a></li>
					<%
						}
					%>

				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div class="page-header" filter-color="orange">
		<div class="page-header-image"
			style="background-image: url('./assets/img/signup.jpg');"></div>
		<div class="container">
			<div class="col-md-4 content-center">
				<div class="card card-login card-plain">
					<form class="form" id="iform" method="post" action="t2signup"
						style="width: auto 100%;">
						<div css="header header-primary text-center">
							<div class="logo-container">
								<img src="../assets/img/now-logo.png" alt="">
							</div>
						</div>
						<div class="pull-center">
							<h1>
								<a style="font-size: smaller;">회원가입</a>
							</h1>
						</div>
						<div class="content">
							<table style="width: 100%;">
								<tr>
									<!-- 아이디 첫째줄 00 -->
									<td style="width: 47%;">
									 <font color=white>아이디(필수)</font> 
										<div class="input-group form-group-no-border input-lg">
											<span class="input-group-addon"> <i
												class="now-ui-icons business_badge"></i>
											</span> <input type="text" class="form-control" placeholder="아이디"
												id="iid" name="id" maxlength="10" oninput="checkId()"/>
										</div>
									</td>
									<!-- 중간 -->
									<td style="width: 6%;"></td>
									<!-- 비밀번호 두번째줄 10-->
									<td style="width: 47%;">
									<font color=white>비밀번호(필수)</font> 
										<div class="input-group form-group-no-border input-lg">
											<span class="input-group-addon"> <i
												class="now-ui-icons travel_info"></i>
											</span> <input type="password" placeholder="비밀번호"
												class="form-control" id="ipass" name="pass" maxlength="20"  oninput="checkId()"/>
										</div>
									</td>
								</tr>
								<tr>
									<!-- 비밀번호 확인 12-->
									<td style="width: 47%;">
									<font color=white>비밀번호 확인(필수)</font> 
										<div class="input-group form-group-no-border input-lg">
											<span class="input-group-addon"> <i
												class="now-ui-icons travel_info"></i>
											</span> <input type="password" placeholder="비밀번호 확인"
												class="form-control" id="ipassR" name="passR" maxlength="20"  oninput="checkId()"/>
										</div>
									</td>
									<!-- 중간 -->
									<td style="width: 6%;"></td>
									<!-- 성별구분 -->
									<td style="width: 47%;">
										<font color=white>성별(선택)</font>
										<div class="form-group" id="igender"
											style="text-align: center;">
											<div class="btn-group" data-toggle="buttons">
												<label class="btn btn-primary active"> <input
													type="radio" name="gender" autocomplete="off" value="남자"
													checked onclick="checkId()">남자
												</label> <label class="btn btn-primary"> <input type="radio"
													name="gender" autocomplete="off" value="여자" checked onclick="checkId()">여자
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<!-- 이름 -->
									<td style="width: 47%;">
										<font color=white>이름(필수)</font> 
										<div class="input-group form-group-no-border input-lg">
											<span class="input-group-addon"> <i
												class="now-ui-icons users_circle-08"></i>
											</span> <input type="text" class="form-control" placeholder="이름"
												id="iname" name="name" maxlength="5" oninput="checkId()"/>
										</div>
									</td>
									<!-- 중간 -->
									<td style="width: 6%;"></td>
									<!-- 생일 -->
									<td style="width: 47%;">
										<font color=white>생년월일(선택)</font> 
										<div class="form-group">
											<input
												type="text" name="birth" style="color: white;"
												class="form-control date-picker" value="01/01/1920"
												 data-datepicker-color="primary">
										</div>
									</td>
								</tr>
								<tr>
									<!-- 전화번호 -->
									<td style="width: 47%;">
										<font color=white>전화번호(선택)</font> 
										<div class="input-group form-group-no-border input-lg">
											<span class="input-group-addon"> <i
												class="now-ui-icons users_circle-08"></i>
											</span> <input type="tel" class="form-control" placeholder="전화번호"
												id="icell" name="cell" maxlength="11" oninput="checkId()"/>
										</div>
									</td>
									<!-- 중간 -->
									<td style="width: 6%;"></td>
									<!-- 이메일 -->
									<td style="width: 47%;">
										<font color=white>이메일(선택)</font> 
										<div
											class="input-group form-group-no-border input-lg">
											<span class="input-group-addon"> <i
												class="now-ui-icons users_circle-08"></i>
											</span> <input type="email" class="form-control" placeholder="이메일"
												id="iemail" name="email" oninput="checkId()"/>
										</div></td>
								</tr>
							</table>
						</div>
						<table style="width: 100%">
							<tr>
								<!-- 가입버튼 -->
								<td style="width: 47%">
									<div class="footer text-center">
										<button onclick="inputCheck()" type="submit" disabled="true"
											class="btn btn-primary btn-round btn-lg btn-block" name="btn" 
											id="ibtn1" >회원가입</button>
									</div>						
								</td>
								<!-- 중간 -->
								<td style="width: 6%;"></td>
								<!-- 리셋버튼 -->
								<td style="width: 47%">
									<button type="reset"
										class="btn btn-primary btn-round btn-lg btn-block" id="ibtn2">다시
										작성하기</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- 마지막  -->
		<footer class="footer">
			<div class="container">
				<div class="copyright">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					, Designed by <a href="#">정우령</a>. Coded by <a href="#">김창일</a>, <a
						href="#">김태윤</a>.
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