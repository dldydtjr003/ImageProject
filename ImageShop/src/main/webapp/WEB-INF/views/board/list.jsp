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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">

<style>
body {
	background-color: #f5f7fa;
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	color: #333;
}

.content-container {
	max-width: 1100px;
	margin: 60px auto;
	padding: 0 20px;
}

.list-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	gap: 20px;
	flex-wrap: wrap;
}

.list-header h2 {
	font-size: 28px;
	font-weight: 700;
	margin: 0;
	color: #1a1a1a;
}

.search-form {
	display: flex;
	gap: 8px;
	align-items: center;
	background: #ffffff;
	padding: 6px 10px;
	border-radius: 16px;
	border: 1px solid #eef0f2;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
}

.search-select {
	border: none;
	background: #f1f5f9;
	padding: 10px 12px;
	border-radius: 10px;
	font-size: 14px;
	color: #475569;
	font-weight: 500;
	outline: none;
	cursor: pointer;
}

.search-input {
	border: 1px solid #e2e8f0;
	padding: 10px 16px;
	border-radius: 10px;
	font-size: 14px;
	width: 220px;
	outline: none;
	transition: all 0.2s;
}

.search-input:focus {
	border-color: #007aff;
	box-shadow: 0 0 0 3px rgba(0, 122, 255, 0.1);
}

.btn-search {
	background-color: #1e293b;
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 10px;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 6px;
	transition: all 0.2s;
}

.btn-search:hover {
	background-color: #0f172a;
}

.btn-register {
	background-color: #007aff;
	color: white !important;
	text-decoration: none;
	padding: 12px 24px;
	border-radius: 14px;
	font-weight: 600;
	font-size: 15px;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: all 0.2s ease;
	box-shadow: 0 4px 12px rgba(0, 122, 255, 0.2);
}

.btn-register:hover {
	background-color: #0063d1;
	transform: translateY(-2px);
}

.btn-icon-small {
	width: 16px;
	height: 16px;
}

.btn-icon-reg {
	width: 18px;
	height: 18px;
}

.table-card {
	background: #ffffff;
	border-radius: 24px;
	overflow: hidden;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04);
	border: 1px solid #eef0f2;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead th {
	background-color: #f8fafc;
	padding: 20px 24px;
	font-size: 13px;
	font-weight: 600;
	color: #64748b;
	border-bottom: 1px solid #f1f5f9;
}

tbody td {
	padding: 20px 24px;
	font-size: 15px;
	color: #334155;
	border-bottom: 1px solid #f8fafc;
	text-align: center;
}

tbody tr:hover {
	background-color: #fbfcfe;
}

.col-no {
	width: 80px;
}

.col-writer {
	width: 120px;
}

.col-date {
	width: 160px;
}

.col-title-cell {
	text-align: left;
	padding-left: 40px;
}

.title-link {
	color: #1e293b;
	text-decoration: none;
	font-weight: 600;
	transition: color 0.2s;
}

.title-link:hover {
	color: #007aff;
}

.text-muted {
	color: #64748b;
	font-size: 14px;
}

.text-date {
	color: #94a3b8;
	font-size: 14px;
}

.text-writer {
	font-weight: 500;
}

.empty-row-container {
	padding: 60px 0;
	text-align: center;
}

.empty-icon {
	width: 48px;
	height: 48px;
	opacity: 0.3;
	margin-bottom: 10px;
}

.pagination-wrapper {
	display: flex;
	justify-content: center;
	margin-top: 30px;
	gap: 6px;
}

.pagination-wrapper a {
	min-width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
	color: #64748b;
	font-weight: 600;
	border-radius: 12px;
	transition: all 0.2s;
}

.pagination-wrapper a:hover {
	background-color: #e2e8f0;
}

.pagination-wrapper a.active-page {
	background-color: #007aff;
	color: white !important;
}
</style>
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