<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<form action="join-action.jsp" method="POST">
		<p><input type="text" name="userid" placeholder="회원 아이디" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		<p><input type="text" name="username" placeholder="회원 이름" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
			<label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="text" name="email" placeholder="이메일" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</section>

</body>
</html>