<%@page import="kimbab.KimbabDTO"%>
<%@page import="kimbab.KimbabDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>

<h1>김밥천국 메뉴</h1>
<p>
	<a href="add-form.jsp"><button>메뉴 추가</button></a>
</p>

<table border="1" cellpadding="10" cellspacing="0">
	<thead bgcolor="yellow">
		<tr>
			<th>순번</th>		
			<th>카테고리</th>		
			<th>메뉴이름</th>		
			<th>메뉴가격</th>		
		</tr>
	</thead>
	<tbody>
<%
	KimbabDAO dao = (KimbabDAO) application.getAttribute("dao");
	if(dao == null) {
		dao = new KimbabDAO();
		application.setAttribute("dao", dao);
	}
	for(KimbabDTO dto : dao.selectList()) { %>
	<tr>
		<td><%=dto.getIdx() %></td>
		<td>
			<a href="view.jsp?idx=<%=dto.getIdx()%>">
				<%=dto.getCategory() %>
			</a>
		</td>
		<td><%=dto.getMenuName() %></td>
		<td><%=dto.getMenuPrice() %></td>
	</tr>
	<%
	}
	
%>
	</tbody>
</table>

</body>
</html>