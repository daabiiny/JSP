<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="subway.SubwayDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>

<style>

	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 1170px;
		margin: 0 auto;
		border: 1px solid red;
	}
	.sb {
		display: flex;
		justify-content: space-between;
	} 
	.sa {
		display: flex;
		justify-content: space-around;
	}
	div.logo {
		display: flex;
		justify-content: flex-end;
	}
	div.logoimage {
		
	}
	div.logoright {
    	width: 200px;
	}
	nav > ul {
		display: flex;
		list-style: none;
	}
	div.box {
		border: 1px solid blue;
		display: flex;
		flex-flow: wrap;
		text-align: auto;
		
	}
	div.item {
		border: 1px dashed pink;
		box-sizing: border-box;
		width: 385px;
	}
	div.image {
		text-align: center;
	}
	div.name {
		text-align: center;
	}
	
</style>
</head>
<body>

<div class="headline frame">
	<div class="logo">
		<div class="logoimage">
			<a href="${cpath }"><img src="https://www.subway.co.kr/images/common/logo_w.png"></a>
		</div>
		<div class="logoright frame sa">
			<h4>로그인</h4>
			<h4>회원가입</h4>	
			<h4>🌐</h4>	
		</div>
	</div>
</div>
<div class="category frame">
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">All</a></li>
			<li><a href="${cpath }/list.jsp?category=클래식">클래식</a></li>
			<li><a href="${cpath }/list.jsp?category=프레쉬라이트">프레쉬라이트</a></li>
		</ul>
	</nav>
</div>


</body>
</html>