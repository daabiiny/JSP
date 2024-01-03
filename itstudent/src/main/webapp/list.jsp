<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<h3>학원생 목록 (list.jsp)</h3>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>function</th>
			</tr>		
		</thead>
		<tbody>
			<c:set var="list" value="${dao.selectList() }"/>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.userid }</td>
				<td>${dto.username }</td>
				<td>${dto.gender }</td>
				<td>${dto.address }</td>
				<td>
					<c:if test="${login.userid == dto.userid }">
						<a href="${cpath }/modify.jsp?userid=${dto.userid}"><button>수정</button></a>
						<a class="deleteLink" href="${cpath }/delete.jsp?userid=${dto.userid}"><button>삭제</button></a>
					</c:if>
										
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</section>

</body>
</html>