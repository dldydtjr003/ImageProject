<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | List</title>
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
	margin: 50px auto;
	padding: 0 20px;
}

.list-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.list-header h2 {
	font-size: 26px;
	font-weight: 700;
	margin: 0;
	color: #1a1a1a;
}

.btn-register {
	background-color: #007aff;
	color: white !important;
	text-decoration: none;
	padding: 12px 24px;
	border-radius: 12px;
	font-weight: 600;
	font-size: 15px;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: all 0.2s ease;
	border: none;
	cursor: pointer;
}

.btn-register:hover {
	background-color: #0063d1;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 122, 255, 0.3);
}

.btn-icon {
	width: 18px;
	height: 18px;
}

.table-card {
	background: #ffffff;
	border-radius: 20px;
	overflow: hidden;
	border: 1px solid #e1e4e8;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.03);
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

thead th {
	background-color: #f9fbff;
	padding: 20px 24px;
	font-size: 13px;
	font-weight: 600;
	color: #5e6e82;
	border-bottom: 1px solid #edf2f9;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

tbody td {
	padding: 18px 24px;
	font-size: 15px;
	color: #333;
	border-bottom: 1px solid #f2f4f6;
	vertical-align: middle;
}

tbody tr:hover {
	background-color: #f8fbff;
	cursor: pointer;
}

.col-group {
	width: 150px;
}

.col-value {
	width: 150px;
}

.col-name {
	width: auto;
}

.col-sort {
	width: 100px;
	text-align: center;
}

.col-date {
	width: 180px;
}

.text-center {
	text-align: center;
}

.code-badge {
	background-color: #f0f2f5;
	padding: 5px 12px;
	border-radius: 8px;
	font-family: 'Consolas', monospace;
	font-weight: 600;
	color: #4b5563;
	font-size: 13px;
}

.name-link {
	color: #007aff;
	text-decoration: none;
	font-weight: 600;
	transition: color 0.2s;
}

.name-link:hover {
	color: #0056b3;
	text-decoration: underline;
}

.date-text {
	color: #8b95a1;
	font-size: 14px;
}

.empty-row {
	text-align: center;
	padding: 80px 0 !important;
	color: #abb5c2;
	font-weight: 500;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="content-container">
		<div class="list-header">
			<h2>
				<spring:message code="codedetail.header.list" />
			</h2>
			<a href="register" class="btn-register"> <i
				data-lucide="plus-circle" class="btn-icon"></i> <spring:message
					code="action.new" />
			</a>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th class="col-group"><spring:message
								code="codedetail.groupCode" /></th>
						<th class="col-value"><spring:message
								code="codedetail.codeValue" /></th>
						<th class="col-name"><spring:message
								code="codedetail.codeName" /></th>
						<th class="col-sort"><spring:message
								code="codedetail.sortSeq" /></th>
						<th class="col-date"><spring:message
								code="codedetail.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" class="empty-row"><spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="codeDetail">
								<tr>
									<td><span class="code-badge">${codeDetail.groupCode}</span></td>
									<td><span class="code-badge">${codeDetail.codeValue}</span></td>
									<td><a
										href="/codedetail/read?groupCode=${codeDetail.groupCode}&codeValue=${codeDetail.codeValue}"
										class="name-link"> ${codeDetail.codeName} </a></td>
									<td class="text-center">${codeDetail.sortSeq}</td>
									<td><span class="date-text"> <fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${codeDetail.regDate}" />
									</span></td>
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

			let result = "${msg}";
			if (result === "SUCCESS") {
				alert("<spring:message code='common.processSuccess' />");
			} else if (result === "FAIL") {
				alert("처리에 실패하였습니다.");
			}
		});
	</script>
</body>
</html>