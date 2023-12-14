<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<h3>영상 추가</h3>
	<form action="add-action.jsp">
		<p>
			<select name = "category" required>
			<option value="">=== 카테고리 ===</option>		
			<option value="음악">음악</option>		
			<option value="요리">요리</option>		
		</select>
		</p>
		<p><input type="text" name="title" placeholder="영상제목" required></p>
		<p><input type="text" name="chName" placeholder="채널명" required></p>
		<p><input type="text" name="thumbNail" placeholder="썸네일" required></p>
		<p><textarea name="tag" placeholder="태그" required></textarea></p>
		<p><input type="submit"></p>
	</form>
</section>

</body>
</html>