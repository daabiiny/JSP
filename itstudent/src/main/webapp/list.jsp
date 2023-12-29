<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<h3>학원생 목록 (list.jsp)</h3>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Password</th>
				<th>Name</th>
				<th>Gender</th>
				<th>Address</th>
			</tr>		
		</thead>
		<tbody>
			<c:set var="list" value="${dao.selectList() }"/>
			<c:forEach var="dto" items="${list }"/>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			
			</tr>
		</tbody>
	</table>

</section>

</body>
</html>