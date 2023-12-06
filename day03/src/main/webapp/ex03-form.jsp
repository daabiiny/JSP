<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-form.jsp</title>
</head>
<body>

<%--main의 기능 (View) --%>
<%--일반 사용자에게 보여지는 요소들 (입력/출력)--%>
<%--ㅡModel과 직접적으로 연결되어있지 않음 --%>
<%--ㅡ잘못된 수정 및 삭제, 보안상 문제가 생길 수 있기 때문에 Controller를 통해서 연결 --%>

<h1>업다운 게임 입력 / 출력</h1>
<hr>

<form action="ex03-action.jsp">
	<input type="number" name="user" required autofocus>
	<button>제출</button>
	<a href="ex03-action.jsp?reset=true">
		<input type="button" value="다시">
	</a>
</form>

<h3><%=request.getParameter("msg") %></h3>
<%--서로 다른 파일을 Parameter로 넘겨줘야 하기 때문에 --%>
<%--ex01.jsp는 한 파일안에서 계속 진행하기 때문에 <%=msg %> 이렇게만 씀 --%>

</body>
</html>
