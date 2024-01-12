<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>

	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>		
			<p><input type="password" name="userpw" placeholder="비밀번호" required></p>		
			<p><input type="submit" value="로그인"></p>	
		</form>
	</c:if>

</section>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>	
	<c:set var="login" value="${memberDAO.login(dto) }" scope="session"/>
	<c:redirect url="/"/>
</c:if>



</body>
</html>