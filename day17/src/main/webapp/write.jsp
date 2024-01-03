<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
	<c:if test="${empty login }">
		<script>
			alert('먼저 로그인 후 작성해주세요')
			location.href = "${cpath}/login.jsp"
		</script>
	</c:if>
	<form method="POST">
		<p>
			<input type="text" name="title" placeholder="제목" required autofocus>
			<input type="hidden" name=writer value="${login.userid }">
		</p>
		<p>
			<textarea name="content" placeholder="내용" rows="20" cols="100" required></textarea>
		</p>
		<p><input type="submit" value="글작성"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="board.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="row" value="${boardDAO.insert(dto) }"/>
	<c:redirect url="/board.jsp"/>
</c:if>


</body>
</html>