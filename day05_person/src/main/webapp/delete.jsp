<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>

<%-- 애플리케이션에 들어가있는 리스트를 삭제하는 것 --%>
<%
   ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
   String name = request.getParameter("name");
   
   personList.removeIf(dto -> dto.getName().equals(name));
   response.sendRedirect("list.jsp");
%>
</body>
</html>