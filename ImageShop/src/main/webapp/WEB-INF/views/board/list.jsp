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
	box-shadow: 0 6px 20px rgba(0, 122, 255, 0.3);
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
	letter-spacing: 0.5px;
	text-align: center; 
}

.col-no {
	width: 80px;
}

.col-title {
	text-align: left !important;
} 
.col-writer {
	width: 120px;
}

.col-date {
	width: 180px;
}

tbody td {
	padding: 20px 24px;
	font-size: 15px;
	color: #334155;
	border-bottom: 1px solid #f8fafc;
	vertical-align: middle;
	text-align: center;
}

tbody tr:hover {
	background-color: #fbfcfe;
}

tbody tr:last-child td {
	border-bottom: none;
}

.td-no {
	color: #94a3b8;
}

.td-title {
	text-align: left;
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

.writer-text {
	color: #64748b;
	font-weight: 500;
}

.date-text {
	color: #94a3b8;
	font-size: 14px;
}

.empty-row {
	text-align: center;
	padding: 100px 0 !important;
	color: #94a3b8;
	font-size: 16px;
}

.empty-icon {
	display: block;
	margin: 0 auto 15px;
	width: 48px;
	height: 48px;
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
						<th class="col-writer"><spring:message code="board.writer" /></th>
						<th class="col-date"><spring:message code="board.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4" class="empty-row"><i
									data-lucide="folder-open" class="empty-icon"></i> <spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="board">
								<tr>
									<td class="td-no">${board.boardNo}</td>
									<td class="td-title"><a
										href='/board/read?boardNo=${board.boardNo}' class="title-link">
											${board.title} </a></td>
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