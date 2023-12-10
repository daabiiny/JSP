<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
	body {
        margin: 0;
        padding: 0;
    }
	
	div.frame {
		width: 1280px;
		margin: 0 auto;
	}
	
	div.logo {
		background-color: black;
		display: flex;
		justify-content: center;
	}
	
	div.logo > img {
		width: 200px;
	}
	
	div.mid {
		display: flex;
		justify-content: space-between;
		margin-top: 10px;
		
	}
	div.midLeft {
		margin: auto;
		
	}
	div.lefttitle {
		font-weight: lighter;
		font-size: 35px;
		
	}
	div.leftsub {
		font-size: 40px;
		margin: auto;
	}
	div.midright {
		flex: 0;
	}

	div.jumon > a > button {
		bolder: 1px solid white;
		background-color: lightpink;
		padding: 10px;
		border-radius: 5px;
		margin-top: 20px;
		
	}

	
	

</style>
</head>
<body>

<div class="root">


<div class="logo frame">
	<img src="https://cdn.quv.kr/gno3wdwfr/up/646d692bbca5b_1920.png">
</div>

<div class="mid frame">
	<div class="midLeft">
		<div class="lefttitle">
			<p>먹고싶은 음료는 고민하지 말고</p>
		</div>
		<div class="leftsub">
			<p>하삼동 커피에서 찾으세요.</p>
			<p>---------------------------</p>
		</div>
		<div class="leftsub2">
			<p>하삼동커피의 시즌별 새로운 신메뉴와</p>
			<p>다양한 음료를 만나 보세요.</p>
		</div>
		<div class="jumon">
			<a href="list.jsp">
				<button>음료를 주문하시겠습니까?</button>
			</a>
		</div>
	</div>
	<div class="midright">
		<img src="짱구/하삼동1.jpg">
	</div>
</div>


</div>






</body>
</html>