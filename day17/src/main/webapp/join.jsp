<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
	<h2>회원가입</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		<p><input type="text" name="username" placeholder="이름" required></p>
		<p><input type="email" name="email" placeholder="**@**.**" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성">남성</label>
			<label><input type="radio" name="gender" value="여성">여성</label>
		</p>
		<p><input type="submit" value="가입"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="row" value="${memberDAO.insert(dto) }"/>
	<c:if test="${row != 0 }">
		<c:redirect url="/login.jsp"/>
	</c:if>
	
	<script>
		alert('회원 가입이 실패되었습니다')
		history.go(-1)
	</script>
		
</c:if>


</body>
</html>