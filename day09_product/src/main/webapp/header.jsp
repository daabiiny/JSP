<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<jsp:useBean id="dao" class="product.ProductDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day09.jsp</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 1280px;
		margin: 0 auto;
/* 		border: 1px dashed red; */
	}
	nav > ul {
		display: flex;
		width: 350px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
	}
	div.sb {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	div.sa {
		display: flex;
		justify-content: space-around;
	}
	div.detail {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-content: center;
		text-align: center;
	}
	

</style>

</head>
<body>

<div class="frame">
	<h1>🥪 다빈이의 점심메뉴 리스트 🍱</h1>
	
</div>
<div class="list frame">
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li>
		</ul>
	</nav>
</div>



</body>
</html>