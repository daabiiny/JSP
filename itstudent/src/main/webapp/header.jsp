<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="itstudent.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${ItstudentDAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>itstudent</title>
<style>
	body {
		background-color: #eee;
		font-size: 17px;
	}
	header, section {
		width: 900px;
		margin: 0 auto;
		background-color: white;
		box-sizing: border-box;
		
	}
	h1, h2, h3, h4, h5, h6, ul {
		margin-top: 0;
		margin-bottom: 0;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	h1 {
		text-align: center;
	}
	nav > ul {
		display: flex;
		justify-content: space-between;
		list-style: none;
		padding-left: 0;
		width: 500px;
		margin: 20px auto;
	}
	table {
		border: 2px solid black;
		border-collapse: collapse;
		margin: 20px auto;
		width: 600px;
	}
	th, td {
		padding: 5px;
		text-align: center;
	}
	tr {
		border-bottom: 1px solid grey;
	}

</style>

</head>
<body>

<header>
	<h1><a href="${cpath }">IT STUDENT</a></h1>
	<div style="text-align: right; padding-right: 20px; height: 30px;">
		${login.userid }이 로그인하셨습니다.
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">목록</a></li>
			<li><a href="${cpath }/join.jsp">추가(회원가입)</a></li>
			
			<c:if test="${not empty login }">
				<li><a href="${cpath }/logout.jsp">로그아웃</a></li>
			</c:if>
			<c:if test="${empty login }">
				<li><a href="${cpath }/login.jsp">로그인</a></li>
			</c:if>
		</ul>
	</nav>
	
</header>


</body>
</html>