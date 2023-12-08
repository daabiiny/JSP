<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view-show.jsp</title>
</head>
<body>

<h1>♥ ${dto.name } ♥</h1>
<hr>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>번호</th>
		<td>${dto.idx }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<th>소속사명</th>
		<td>${dto.entertainment }</td>
	</tr>
	<tr>
		<th>대표곡</th>
		<td>${dto.titleSong }</td>
	</tr>
	<tr>
		<th>데뷔일자</th>
		<td>${dto.debutDate }</td>
	</tr>

</table>

<p>
	<a href="list.jsp"><button>가수 목록</button></a>
	<a href="delete.jsp?idx=${dto.idx }"><button>삭제</button></a>

</p>



</body>
</html>