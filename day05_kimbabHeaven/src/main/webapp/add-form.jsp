<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-form.jsp</title>
<style>
	div.add {
		width: 900px;
		margin: auto;
	}
	h1 {
		display: flex;
 		justify-content: center;
	}
	p {
		display: flex;
 		justify-content: center;
	}
	
</style>

</head>
<body>

<div class="add">

<h1>메뉴 추가</h1>


<form action="add-action.jsp">
	<p>
		<select name = "category" required>
			<option value="">=== 카테고리 ===</option>		
			<option value="김밥">김밥</option>		
			<option value="분식">분식</option>		
			<option value="식사">식사</option>		
			<option value="돈까스">돈까스</option>		
			<option value="계절메뉴">계절메뉴</option>		
		</select>
	</p>
	<p><input type="text" name="menuName" placeholder="메뉴이름"></p>
	<p><input type="text" name="menuPrice" placeholder="메뉴가격"></p>
	<p><input type="text" name="cal" placeholder="칼로리"></p>
	<p><input type="submit"></p>
</form>
</div>

</body>
</html>