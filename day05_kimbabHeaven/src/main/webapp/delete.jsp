<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>

${dao.delete(param.idx) }

<%
	response.sendRedirect("list.jsp");
%>

</body>
</html>