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

.text-center {
	text-align: center;
}

.text-left {
	text-align: left;
}

.col-no {
	width: 80px;
}

.col-id {
	width: 120px;
}

.col-pw {
	width: auto;
	max-width: 250px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.col-name {
	width: 140px;
}

.col-job {
	width: 140px;
}

.col-date {
	width: 180px;
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
				<spring:message code="user.header.list" />
			</h2>
			<a href="/user/register" class="btn-register"> <i
				data-lucide="plus-circle" class="btn-icon"></i> <spring:message
					code="header.joinMember" />
			</a>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th class="col-no text-center"><spring:message code="user.no" /></th>
						<th class="col-id text-center"><spring:message
								code="user.userId" /></th>
						<th class="col-pw text-center"><spring:message
								code="user.userPw" /></th>
						<th class="col-name text-center"><spring:message
								code="user.userName" /></th>
						<th class="col-job text-center"><spring:message
								code="user.job" /></th>
						<th class="col-date text-center"><spring:message
								code="user.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="6" class="empty-row"><spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="member">
								<tr>
									<td class="text-center">${member.userNo}</td>
									<td class="text-center"><a
										href='/user/read?userNo=${member.userNo}' class="name-link">
											${member.userId} </a></td>
									<td class="text-left col-pw">${member.userPw}</td>
									<td class="text-center">${member.userName}</td>
									<td class="text-center">${member.job}</td>
									<td class="text-center"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${member.regDate}" /></td>
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