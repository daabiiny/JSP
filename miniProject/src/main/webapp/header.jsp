<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, movie.*, reply.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="movieDAO" value="${MovieDAO.getInstance()}"/>
<%-- <c:set var="replyDAO" value="${ReplyDAO.getInstance() }"/> --%>
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

	body {
		font-family: 'Noto Sans KR', sans-serif;
		font-style: normal;
		font-weight: 400;
		width: 1423px;
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
	div#box,
	div#box2 {
		display: flex;
        flex-flow: wrap;
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
	div#menu {
		width: 980px;
		margin: 0 auto;
	}
	div#movieVideo {
	    background-color: #000;
	    border-top: 2px solid red;
	    margin: 20px auto;
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
	div#mobveBox2 {
		width: 220px;
	}
	.viewIdx {
		width: 600px;
		margin: 20px auto;
		padding: 10px 0;
		background-color: #fb4357;
		color: white;
		font-size: 19px;
	}
	div#boardImg > img {
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
		margin: 20px 0;
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
	
	<div id="menu">
		<a href="${cpath }">홈</a>
		<a href="${cpath }/movieList.jsp">무비차트</a>
		<a href="${cpath }/boardList.jsp">무비리뷰</a>
	</div>


</header>
