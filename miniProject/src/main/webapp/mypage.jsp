<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<div class="sb">
		<div>
			<ul>
				<li><a href="${cpath }/mypage.jsp">회원 정보</a></li>			
				<li><a href="${cpath }/myboard.jsp">내가 쓴 글</a></li>			
			</ul>		
		</div>
		<div>
			<c:set var="dto" value="${memberDAO.selectOne(param.idx) }"/>
			<form method="POST" action="modifyMember.jsp">
				<p><input type="text" name="userid" value="${login.userid }" placeholder="ID" required readonly></p>
				<p><input type="password" name="userpw" value="${login.userpw }" placeholder="Password" required autofocus></p>
				<p><input type="text" name="username" value="${login.username }" placeholder="name" required></p>
				<p><input type="email" name="email" value="${login.email }" placeholder="**@**.**" required></p>
				<p>
					<label><input type="radio" name="gender" value="남성" ${login.gender == '남성' ? 'checked' : '' } required>남성</label>
					<label><input type="radio" name="gender" value="여성" ${login.gender == '여성' ? 'checked' : '' } required>여성</label>
				</p>
				<p><input type="submit" value="정보수정"></p>
			</form>
		</div>
	</div>



</main>

</body>
</html>