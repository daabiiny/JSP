<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
<style>
/* 	.white { */
/* 		background: white; */
/* 		color: black; */
/* 	} */
	.black {
		background-color: black;
		color: #dadada;
	}
	.lime {
		background-color: black;
		color: #00FF00;
	}
	.aqua {
		background-color: black;
		color: #00FFFF;
	}
	.orange {
		background-color: black;
		color: orange;
	}
	pre {
		font-size: 16px;
	
	}


</style>
</head>

<!-- if(분기문)을 안써도 클래스를 써서 쿠키만듬  -->
<body class="${cookie.theme.value }">

<h1>쿠키를 활용한 색상 테마 설정</h1>
<hr>

<form action="ex02-action.jsp">
	<select name="theme">
		<option>white</option>
		<option>${cookie.theme.value == 'black' ? 'selected' : '' }black</option>
		<option>${cookie.theme.value == 'lime' ? 'selected' : '' }lime</option>
		<option>${cookie.theme.value == 'aqua' ? 'selected' : '' }aqua</option>
		<option>${cookie.theme.value == 'orange' ? 'selected' : '' }orange</option>
	</select>
	<input type="submit">
</form>

<fieldset>
	<legend>lorem</legend>
<pre>
왜들 그리 다운돼있어? 뭐가 문제야 say something
분위기가 겁나 싸해 요새는 이런 게 유행인가
왜들 그리 재미없어? 아 그건 나도 마찬가지
Tell me what I got to do 급한 대로 블루투스 켜
아무 노래나 일단 틀어 아무거나 신나는 걸로
아무렇게나 춤춰 아무렇지 않아 보이게
아무 생각 하기 싫어 아무개로 살래 잠시
I'm sick and tired of my every day, keep it up 한 곡 더
</pre>	
</fieldset>

<div>
	<button id="checkCookie">쿠키 확인</button>
</div>

<script>
	checkCookie.onclick = function() {
		alert(document.cookie);
	}
</script>



</body>
</html>