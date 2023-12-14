<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="youtube.YoutubeDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08_youtube</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 1330px;
		margin: 0 auto;
/*   	border: 1px dashed red; */
	}

	div.logo {
		display: flex;
		justify-content: space-between;
	}
	div.logo1 {
		flex: 1;
	}
	div.logo1 > h1 {
		display: flex;
		justify-content: flex-start;
	}
	div.search {
		flex: 2;
		margin: auto;
/* 		border: 2px solid green; */
	}
	div.search > p {
		display: flex;
		margin: 0;
/* 		border: 2px solid blue; */
	}
	div.search > p > img {
		width: 40px;
/*  		border: 2px solid red; */
 		
	}
	div.search > p > input {
/* 		justify-content:center; */
		margin-right: 0;
		width: 600px;
 		padding: 10px;
		border: 1px solid grey;
		border-radius: 20px;
	}
	div.logo2 {
		margin: auto;
	}
	nav > ul {
		display: flex;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
/* 		padding: 5px; */
		margin: 5px;
/* 		flex: 1; */
	}
	nav > ul > li > a {
		background-color: #eee;
		padding: 5px;
		border-radius: 5px;
	}
	div.box {
		display: flex;
		flex-flow: wrap;
		text-align: auto;
	}
	div.item {
		box-sizing: border-box;
		width : 200px;
		margin: 10px;
	}
	div.detail {
		text-align: center;
		width: 800px;
		border: 2px solid blue;
	}
	div.view {
		text-align: center;
/* 		border: 2px dashed black; */
	}
	div.chating {
  		width: 777px;
 		margin: auto;
		border: 1px solid lightgrey;
 		padding: 2px 0;
 		border-radius: 30px;
		align-items: center;	
	}
 	div.chating:hover { 
 		background-color: lightgrey;
 	}
	
	div.viewtitle {
 		width: 777px;
/* 		border: 2px solid blue; */
		margin: auto;
		text-align: left;
	}
	div.viewsub {
		width: 777px;
		margin: auto;
		display: flex;
		justify-content: space-between;
		background-color: yellow;
	}
	div.subleft {
		display: flex;
		border: 2px solid red;
	}
	div.subright {
		display: flex;
		justify-content: space-around;
		border: 2px solid blue;
	}
	div.gudok {
		flex: 2;
		padding: 10px;
	}
	


</style>
</head>
<body>

<div class="logo frame">
	<div class="logo1">
		<h1>
			<a href="${cpath }">Youtube</a>
			<img src= "https://img.freepik.com/premium-vector/red-youtube-logo-social-media-logo_197792-1803.jpg?w=826" height="50">
		</h1>
	</div>
	<div class="search">
		<p><input type="text" name="title" placeholder="검색" required><img src="image/음성.PNG"></p>
	</div>
	<div class="logo2">
		<img src="image/유투브계정.PNG">
	</div>
</div>

<header class="category frame">
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li>
			<li><a href="${cpath }/list.jsp?category=음악">음악</a></li>
			<li><a href="${cpath }/list.jsp?category=요리">요리</a></li>
		</ul>
	</nav>
</header>

</body>
</html>