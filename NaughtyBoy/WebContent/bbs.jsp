<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 반응형 웹이든 앱이든 어디서나 자동으로 화면을 조정해줌 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decordration: none;
}
</style>
</head>
<body>
	<%
		//세션부분
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		//게시판 페이지 알수있게
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
						<th style="background-color: #F8E0EC; text-align: center;">번호</th>
						<th style="background-color: #F8E0EC; text-align: center;">제목</th>
						<th style="background-color: #F8E0EC; text-align: center;">작성자</th>
						<th style="background-color: #F8E0EC; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						
						<%	
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<td><%=list.get(i).getBbsId()%></td>
						<td><a href="view.jsp?bbsId=<%=list.get(i).getBbsId()%>">
								<%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "</br>")%>
						</a></td>
						<td><%=list.get(i).getUserId()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 4) + "년 " + list.get(i).getBbsDate().substring(5, 7)
						+ "월 " + list.get(i).getBbsDate().substring(8, 10) + "일 "
						+ list.get(i).getBbsDate().substring(11, 13) + ":" + list.get(i).getBbsDate().substring(14, 16)
						+ ":" + list.get(i).getBbsDate().substring(17, 19)%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				System.out.println(pageNumber);
				if (pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
				}
				if (bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<div class="col-lg-4"></div>
</body>
</html>