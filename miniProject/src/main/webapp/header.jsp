<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, movie.*, reply.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="movieDAO" value="${MovieDAO.getInstance()}"/>
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }"/>
<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>miniProject</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 

	body, pre {
		font-family: 'Noto Sans KR', sans-serif;
		font-style: normal;
		font-weight: 400;
		width: 100%;
		margin: 0;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	header, section {
		width: 980px;
		margin: 0 auto;
	}
	footer {
		background-color: #f8f8f8f8;
		height: 432px;
		padding: 0;
		margin: 0;
	}
	h2 {
		padding: 20px 15px; 
	}
	.sb {
		width: 980px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
	}
	.sa {
		width: 980px;
		margin: 20px auto;
		display: flex;
		justify-content: space-around;
	}
	.center {
		text-align: center;
	}
	.frame {
		width: 980px;
		margin: 20px auto;
	}
	.wrap {
		width: 980px;
		margin: 20px auto;
		display: flex;
		flex-flow: wrap;
	}
	.flex {
		display: flex;
	}
	.title {
	    width: 210px;
	    display: block;
   		white-space: nowrap;
    	text-overflow: ellipsis;
    	overflow: hidden;
	}
	img {
		padding: 0;
		margin: 0;
	}
	ol, ul {
   		list-style: none;
	}
	
	div#menu {
		padding-left: 10px;
	}
	div#box1,
	div#box2,
	div#box3 {
		display: flex;
        flex-flow: wrap;
        width: 980px;
        margin: auto;
	}
	.box {
		display: flex;
        justify-content: space-around;
        width: 980px;
        margin: auto;
	}
	div#head {
		background-color: #25274E;
		height: 80px;
		text-align: center;
		border: 0;
	}
	div#logo {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	div#logo > a > img {
		width: 117px;
		padding: 0 10px;
	}
	div#logocontent {
		width: 400px;
	}
	div#logocontent > nav > ul {
	 	display: flex;
	 	list-style: none;
	 	justify-content: space-around;
	}
	div#logocontent > nav > ul > li {
		font-size: 13px;
		text-align: center;
	}
	div#logocontent > img {
		width: 36px;
	}
	#menu {
		width: 100%;
		margin: 0 auto;
		padding-bottom: 20px;
		border-bottom: 3px solid red;
	}
	#menubar {
		width: 980px;
		margin: 0 auto;
		padding: 0;
		display: flex;
		justify-content: space-around;
	}
	#menubar > li > a  {
		display: flex;
	}
	div#movieVideo {
	    background-color: #000;
	}
	div#mainVideo {
		overflow: hidden;
  	    position: relative;
		text-align: center;
 	    left: 0;
 	    top: 0;
	    width: 100%;
	    height: 100%;
	}
	div#movieList,
	div#movieList2 {
		text-align: center;
		padding: 20px 10px;
	}
	div#movieBox,
	div#movieBox2 {
		width: 220px;
	}
	.viewIdx {
		margin: 20px auto;
		padding: 10px 0;
		background-color: #fb4357;
		color: white;
	}
	div#boardImg > a > img {
		width: 180px;
	}
	div#oneBoard {
		padding: 0 5px;
		margin-bottom: 15px;
	}
	div#boardInfo {
		width: 280px;
		margin-left: 20px;
	}
	div#boardInfo > div {
		margin-bottom: 20px;
	}
	div#boardContent {
		display: block;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	div#viewImg > img {
		width: 400px;
	}
	div#date {
		text-align: right;
	}
	input#inputTitle {
		width: 600px;
		height: 20px;
	}
	textarea#inputText {
		width: 600px;
		height: 400px;
	}
	.bold {
      font-weight: bold;
      font-size: 20px;
   }
   .boardTitle {
      font-size: 25px;
/*       color: #FF7070; */
   }
   .flexSb {
      display: flex;
      justify-content: space-between;
   }
	
