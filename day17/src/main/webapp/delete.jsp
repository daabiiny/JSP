<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${boardDAO.delete(param.idx) }"/>

<c:if test="${row != 0 }">
	<c:redirect url="/board.jsp"/>
</c:if>

<script>
	alert('삭제가 되지 않았습니다')
	history.go(-1)
</script>

</body>
</html>