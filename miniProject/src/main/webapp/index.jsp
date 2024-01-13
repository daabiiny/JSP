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
		<div id="box1">
			<c:set var="list" value="${movieDAO.selectListBestMovie() }"/>
			<c:forEach var="dto" items="${list }">
			<div id="movieList">
				<div id="movieImg">
					<a href="${cpath }/view.jsp?idx=${dto.idx}"><img src="image/${dto.poster }" height="300px"></a>
					<em>${dto.idx }</em>
				</div>
				<div id="movieBox">
					<strong class="title">${dto.title }</strong>
					<div>${dto.releaseDate }</div>
					<div>${dto.genre }</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<h2>시사회 / 무대인사</h2>
		<div class="box">
			<img src="https://cf.lottecinema.co.kr//Media/Event/71f5e15e0845468aa6d447dae2ce82c8.jpg">
			<img src="https://cf.lottecinema.co.kr//Media/Event/c86273c27f4a4d808a97c0fb055fc16e.jpg">
			<img src="https://cf.lottecinema.co.kr//Media/Event/d55f2a3e1070478ca779b7c99df8b692.jpg">
		</div>
		<h2>이벤트</h2>
		<div class="box">
			<div class="eventbox">
				<div><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/39359/17030554898320.jpg" width="310px"></div>
				<div>[위시]이모티콘 이벤트</div>
				<div>2023.12.21~2024.01.14</div>
			</div>
			<div class="eventbox">
				<div><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/39416/17038143213450.jpg" width="310px"></div>
				<div>[인투 더 월드]4DX 스페셜 굿즈</div>
				<div>2023.12.29~2024.01.16</div>
			</div>
			<div class="eventbox">
				<div><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/39511/17049489199520.jpg" width="310px"></div>
				<div>[MOINTS]CGV 영화 커뮤니티 1-2월</div>
				<div>2024.01.11~2024.02.29</div>
			</div>
		</div>
	</section>
</main>

<br>

<footer>
	<section>
		<ul id="policyList">
		    <li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li>
		    <li><a href="http://corp.cgv.co.kr/company/sustainabilityStrategy/strategy.aspx" target="_blank">지속가능경영</a></li>
		    <li><a href="http://corp.cgv.co.kr/company/ir/financial/financial_list.aspx" target="_blank">IR</a></li>
		    <li><a href="http://corp.cgv.co.kr/company/recruit/step/default.aspx" target="_blank">채용정보</a></li>
		    <li><a href="http://corp.cgv.co.kr/company/advertize/ad_Default.aspx" target="_blank">광고/제휴/출점문의</a></li>
		    <li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>
		    <li><a href="http://www.cgv.co.kr/rules/organized.aspx">편성기준</a></li>
		    <li><a href="http://www.cgv.co.kr/rules/privacy.aspx"><strong>개인정보처리방침</strong></a></li>
		    <li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
		    <li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
		    <li><a href="http://corp.cgv.co.kr/company/ethicalManagement/ceoMessage.aspx" target="_blank">윤리경영</a></li>
		    <li><a href="https://www.cgv.co.kr/company/cyberAudit.aspx" class="empha-red">사이버감사실</a></li>
		</ul>
		
		
    <section id="company_info">
        <div>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)
		    <br>대표이사 : 허민회 사업자등록번호 : 104-81-45690 통신판매업신고번호 : 2017-서울용산-0662 사업자정보확인
		    <br>호스팅사업자 : CJ올리브네트웍스 개인정보보호 책임자 : 도형구 대표이메일 : cjcgvmaster@cj.net
			<br>© CJ CGV. All Rights Reserved
		</div>
    </section>
	</section>
</footer>

</body>
</html>