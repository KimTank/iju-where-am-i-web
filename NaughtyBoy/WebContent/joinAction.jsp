<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 자바빈으로 DAO에서 제어한 값이 넘어올 수 있도록 합니다 -->
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="userId" />
<jsp:setProperty name="member" property="userPassword" />
<jsp:setProperty name="member" property="userGender" />
<jsp:setProperty name="member" property="userName" />
<jsp:setProperty name="member" property="userBirth" />
<jsp:setProperty name="member" property="userCell" />
<jsp:setProperty name="member" property="userEmail" />
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
		if (userId != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}

		//회원가입 처리
		if (member.getUserId() == null || member.getUserPassword() == null || member.getUserGender() == null
				|| member.getUserName() == null || member.getUserBirth() == null || member.getUserCell() == null
				|| member.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {//빈칸이 없을때
			MemberDAO memberDAO = new MemberDAO();//받아온값으로 제어하기위해서 객체생성
			int result = memberDAO.join(member);//회원가입 양식에 적은 폼 가져옵니다.
			if (result == -1) {//데이터베이스 오류가 났을때(아이디에 프라이머리 키 넣어서 중복일때 일것임) 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('중복된 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {//아이디 중복되는거 빼고 전부
				//세션
				session.setAttribute("userId", member.getUserId());
				PrintWriter script = response.getWriter();
				//
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>