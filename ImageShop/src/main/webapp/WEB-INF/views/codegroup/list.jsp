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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">
<script src="https://unpkg.com/lucide@latest"></script>

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
	box-shadow: 0 4px 12px rgba(0, 122, 255, 0.2);
}

.btn-register:hover {
	background-color: #0063d1;
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(0, 122, 255, 0.3);
}

.table-card {
	background: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
	overflow: hidden;
	border: 1px solid #e1e4e8;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

thead th {
	background-color: #f9fbff;
	padding: 18px 24px;
	font-size: 14px;
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
}

.code-badge {
	background-color: #f0f2f5;
	padding: 4px 10px;
	border-radius: 6px;
	font-family: monospace;
	font-weight: 600;
	color: #4b5563;
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
	padding: 60px 0 !important;
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
				<spring:message code="codegroup.header.list" />
			</h2>
			<a href="/codegroup/register" class="btn-register"> <i
				data-lucide="plus-circle" style="width: 20px; height: 20px;"></i> <spring:message
					code="codegroup.header.register" />
			</a>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th style="width: 25%; text-align: center;"><spring:message
								code="codegroup.groupCode" /></th>
						<th style="width: 45%;"><spring:message
								code="codegroup.groupName" /></th>
						<th style="width: 30%; text-align: center;"><spring:message
								code="codegroup.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="3" class="empty-row"><i data-lucide="folder-x"
									style="width: 40px; height: 40px; margin-bottom: 10px; opacity: 0.3;"></i><br>
									<spring:message code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="codeGroup">
								<tr>
									<td style="text-align: center;"><span class="code-badge">${codeGroup.groupCode}</span>
									</td>
									<td><a
										href="/codegroup/read?groupCode=${codeGroup.groupCode}"
										class="name-link"> ${codeGroup.groupName} </a></td>
									<td style="text-align: center;"><span class="date-text">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${codeGroup.regDate}" />
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
			// 아이콘 활성화
			lucide.createIcons();

			var result = "${msg}";
			if (result === "SUCCESS") {
				// 단순 얼럿보다 조금 더 세련되게 (원하신다면 스위트얼럿 등으로 대체 가능)
				alert("<spring:message code='common.processSuccess' />");
			}
		});
	</script>
</body>
</html>