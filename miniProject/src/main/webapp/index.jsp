<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>

	<div id="movieVideo">
		<div id="mainVideo">
			<video autoplay="" muted="">
	             <source src="https://adimg.cgv.co.kr/images/202401/dogman/Dogman_PC_1080x608.mp4" type="video/mp4">
	        </video>
		</div>
	</div>
	<section>
		<h2>최신영화 TOP4</h2>
		<div id="box">
			<c:set var="list" value="${movieDAO.selectListBestMovie() }"/>
			<c:forEach var="dto" items="${list }">
			<div id="movieList">
				<div id="movieImg">
					<a href="${cpath }/view.jsp?idx=${dto.idx}"><img src="image/${dto.poster }" height="300px"></a>
				</div>
				<div id="movieBox">
					<strong class="title">${dto.title }</strong>
					<div>${dto.releaseDate }</div>
					<div>${dto.genre }</div>
				</div>
			</div>
				</c:forEach>
		</div>
	</section>
	
</main>

</body>
</html>