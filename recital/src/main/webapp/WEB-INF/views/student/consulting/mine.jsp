<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>


<div class="container-xxl flex-grow-1 container-p-y">
	<div class="card">
		<h4 class="card-header">상담 > 상담내역</h4>
		<hr class="mb-0">
		<div class="card-body">
		<form action="" id="searchForm">			
			<div class="row mb-3">	
				<div class="input-group">
					<input type="hidden" name="page" id="page">					
				</div>
			</div>
		</form>
			<hr class="mb-3">
			<div class="row mb-3">
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th></th>
							<th>상담제목</th>
							<th>상담구분</th>
							<th>대면여부</th>
							<th>교수이름</th>							
							
							<th>상담신청일자</th>
							<th>상담일자</th>
							<th>상태</th>
							<th></th>
						</tr>						
					</thead>				
					<c:set value="${pagingVO.dataList }" var="consultingList"/>
					<tbody>
						<c:choose>
							<c:when test="${empty consultingList }">
								<tr>
									<td colspan="8" style="text-align: center;">상담 내역이 없습니다...</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${consultingList }" var="con" varStatus="status">	
									<tr>
										<td>${status.index+1 }</td>
										<td style="text-align: left;">${con.conTitle }</td>
										<td>
											<c:if test="${con.comDetNNo eq 'N0101'}">진로상담</c:if>
											<c:if test="${con.comDetNNo eq 'N0102'}">학업상담</c:if>
											<c:if test="${con.comDetNNo eq 'N0103'}">휴학상담</c:if>
											<c:if test="${con.comDetNNo eq 'N0104'}">기타상담</c:if>
										</td>
										<td>
											<c:if test="${con.conOnoff eq 'Y' }">대면</c:if>
											<c:if test="${con.conOnoff eq 'N' }">비대면</c:if>											
										</td>
										<td>${con.proName }</td>
										
										
										<td>${con.conRegdate }</td>
										<td>${con.conDate }</td>
										<td>
											<c:if test="${con.comDetSNo eq 'S0101'}">완료</c:if>
											<c:if test="${con.comDetSNo eq 'S0102'}">대기</c:if>
										</td>
										<td>
											<a class="btn btn-outline-primary" href="/student/consultingDetail?conNo=${con.conNo }&flag=Y">상세보기</a>
										</td>
									</tr>
								</c:forEach>	
							</c:otherwise>
						</c:choose>											
					</tbody>
				</table>
			</div>
			<div class="card-footer clearfix" id="pagingArea">
                  ${pagingVO.pagingHTML }
            </div>
            <div class="mb-3" align="right">
            	<button class="btn btn-primary" id="insertBtn">등록</button>
            </div>
		</div>
	</div>
</div>
<script>
$(function(){
	var pagingArea = $("#pagingArea");
	var searchForm = $("#searchForm");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();	// a태그의 href속성 이벤트를 꺼준다.
		var pageNo = $(this).data("page");	// pageNo 전달
		
		// 검색 시 사용할 form태그 안에 넣어준다.
		// 검색 시 사용할 form 태그를 활용해서 검색도하고 페이징 처리도 같이 진행함
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	$("#insertBtn").click(function(){
		location.href="/student/consultingForm";
	})
})
</script>