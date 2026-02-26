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
	max-width: 1000px;
	margin: 60px auto;
	padding: 0 20px;
}

.list-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.list-header h2 {
	font-size: 28px;
	font-weight: 700;
	margin: 0;
	color: #1a1a1a;
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

.btn-icon {
	width: 18px;
	height: 18px;
}

.table-card {
	background: #ffffff;
	border-radius: 24px;
	overflow: hidden;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04);
	border: 1px solid #eef0f2;
	margin-bottom: 25px;
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
	text-transform: uppercase;
	text-align: center;
}

.col-no {
	width: 80px;
}

.col-title {
	text-align: left !important;
}

.col-writer {
	width: 150px;
}

.col-date {
	width: 180px;
}

tbody td {
	padding: 20px 24px;
	font-size: 15px;
	color: #334155;
	border-bottom: 1px solid #f8fafc;
	text-align: center;
	vertical-align: middle;
}

tbody tr:hover {
	background-color: #fbfcfe;
}

.title-link {
	color: #1e293b;
	text-decoration: none;
	font-weight: 600;
	transition: color 0.2s;
	display: inline-block;
}

.title-link:hover {
	color: #007aff;
}

.writer-text {
	color: #64748b;
}

.date-text {
	color: #94a3b8;
	font-size: 14px;
}

.pagination-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px 0 40px 0;
	gap: 6px;
}

.pagination-wrapper a {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	min-width: 40px;
	height: 40px;
	padding: 0 8px;
	text-decoration: none;
	color: #64748b;
	font-size: 14px;
	font-weight: 600;
	border-radius: 12px;
	transition: all 0.2s;
}

.pagination-wrapper a:hover {
	background-color: #e2e8f0;
	color: #1e293b;
}

.pagination-wrapper a.active-page {
	background-color: #007aff;
	color: white !important;
	box-shadow: 0 4px 10px rgba(0, 122, 255, 0.25);
}

/* 5. 빈 목록 상태 */
.empty-row {
	text-align: center;
	padding: 80px 0 !important;
	color: #94a3b8;
}

.empty-icon {
	width: 48px;
	height: 48px;
	margin-bottom: 10px;
	opacity: 0.3;
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
			<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
				<a href="/board/register" class="btn-register"> <i
					data-lucide="plus-circle" class="btn-icon"></i> <spring:message
						code="board.header.register" />
				</a>
			</sec:authorize>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th class="col-no"><spring:message code="board.no" /></th>
						<th class="col-title"><spring:message code="board.title" /></th>
						<th class="col-writer"><spring:message code="board.content" /></th>
						<th class="col-writer"><spring:message code="board.writer" /></th>
						<th class="col-date"><spring:message code="board.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4" class="empty-row"><i data-lucide="folder-x"
									class="empty-icon"></i><br> <spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="board">
								<tr>
									<td>${board.boardNo}</td>
									<td class="col-title"><a
										href='/board/read${pagination.makeQuery(pagination.pageRequest.page)}&boardNo=${board.boardNo}'
										class="title-link"> ${board.title} </a></td>
									<td class="writer-text">${board.content}</td>
									<td class="writer-text">${board.writer}</td>
									<td class="date-text"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="pagination-wrapper">
			<c:if test="${pagination.prev}">
				<a
					href="/board/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
			</c:if>

			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="idx">
				<c:choose>
					<c:when test="${pagination.pageRequest.page eq idx}">
						<a href="/board/list${pagination.makeQuery(idx)}"
							class="active-page">${idx}</a>
					</c:when>
					<c:otherwise>
						<a href="/board/list${pagination.makeQuery(idx)}">${idx}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${pagination.next && pagination.endPage > 0}">
				<a href="/board/list${pagination.makeQuery(pagination.endPage + 1)}">&raquo;</a>
			</c:if>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			lucide.createIcons();
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