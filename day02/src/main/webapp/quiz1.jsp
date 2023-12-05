<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>

<h1>quiz1.jsp - 두 수의 덧셈 결과</h1>
<hr>

<form>
	<input type="number" name="n1" placeholder="n1" min="0" max="99">
	+
	<input type="number" name="n2" placeholder="n2" min="0" max="99">
	<input type="submit" value="=">
</form>

<%	
	// primitive type에는 null을 대입할 수 없다	
	// Integer.parseInt()는 인자로 null을 받아서 처리할 수 없다 (NumberFormatException)
	// request.getParameter(String name)의 반환형은 String이다
	// 변수를 선언했을 때 출력한다면, 분기문에 상관없이 값이 할당되어 있어야 한다
	
	String n1 = request.getParameter("n1");
	String n2 = request.getParameter("n2");
	int sum = 0;
	
	if(n1 != null && n2 != null) {
		sum = Integer.parseInt(n1) + Integer.parseInt(n2);
	}
%>
<h3><%=sum %></h3>


</body>
</html>