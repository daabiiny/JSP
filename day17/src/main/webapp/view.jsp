<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>게시글 상세 보기</h2>

<div class="modify">
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
	<div></div>
	<div>
		<a href="${cpath }/modify-form.jsp?idx=${dto.idx}"><button>글수정</button></a>
	</div>
</div>

<fieldset>
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
	<h4>${dto.title }</h4>
	<h5>작성자 : ${dto.writer } / 작성일 : ${dto.writeDate }</h5>
	<pre>${dto.content }</pre>
</fieldset>



</body>
</html>