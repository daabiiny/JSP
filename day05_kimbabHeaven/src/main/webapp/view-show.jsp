<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view-show.jsp</title>
</head>
<body>

<h1> 메뉴명 : ${dto.menuName } </h1>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>순번</th>
		<td>${dto.idx }</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>${dto.category }</td>
	</tr>
	<tr>
		<th>메뉴이름</th>
		<td>${dto.menuName }</td>
	</tr>
	<tr>
		<th>메뉴가격</th>
		<td>${dto.menuPrice }</td>
	</tr>
</table>
	
<p>
	<a href="list.jsp"><button>메뉴 목록</button></a>
	<a href="delete.jsp?idx=${dto.idx }"><button>메뉴 취소</button></a>
</p>

</body>
</html>