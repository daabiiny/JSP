<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<c:if test="${empty login }">
	<script>
		alert('먼저 로그인 후 작성해주세요')
		location.href = "${cpath}/login.jsp"
	</script>
</c:if>

<c:if test="${not empty login }">
	<section>
		<h2>게시물 수정</h2>
		<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
		<form method="POST" action="modify-action.jsp">
			<input type="hidden" name="idx" value="${dto.idx }">
	`		<p>
				<input type="text" name="title" value="${dto.title }" placeholder="제목" required>
			</p>
			<p>
				<textarea name="content" placeholder="내용" rows="20" cols="100" required>${dto.content }</textarea>
			</p>
			<p><input type="submit" value="수정"></p>
		</form>
	</section>
</c:if>


</body>
</html>