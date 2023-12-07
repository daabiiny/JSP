<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex02-error.jsp</h1>
<hr>

<%--isErrorPage를 해야 exception 내장객체를 쓸 수 있음 --%>

<%--error를 처리하는 3가지 방법 --%>
<%--1) error-page -> directive에서 작업 (특정페이지 ex02-form 하나에서 발생하는 에러 처리)--%>
<%--2) response status code -> web.xml 에서 작업 (전역에 오류가 발생하면 해결) --%>
<%--3) exception-type -> web.xml 에서 작업 (전역에 오류가 발생하면 해결)--%>

<%
	String msg = exception.getMessage();
%>
<h3><%=msg %></h3>
<h3>정수를 입력해주시기 바랍니다</h3>
<a href="ex02-form.jsp"><button>다시</button></a>

</body>
</html>