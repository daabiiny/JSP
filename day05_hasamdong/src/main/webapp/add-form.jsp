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
		<select name="category" required>
			<option value="">=== 카테고리 ===</option>
			<option value="시즌음료">시즌음료</option>	
			<option value="콜드브루">콜드브루</option>	
			<option value="커피">커피</option>	
			<option value="라떼">라떼</option>	
			<option value="스무디">스무디</option>	
			<option value="주스에이드">주스&에이드</option>	
			<option value="티버블티">티&버블티</option>	
			<option value="디저트">디저트</option>	
		</select>
	</p>
	<p>
		<select name="hotIce" required>
			<option value="">HOT/ICE</option>
			<option value="hot">HOT</option>
			<option value="ice">ICE</option>
		</select>
	</p>
	<p><input type="text" name="menuName" placeholder="메뉴명"></p>
	<p><input type="text" name="menuPrice" placeholder="가격"></p>
	<p><input type="text" name="cal" placeholder="칼로리"></p>
	<p><input type="submit"></p>
</form>
</div>


</body>
</html>