<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Board List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/lucide@latest"></script>
<link rel="stylesheet" href="<spring:url value='/css/notice/list.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="content-container">
		<div class="list-header">
			<h2>
				<spring:message code="notice.header.list" />
			</h2>
			<!-- 검색 폼 영역 -->


			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<a href="/notice/register" class="btn-register"> <i
					data-lucide="plus-circle" class="btn-icon-reg"></i> <spring:message
						code="notice.header.register" />
				</a>
			</sec:authorize>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th class="col-no"><spring:message code="notice.no" /></th>
						<th><spring:message code="notice.title" /></th>
						<th><spring:message code="notice.content" /></th>
						<th class="col-writer"><spring:message code="notice.writer" /></th>
						<th class="col-date"><spring:message code="notice.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="3"><spring:message code="common.listEmpty" />
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="notice">
								<tr>
									<td align="center">${notice.noticeNo}</td>
									<td align="left"><a
										href="/notice/read?noticeNo=${notice.noticeNo}"><c:out
												value="${notice.title}" /></a></td>
									<td align="center"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${notice.regDate}" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		
		<!-- 페이징 네비게이션 추가 -->
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			lucide.createIcons(); // Lucide 아이콘 활성화

			var result = "${msg}";
			if (result === "SUCCESS") {
				alert("<spring:message code='common.processSuccess' />");
			} else if (result === "FAIL") {
				alert("처리에 실패하였습니다.");
			}
		});
	</script>
</body>
</html>