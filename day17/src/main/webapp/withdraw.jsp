<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
	<h2>회원탈퇴</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		<p><input type="submit" value="진짜 탈퇴 하실건가요..?"></p>
	</form>	
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="row" value="${memberDAO.delete(dto) }"/>
	<c:redirect url="/logout.jsp"/>
</c:if>

</body>
</html>