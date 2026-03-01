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
<link rel="stylesheet" href="<spring:url value='/css/codedetail/list.css'/>">
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