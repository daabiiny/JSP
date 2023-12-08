<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--삭제하고나서 전체목록으로 돌리기 --%>

${dao.delete(param.idx) }

<%
	response.sendRedirect("list.jsp");

%>


</body>
</html>