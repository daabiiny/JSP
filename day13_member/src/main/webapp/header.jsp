<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<c:set var="cpath" value="${pageContext.request.contextPath }"/>    
<c:set var="dao" value="${MemberDAO.getInstance() }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	.frame {
		width: 900px;
		margin: 0 auto;
		border: 1px dashed red;
	}
	nav > ul {
		display: flex;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
	}
	table {
		border: 2px solid black;
		border-collapse: collapse;
		width: 500px;
	}
	tr, td {
		border-bottom: 1px solid grey;
	}
	td {
		text-align: center;
	}
	thead {
		background-color: #dadada;
	}


</style>

</head>
<body>

<header class="frame">
	<h1><a href="${cpath }">naver</a></h1>
</header>



</body>
</html>