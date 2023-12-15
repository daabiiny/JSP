<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="dto" value="${dao.selectOne(param.idx) }"/>
	
	<div class="detail">
		<div><h2>★ 점 심 메 뉴 ★</h2></div>	
		<div><h3>${dto.name } : ${dto.price }원</h3></div>	
	</div>
	<div class="sa">
		<div>
		<a href="${cpath }/list.jsp"><button>목록</button></a>
		</div>
		<div>
		<a href="${cpath }/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
		</div>
		<div>
		<a href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
		</div>
	</div>
	
	
</section>

</body>
</html>