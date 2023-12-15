<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section class="frame">
	<c:set var="list" value="${dao.selectList() }"/>
	<div>
		<a href="${cpath }/add.jsp"><button>신상 추가</button></a>
	</div>
	<div class="menulist">
		<c:forEach var="dto" items="${list }">
		<div class="item">
			<a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.name } : ${dto.price }원</a>
		</div>
		</c:forEach>
	</div>
	
</section>

</body>
</html>