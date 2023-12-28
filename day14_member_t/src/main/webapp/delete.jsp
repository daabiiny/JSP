<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<c:set value="${dao.delete(param.userid) }"/>

<c:if test="${row != 0 }">
	<c:redirect url="/list.jsp"/>
</c:if>

<script>
	alert('삭제가 진행되지 않았습니다')
	history.go(-1)
</script>

</body>
</html>