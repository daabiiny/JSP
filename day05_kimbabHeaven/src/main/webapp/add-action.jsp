<%@page import="kimbab.KimbabDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-action.jsp</title>
</head>
<body>

<jsp:useBean id="dto" class=kimbab.KimbabDTO/>
<jsp:setProperty property="*" name="dto"/>

${dao. insert(dto) }

<%
	int lastIdx = KimbabDTO.getSeq();
	response.sendRedirect("view.jsp?idx=" + lastIdx);
%>

</body>
</html>