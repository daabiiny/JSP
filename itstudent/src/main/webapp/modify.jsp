<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<h3>정보수정 (modify.jsp)</h3>
	
	<form method="POST" action="modify-action.jsp">
		<p><input type="hidden" name="userid" value="${login.userid }" placeholder="아이디" required readonly></p>
		<p><input type="password" name="userpw" value="${login.userpw }" placeholder="패스워드" required autofocus></p>
		<p><input type="text" name="username" value="${login.username }" placeholder="이름" required></p>
		<p><input type="text" name="address" value="${login.address }" placeholder="주소" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" ${login.gender == '남성' ? 'checked' : '' } required>남성</label>
			<label><input type="radio" name="gender" value="여성" ${login.gender == '여성' ? 'checked' : '' } required>여성</label>
		</p>
		<p><input type="submit" value="수정"></p>
	</form>
	
</section>

</body>
</html>