<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<div class="writeaction">
	<div><h2>게 시 판</h2></div>
	<a href="${cpath }/write.jsp"><button>글쓰기</button></a>
	
</div>

<div class="boardtable">
	<table border="1" cellpadding="10" cellspacing="0">
	<c:set var="list" value="${boardDAO.selectList() }"/>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td width="600">${dto.title }</td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
		</tr>
	</c:forEach>
	</table>
</div>

</body>
</html>