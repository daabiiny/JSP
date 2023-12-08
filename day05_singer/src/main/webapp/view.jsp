<%@page import="singer.SingerDTO"%>
<%@page import="singer.SingerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SingerDAO dao = (SingerDAO) application.getAttribute("dao");
	int idx = Integer.parseInt(request.getParameter("idx"));
	SingerDTO dto = dao.selectOne(idx);
	
	request.setAttribute("dto", dto);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);

%>