/* 	스타일 수정 */
	#loginBox,
	#joinBox {
		width: 580px;
	    height: 100%;
	    margin: 40px auto 42px;
	    padding: 50px 70px;
	    border: 1px solid rgba(0,0,0,.12);
	    font-size: 12px;
	    box-sizing: border-box;
	}
	#loginBox > h3,
	#mypageBox > h3 {
		text-align: center;
	}
	#loginID > input,
	#loginPW > input {
		width: 438px;
		height: 40px;
		text-align: center;
		margin-bottom: 10px;
	}
	#loginSubmit > input {
		width: 446px;
		height: 46px;
		background-color: #FB4357;
		color: white;
		border: none;
		font-weight:bold;
	}
	#joinBox > p > input {
		width: 438px;
		height: 40px;
		text-align: center;
		margin-bottom: 10px;
	}
	#joinSelect {
		font-size: 13px;
	}
	#joinSubmit > input,
	#mypageSubmit > input {
		width: 446px;
		height: 46px;
		background-color: #FB4357;
		color: white;
		border: none;
		font-weight:bold;
	}
	#mypageContent {
		width: 980px;
		display: flex;
		margin: 20px auto;
	}
	#mypageBox {
		width: 580px;
	    height: 100%;
	    padding: 50px 70px;
	   	margin-left: 100px;
	    border: 1px solid rgba(0,0,0,.12);
	    font-size: 12px;
	    box-sizing: border-box;
	}
	#mypageBox > p > input {
		width: 438px;
		height: 40px;
		text-align: center;
		margin: 0 auto;
	}
	#mypageSelect {
		text-align: center;
		font-size: 13px;
	}
	table#myboardList {
		border-collapse: collapse;
		width: 900px;
		margin: 20px auto;
	}
	table#myboardList td {
		margin: 10px;
		border-bottom: 1px dashed lightgrey;
		text-align: center;
	}
	
	table#myboardList th {
		padding: 10px;
		text-align: center;
 		
	}
	table#myboardList > tr > td {
		width: 10px;
	}
	
	#movieImg {
		position: relative;
	}
	
	#movieImg > em {
		position: absolute;
		font-size: 40px;
		bottom: 0px;
		left: 10px;
		color: white;
	}
	#gongji {
		display: flex;
		justify-content: space-between;
		padding: 0;
		margin-top: 80px;
	}
	#gongjibox {
		display: flex;
		justify-content: space-between;
/* 		width: 735px; */
		border: 1px solid lightgrey;
		border-radius: 10px;
		padding: 20px;
	}
	#gongjiContent {
		width: 435px;
	}
	#gongjiContent1 {
		padding-bottom: 30px;
		border-bottom: 1px solid lightgrey; 
	}
	#gongjiContent2 {
		padding-top: 30px;
	}
	#QRcode {
		text-align: center;
	}
	#bugs {
		margin-right: 10px;
	}
	#bugs > img {
		height: 270px;
	}
	#policyList {
		display: flex;
		justify-content: space-around;
		padding: 0;
		font-size: 12px;
		border-bottom: 1px solid lightgrey;
	}
	#policyList > li {
		margin-top: 200px;
		margin-bottom: 20px;
	}
	#company_info {
		margin-top: 20px;
		font-size: 11px;
		padding-left: 10px;
	}
	#viewbox {
		display: flex;
		justify-content: space-between;
		margin-top: 20px;
		font-size: 20px;
	}
	#viewContent {
		margin-top: 20px;
		text-align: center;
		padding: 10px;
	}
	#trailer {
		margin-top: 50px;
	}
	#trailerTitle {
		background-color: lightgrey;
	}
	#trailervideo {
		background-color: #000;
		width: 980px;
	}
	#mentbox {
		font-size: 22px;
		font-style:italic;
		color:#fb4357;
		margin: 50px auto;
		font-weight: bold; 
	}
	#scoreAndPerson {
		margin-top: 20px;
		display: flex;
	}
	#score {
		display: flex;
		justify-content: space-between;
		margin: auto 0;
	}
	#person {
		display: flex;
		justify-content: space-between;
		margin-left: 20px;
	}


	
</style>

