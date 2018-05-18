<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 자바빈으로 DAO에서 제어한 값이 넘어올 수 있도록 합니다 -->
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="userId"/>
<jsp:setProperty name="member" property="userPassword"/>
<!-- ------------------------------------- -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹</title>
</head>
<body>
	<%
	//세션값제어
	String userId=null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	if(userId != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	
	//로그인 제어
		MemberDAO memberDAO = new MemberDAO();//받아온값으로 제어하기위해서 객체생성
	int result = memberDAO.login(member.getUserId(), member.getUserPassword());//아까 분류한 것(-2~1) 받아옴
	if (result ==1) {//로그인에 성공했을때
		//세션생성
		session.setAttribute("userId", member.getUserId());
		PrintWriter script = response.getWriter();
		//
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	} else if(result == 0 ){//비밀번호가 틀릴때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -1 ){//아이디가 없음
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -2 ){//데이터베이스 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('서버와 응답이 없습니다. 문의 부탁드립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>