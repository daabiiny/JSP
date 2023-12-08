<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--view는 작업만 하는 페이지고 view-show에서 보여준다 --%>

<%
	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
	
	PersonDTO data = null;
	String name = request.getParameter("name");
	
	for(PersonDTO dto : personList) {
		if(dto.getName().equals(name)) {
			data = dto;
			break;
		}
	}
	request.setAttribute("dto", data);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);


%>




</body>
</html>