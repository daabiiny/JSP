<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, movie.*, reply.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="memberDAO" value="${MemberDAO.getInstance() }"/> --%>
<%-- <c:set var="boardDAO" value="${BoardDAO.getInstance() }"/> --%>
<c:set var="movieDAO" value="${movieDAO.getInstance()}"/>
<%-- <c:set var="replyDAO" value="${replyDAO.getInstance() }"/> --%>
<%-- <c:set var="fileUtil" value="${FileUtil.getInstance() }"/> --%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>miniProject</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	header {
		width: 980px;
		margin: 0 auto;
	}
	.sb {
		width: 980px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
	}
	.sa {
		width: 980px;
		margin: 20px auto;
		display: flex;
		justify-content: space-around;
	}
	div#logo > img {
		height: 50px;
	}
	div#logocontent {
		width: 500px;
	}
	div#logocontent > nav > ul {
	 	display: flex;
	 	list-style: none;
	 	justify-content: space-between;
	}
	div#logocontent > nav > ul > li {
		padding: 10px;
	}
	div#menu {
		width: 980px;
		margin: 0 auto;
	}
	div#movieVideo {
		border: 1px solid red;
		height: 500px;
		margin: 20px auto;
	}
	div#movieList > img {
		height: 100px;
	}
</style>

</head>
<body>

<header>
	<div class="sb">
		<div id="logo">
		<a href="${cpath }"></a><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
		</div>
		<div id="logocontent">
			<nav>
				<ul>
					<li><a href="${cpath }/login.jsp">로그인</a></li>
					<li><a href="${cpath }/join.jsp">회원가입</a></li>
					<li><a href="${cpath }/mypage.jsp">MY CGV</a></li>
				</ul>
			</nav>
		</div>
	</div>

</header>

</body>
</html>