</head>
<body>
	
	<div id="head">
		<img src="https://adimg.cgv.co.kr/images/202312/Alienoid/0109_980x80.jpg">
	</div>
	
<header>
	<div class="sb">
		<div id="logo">
		<a href="${cpath }"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png"></a>
		<span>C U L T U R E P L E X</span>
		</div>
		<div id="logocontent">
			<nav>
				<ul>
					<c:if test="${empty login }">
						<li>
							<a href="${cpath }/login.jsp"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" style="width:36px;"></a>
							<br>
							<span>로그인</span>
						</li>
						<li>
							<a href="${cpath }/join.jsp"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="회원가입" style="width:36px;"></a>
							<br>
							<span>회원가입</span>
						</li>
					</c:if>
					<c:if test="${not empty login }">
						<li>
							<a href="${cpath }/logout.jsp"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" style="width:36px;"></a>
							<br>
							<span>로그아웃</span>
						</li>
					</c:if>
						<li>
							<a href="${cpath }/mypage.jsp"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="내정보" style="width:36px;"></a>
							<br>
							<span>MY CGV</span>
						</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
	
	<div id="menu">
		<ul id="menubar">
				<li><a href="${cpath }">홈</a></li>
				<li><a href="${cpath }/movieList.jsp">무비차트</a></li>
				<li><a href="${cpath }/boardList.jsp">무비리뷰</a></li>
			<li>
				<a href="https://www.instagram.com/cgv_korea/?hl=ko">
				<img src="data:image/png;base64,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" style="width: 24px; height: 24px;"> 인스타그램</a>
			</li>
			<li>
				<a href="https://www.facebook.com/CJCGV/">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAA1UlEQVR4AWOwDp9LUzTELRi1wDdtaf+8w9sPXDtx7h4Q7Tt2c92OS9SxwCZibtesg0+fv3756i0aoo4FkxcdgxhHEwtiite8ePmGhhas3HIB2cRL1x5t3HV5xebzEEQFC67efAI3/cDxW7aR86icip6/QIRP9+xD1E+myOHTPv3AqAVA1DJ1/76jN+EI2YKLVx8hS+0+cgMY5yRbMHfVKbBxhNGFqw+B6mloweY9V2hrAbAIIceCugl7gE6DI2QTT124jyyVXrNxEKaiUQtGLRi1YNQCAMs01I34bbYCAAAAAElFTkSuQmCC" style="border-radius: 5px; width: 22px; height: 22px;"> 페이스북</a>
			</li>
			<li>
				<a href="https://www.youtube.com/@CGVKOREA">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAA4CAMAAACfWMssAAAAaVBMVEX/////AQH/AAD++vn7/Pv8BAL4AAD4oJ/2T075cnH1kI/8///5kpL3yMf5LSz5a2r44N/5xcT2r6/3goL3W1v3SEj4Q0L5Pz/3YmL5fX34pKT55+f67e330dD4u7v8Fxb3mZj6i4r2qalA1LslAAABI0lEQVRIie3V25KDIAwGYBoUj9WK4KEVq33/hyzbnd1ZSOoyveYf7/SbmAjIWExMTECqSyezui9alethGMdx0DpXU1vMfX3tbm9ZKeAoJ1HSUNl7hwHIKdf9w15UEnAKgVRJEQIFdovfD03xaI3zJLwuouQZwdWF966hisKK4MOFacWuKabwQDDzYMIZnxGFDMENQc7ZRXmtwoZgTUCesLPbKtQI7hS0RSt5/3MH9mCYbOkHkDEp3FfFkOqRmdEbK9Ejniq7tWj5EFNFC4CXYQvAX3KrCFxyxmuG3h5gEFyo53AWBD/eyPasCoATAUMOqxPexzbtm4H8lgMoKGc/ZZMeHchpgz/iT/jXP2Db+3ku2klp/X387/WWyc4QA42JiSHyBH2TD9qhcAqeAAAAAElFTkSuQmCC" style="width: 25px;"> 유튜브</a>
			</li>
		</ul>
	</div>
