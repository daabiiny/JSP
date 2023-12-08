<%@page import="singer.SingerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-action.jsp</title>
</head>
<body>

<%-- add-action.jsp : 파라미터를 전달받아서 리스트에 추가하는 작업 --%>

<jsp:useBean id="dto" class="singer.SingerDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

${dao.insert(dto) }

<%
	int lastIdx = SingerDTO.getSeq();
	response.sendRedirect("view.jsp?idx=" + lastIdx);
%>

</body>
</html>