<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${boardDAO.update(dto) }"/>

<c:if test="${row != 0 }">
	<c:redirect url="/view.jsp?idx=${param.idx }"/>
</c:if>

<script>
	alert('게시물 수정에 실패하였습니다')
	history.back()
</script>

</body>
</html>