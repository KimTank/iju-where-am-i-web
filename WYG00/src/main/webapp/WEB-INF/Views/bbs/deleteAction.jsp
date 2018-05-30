<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Pack01.BbsDAO"%>
<%@ page import="Pack01.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹</title>
</head>
<body>
	<%
		//세션처리
		String userId = (String) session.getAttribute("login"); //세션넘긴것을 얻어와서 제어하기위해 생성
		if (session.getAttribute("login") != null) {
			userId = (String) session.getAttribute("login");
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 't1login'");
			script.println("</script>");
		}

		//삭제 액션
		int bbsId = 0;
		if (request.getParameter("bbsId") != null) {
			bbsId = Integer.parseInt(request.getParameter("bbsId"));
		}
		if (bbsId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 't1bbs'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsId);//해당글의 구체적인 내용을 가져올 수 있도록 한다
		if (!userId.equals(bbs.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('작성자만 수정할 수 있습니다.')");
			script.println("location.href='t1bbs");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();//받아온값으로 제어하기위해서 객체생성
			int result = bbsDAO.delete(bbsId);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {//아이디 중복되는거 빼고 전부
				//세션
				PrintWriter script = response.getWriter();
				//
				script.println("<script>");
				script.println("location.href = 't1bbs'");
				script.println("</script>");
			}
		}
	%>


</body>
</html>