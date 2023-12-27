<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="list" value="${dao.selectAll() }" />
	<table>
		<thead>
		<tr>
			<th>회원이름</th>
			<th>성별</th>
			<th>이메일</th>
			<th>기타</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.username }</td>
			<td>${dto.gender }</td>
			<td>${dto.email }</td>
			<td>
				<a href="modify.jsp?userid=${dto.userid }"><button>정보수정</button></a>
				<a href="delete.jsp?userid=${dto.userid }"><button>회원탈퇴</button></a>
			</td>
		</tr>
		</c:forEach>
	</table>
</section>

</body>
</html>