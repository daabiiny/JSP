<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<section class="frame">
	<h3><a href="${cpath }/login.jsp">로그인을 하시겠습니까?</a></h3>
	<nav>
		<ul>
			<%-- a태그에 가상으로라도 링크를 걸어줘야함  --%>
			<li><a href="${cpath }/list.jsp">회원목록</a></li>
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/modify.jsp">정보수정</a></li>
			<li><a href="${cpath }/delete.jsp">탈퇴</a></li>
		</ul>
	</nav>

</section>



</body>
</html>