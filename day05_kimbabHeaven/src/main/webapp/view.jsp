<%@page import="kimbab.KimbabDTO"%>
<%@page import="kimbab.KimbabDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	KimbabDAO dao = (KimbabDAO) application.getAttribute("dao");
	int idx = Integer.parseInt(request.getParameter("idx"));
	KimbabDTO dto = dao.selectOne(idx);
	
	request.setAttribute("dto", dto);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);

%>



</body>
</html>