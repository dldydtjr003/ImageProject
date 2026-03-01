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
<link rel="stylesheet" href="<spring:url value='/css/board/list.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="content-container">
		<div class="list-header">
			<h2>
				<spring:message code="board.header.list" />
			</h2>

			<form:form modelAttribute="pgrq" method="get"
				action="/board/list${pgrq.toUriStringByPage()}" class="search-form">
				<form:select path="searchType" items="${searchTypeCodeValueList}"
					itemValue="value" itemLabel="label" class="search-select" />
				<form:input path="keyword" class="search-input"
					placeholder="검색어를 입력하세요..." />
				<button type="submit" id='searchBtn' class="btn-search">
					<i data-lucide="search" class="btn-icon-small"></i>
					<spring:message code="action.search" />
				</button>
			</form:form>

			<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
				<a href="/board/register" class="btn-register"> <i
					data-lucide="plus-circle" class="btn-icon-reg"></i> <spring:message
						code="board.header.register" />
				</a>
			</sec:authorize>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th class="col-no"><spring:message code="board.no" /></th>
						<th><spring:message code="board.title" /></th>
						<th><spring:message code="board.content" /></th>
						<th class="col-writer"><spring:message code="board.writer" /></th>
						<th class="col-date"><spring:message code="board.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" class="empty-row-container"><i
									data-lucide="folder-x" class="empty-icon"></i><br> <spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="board">
								<tr>
									<td>${board.boardNo}</td>
									<td class="col-title-cell"><a
										href='/board/read${pgrq.toUriString(pgrq.page)}&boardNo=${board.boardNo}'
										class="title-link"> ${board.title} </a></td>
									<td class="text-muted">${board.content}</td>
									<td class="text-writer">${board.writer}</td>
									<td class="text-date"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="pagination-wrapper">
			<c:if test="${empty pgrq.keyword}">
				<c:if test="${pagination.prev}">
					<!-- ?page=3&sizePerPage=10" -->
					<a
						href="/board/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
				</c:if>
				<c:forEach begin="${pagination.startPage }"
					end="${pagination.endPage }" var="idx">
					<c:if test="${pagination.pageRequest.page eq idx}">
						<a href="/board/list${pagination.makeQuery(idx)}">[${idx}]</a>
					</c:if>
					<c:if test="${!(pagination.pageRequest.page eq idx)}">
						<a href="/board/list${pagination.makeQuery(idx)}">${idx}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pagination.next && pagination.endPage > 0}">
					<a href="/board/list${pagination.makeQuery(pagination.endPage +1)}">&raquo;</a>
				</c:if>
			</c:if>
		</div>
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