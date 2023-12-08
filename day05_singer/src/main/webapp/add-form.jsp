<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-form.jsp</title>
</head>
<body>

<h1>아이돌 가수 추가</h1>
<hr>

<form action="add-action.jsp">
	<p><input type="text" name="name" placeholder="이름" required></p>
	<p><input type="text" name="entertainment" placeholder="소속사명" required></p>
	<p><input type="text" name="titleSong" placeholder="대표곡" required></p>
	<p><input type="date" name="debutDate" placeholder="데뷔일자"> -> 데뷔일자</p>
	<p><input type="submit"></p>
</form>

</body>
</html>