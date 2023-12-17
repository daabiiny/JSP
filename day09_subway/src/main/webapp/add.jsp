<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<h2>🥪 메 뉴 추 가 🥪</h2>
	<form action="add-action.jsp">
		<p>
			<select name="category" required>
				<option value="">=== 카테고리 ===</option>
				<option value="클래식">클래식</option>
				<option value="프레쉬라이트">프레쉬라이트</option>
			</select>
		</p>
		
		<p><input type="text" name="imgName" placeholder="이미지추가"></p>
		<p><input type="text" name="name" placeholder="샌드위치명"></p>
		<p><input type="text" name="memo" placeholder="설명"></p>
		<p><input type="number" name="price" placeholder="가격"></p>
		<p><input type="submit"></p>
	
	
	</form>
</section>

</body>
</html>