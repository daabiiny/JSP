<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board2.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day20 - board</title>
<style>
	header, main, h1, h2 {
		text-align: center;
	}
	header, main {
		width: 900px;
		margin: auto;
	}
	table#boardList,
	table#boardView {
		border-collapse: collapse;
		width: 900px;
		margin: 20px auto;
	}
	table#boardList > thead {
		background-color: navy;
		color: white;
	}
	table#boardList > tbody > tr  {
		border-bottom: 1px solid grey;
		transition-duration: 1s;
	}
	table#boardList > tbody > tr:hover  {
		background-color: lightblue;
		transition-duration: 1s;
	}
	table#boardList td,
	table#boardList th {
		padding: 10px;
		text-align: center;
	}
	table#boardList > thead > tr > th:nth-child(1) {	width: 10%;	}
	table#boardList > thead > tr > th:nth-child(2) {	width: 50%;	}
	table#boardList > thead > tr > th:nth-child(3) {	width: 10%;	}
	table#boardList > thead > tr > th:nth-child(4) {	width: 10%;	}
	table#boardList > thead > tr > th:nth-child(5) {	width: 20%;	}
	
	table#boardList > tbody > tr > td:nth-child(2)	{	text-align: left;	}
	
	.sb {
		width: 900px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	table#boardList a {
/* 		제목만 누르는게 아니라 공백부분 선택해도 링크 작동 */
		display: inline-block;
	}
	table#boardList a:hover {
		text-decoration: none;
	}
	div#login {
		text-align: right;
		width: 900px;
		margin: 10px auto;
	}
	.bold {
		font-weight: bold;
		color: blue;
	}
	
</style>
</head>
<body>

<header>
	<h1><a href="${cpath}"> ✨ 다빈이네 게시판 ✨</a></h1>
	<div id="login">
		<c:if test="${empty login }">
		<form method="POST" action="login-action.jsp">
		<p>
			<input type="text" name="userid" placeholder="아이디">
			<input type="password" name="userpw" placeholder="비밀번호">
			<input type="submit" value="로그인">
			<a href="${cpath }/join.jsp"><input type="button" value="회원가입"></a>
		</p>
	</form>	
	</c:if>
	<c:if test="${not empty login }">
		<p>
			<a href="${cpath }/mypage.jsp">${login.userid }</a> 
            ( ${login.username } )
            <a href="${cpath }/logout.jsp"><button>로그아웃</button></a>
		</p>
	</c:if>
	
	</div>	
	
	
</header>

