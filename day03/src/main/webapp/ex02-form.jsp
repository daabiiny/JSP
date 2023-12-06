<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>

<%--자바에서 main --%>
<%-- 코드를 분리하면서 코드 구조를 직관적으로 볼 수 있어, 유지보수에 좋음 --%>

<h1>업다운 게임 입력 / 출력</h1>
<hr>

<form action="ex02-action.jsp">
	<input type="number" name="user" required autofocus>
	<input type="submit">
	<a href="ex02-action.jsp?reset=true">
		<input type="button" value="다시">
	</a>
</form>

<h3><%=request.getParameter("msg") %></h3>
<%--서로 다른 파일을 Parameter로 넘겨줘야 하기 때문에 --%>
<%--ex01.jsp는 한 파일안에서 계속 진행하기 때문에 <%=msg %> 이렇게만 씀 --%>

</body>
</html>
