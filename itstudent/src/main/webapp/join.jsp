<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<h3>회원가입 (join.jsp)</h3>
	<form action="join-action.jsp" method="POST">
		<P><input type="text" name="userid" placeholder="아이디" required autofocus></P>
		<P><input type="password" name="userpw" placeholder="비밀번호" required></P>
		<P><input type="text" name="username" placeholder="이름" required></P>
		<P><input type="text" name="address" placeholder="OO구" required></P>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
			<label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="submit" value="가입신청"></p>
	</form>
</section>

</body>
</html>