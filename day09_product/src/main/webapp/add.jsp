<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<h3>점심메뉴 추가욧</h3>
	<form action="add-acion.jsp">
		<p><input type="text" name="name" placeholder="상품이름" required></p>
		<p><input type="number" name="price" placeholder="상품가격" required></p>
		<p><input type="submit"></p>	
	</form>
</section>


</body>
</html>