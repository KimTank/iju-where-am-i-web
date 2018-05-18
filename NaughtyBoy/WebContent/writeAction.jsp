<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 자바빈으로 DAO에서 제어한 값이 넘어올 수 있도록 합니다 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!-- ------------------------------------- -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹</title>
</head>
<body>
	<%
		//세션처리
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			//사용자가 글 제목을 입력하지 않았을 시
			if (bbs.getBbsTitle() == null || bbs.getBbsContent()==null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {//빈칸이 없을때
				BbsDAO bbsDAO = new BbsDAO();//받아온값으로 제어하기위해서 객체생성
				int result = bbsDAO.write(bbs.getBbsTitle(), userId, bbs.getBbsContent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {//아이디 중복되는거 빼고 전부
					//세션
					PrintWriter script = response.getWriter();
					//
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
			}
		}
		%>

		
</body>
</html>