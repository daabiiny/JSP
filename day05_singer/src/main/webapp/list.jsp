<%@page import="singer.SingerDAO"%>
<%@page import="singer.SingerDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>

<h1>아이돌 리스트</h1>
<hr>

<p>
	<a href="add-form.jsp"><button>가수 추가</button></a>
</p>

<table border="1" cellpadding="10" cellspacing="0">
	<thead bgcolor="lightpink">
		<tr>
			<th>번호</th>		
			<th>가수이름</th>		
			<th>소속사</th>		
			<th>대표곡</th>		
			<th>데뷔일자</th>		
		</tr>
	</thead>
	<tbody>
<%
	SingerDAO dao = (SingerDAO) application.getAttribute("dao");
	if(dao == null) {
		dao = new SingerDAO();
		application.setAttribute("dao", dao);
	}
	for(SingerDTO dto : dao.selectList()) { %>
	<tr>
		<td><%=dto.getIdx() %></td>
		<td>
			<a href="view.jsp?idx=<%=dto.getIdx()%>">
				<%=dto.getName() %>
			</a>
		</td>
		<td><%=dto.getEntertainment() %></td>
		<td><%=dto.getTitleSong() %></td>
		<td><%=dto.getDebutDate() %></td>
	</tr>
	<%
	}
%>
	</tbody>
</table>


</body>
</html>