<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="center">
	<c:set var="dto" value="${movieDAO.selectOneList(param.idx) }"/>
	<div class="viewIdx">NO. ${dto.idx}</div>
	<div>
		<img src="image/${dto.poster }">
	</div>
	<div>${dto.title }</div>
	<div>${dto.genre }</div>
	<div>${dto.releaseDate }</div>
	<div>${dto.actor }</div>
	<pre>${dto.content }</pre>
</section>>

</body>
</html>