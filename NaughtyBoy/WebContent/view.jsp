<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 반응형 웹이든 앱이든 어디서나 자동으로 화면을 조정해줌 -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹</title>
</head>
<body>
	<%
		//세션
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		//게시판글쓰기 내용
		int bbsId = 0;
		if (request.getParameter("bbsId") != null) {
			bbsId = Integer.parseInt(request.getParameter("bbsId"));
		}
		if (bbsId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsId);//해당글의 구체적인 내용을 가져올 수 있도록 한다
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<nav class="navbar navbar-default" style="background-color: #FA58AC;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">login.jsp화면</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a class="active" href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if (userId == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">정보수정</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #F5A9D0">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #F8E0EC; text-align: center;">견적 내용
							확인하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">제목</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "</br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserId()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 4) + "년 " + bbs.getBbsDate().substring(5, 7) + "월 "
					+ bbs.getBbsDate().substring(8, 10) + "일 " + bbs.getBbsDate().substring(11, 13) + ":"
					+ bbs.getBbsDate().substring(14, 16) + ":" + bbs.getBbsDate().substring(17, 19)%></td>
					</tr>
					<tr>
						<td>내용</td>
						<!-- 특수문자 기입가능하게 함 -->
						<td colspan="2" style="min-heght: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "</br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if (userId != null && userId.equals(bbs.getUserId())) {
			%>
			<a href="update.jsp?bbsId=<%=bbsId%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsId=<%=bbsId%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	<div class="col-lg-4"></div>
</body>
</html>