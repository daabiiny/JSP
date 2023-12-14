<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%-- 단일 조회할 떄의 함수를 이용하여 먼저 단일 객체를 불러온다 --%>
<c:set var="dto" value="${dap.selectOne(param.idx) }"/>

<section class="frame">
	<h3>영상 수정</h3>
	<form action="modify-action.jsp">
	<input type="hidden" name="idx" value="${dto.idx }">
	<p>
		<label><input type="radio" name="category" ${dto.category == '음악' ? 'checked' : ''} value="음악" required>음악</label>
		<label><input type="radio" name="category" ${dto.category == '요리' ? 'checked' : ''} value="요리" required>요리</label>
	</p>
	<p><input type="text" name="title" placeholder="영상제목" required></p>
	<p><input type="text" name="chName" placeholder="채널명" required></p>
	<p><input type="text" name="thumbNail" placeholder="썸네일" required></p>
	<p><textarea name="tag" placeholder="태그" required></textarea></p>
	<p><input type="submit"></p>
	</form>
</section>


</body>
</html>