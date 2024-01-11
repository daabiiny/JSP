<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<div id="menu">
		<a href="${cpath }">홈</a>
		<a href="${cpath }">무비차트</a>
		<a href="${cpath }/boardList.jsp">무비리뷰</a>
	</div>
	<div id="movieVideo"></div>
<!-- 	<div id="movieList sa"> -->
		<c:set var="list" value="${movieDAO.selectListMovie() }"/>
		<c:forEach var="dto" items="${list }">
		<a href="${cpath }/view.jsp?idx=${dto.idx}"><img src="/image/${dto.poster }"></a>
		${dto.title }
		${dto.releaseDate }
		${dto.genre }
		</c:forEach>
<!-- 	</div> -->
</main>

</body>
</html>