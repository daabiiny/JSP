<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="center">

	<div id="join-hd">
		<img src="https://img.cgv.co.kr/R2014/images/common/img_join_hd.jpg">
		<p>CJ ONE 회원이 되시면 하나의 통합된 회원 ID와 비밀번호로
		<br>CGV와 CJ ONE의 다양한 서비스를 이용하실 수 있습니다.</p>
	</div>
	
	<c:if test="${pageContext.request.method == 'GET' }">
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

</section>

</body>
</html>