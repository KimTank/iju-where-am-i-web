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
		//업데이트
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
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
		if (!userId.equals(bbs.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('작성자만 수정할 수 있습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
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
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">정보수정</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsId=<%=bbsId%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #F5A9D0">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #F8E0EC; text-align: center;">내용 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="글 내용" name="bbsContent" maxlength="8192"
									style="height: 500px"><%=bbs.getBbsContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="내용 수정">
			</form>
		</div>
	</div>
	<div class="col-lg-4"></div>
</body>
</html>