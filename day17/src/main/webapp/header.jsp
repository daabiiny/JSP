<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>


<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day17</title>
<style>
	h2, h3, h4 {
		text-align: center;
	}
	h5 {
		text-align: right;
	}
	fieldset {
		text-align: center;
	}
	form {
		text-align: center;
	}
	div.boardtable {
		display: flex;
		text-align: center;
		justify-content: center;
		align-items: center;
	}
	div.writeaction {
		display: flex;
		text-align: center;
		justify-content: center;
	}
	div.writeaction > a {
		display: flex;
		text-align: center;
		justify-content: center;
		align-items: center;
		margin-left: 20px;
	}
	div.modify {
		display: flex;
		justify-content: space-between;
	}

</style>

</head>
<body>

<header>
	<h1 style="display: flex; justify-content: center;"><a href="${cpath }">★ 다빈월드 ★</a></h1>
	<div style="text-align: right;">${login.userid }</div>
	<nav>
		<ul style="display: flex; list-style: none; justify-content: space-around;">
			<li><a href="${cpath }/login.jsp">로그인</a></li>
			<li><a href="${cpath }/logout.jsp">로그아웃</a></li>
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/withdraw.jsp">회원탈퇴</a></li>
			<li><a href="${cpath }/board.jsp">게시판</a></li>
		</ul>
	</nav>
	
</header>


</body>
</html>