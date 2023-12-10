<%@page import="Coffee.CoffeeDTO"%>
<%@page import="Coffee.CoffeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	.form {
		width: 900px;
		margin: auto;
		display: flex;
 		justify-content: center;
	}
	.form2 {
		width: 900px;
		margin: auto;
	}
	table.menu {
		width: 900px;
		margin-top: 10px;
		border: 1px solid black;
	}

 	thead { 
 		flex: 1;
 		justify-content: center;
 	} 

	div.add {
		display: flex;
		justify-content: right;
	}
	
	
</style>


</head>
<body>

<div class="title form">
	<h1>하삼동커피 메뉴</h1>
</div>

<div class="add form">
	<a href="add-form.jsp"><button>메뉴 추가</button></a>
</div>


<table class="menu form2">
	<thead bgcolor="lightgrey">
		<tr>
			<th>순번</th>
			<th>카테고리</th>
			<th>핫/아이스</th>
			<th>메뉴명</th>
			<th>가격</th>
			<th>칼로리</th>
		</tr>
	</thead>
	<tbody class="context form2">
<%
	CoffeeDAO dao = (CoffeeDAO) application.getAttribute("dao");
	if(dao == null) {
		dao = new CoffeeDAO();
		application.setAttribute("dao", dao);
	}
	for(CoffeeDTO dto : dao.selectList()) { %>
	<tr>
		<td><%=dto.getIdx() %></td>
		<td>
			<a href="view.jsp?idx=<%=dto.getIdx()%>">
				<%=dto.getCategory() %>
			</a>
		</td>
		<td><%=dto.getHotIce() %></td>
		<td><%=dto.getMenuName() %></td>
		<td><%=dto.getMenuPrice() %></td>
		<td><%=dto.getCal() %></td>
	</tr>
	<%
	}
%>
	</tbody>
</table>


</body>
</html>