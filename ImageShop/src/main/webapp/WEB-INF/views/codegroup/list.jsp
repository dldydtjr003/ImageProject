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
<link rel="stylesheet" href="<spring:url value='/css/codegroup/list.css'/>">
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
				data-lucide="plus-circle" class="btn-icon"></i> <spring:message
					code="codegroup.header.register" />
			</a>
		</div>

		<div class="table-card">
			<table>
				<thead>
					<tr>
						<th class="col-group-code text-center"><spring:message
								code="codegroup.groupCode" /></th>
						<th class="col-group-name"><spring:message
								code="codegroup.groupName" /></th>
						<th class="col-regdate text-center"><spring:message
								code="codegroup.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="3" class="empty-row"><i data-lucide="folder-x"
									class="empty-icon"></i><br> <spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="codeGroup">
								<tr>
									<td class="text-center"><span class="code-badge">${codeGroup.groupCode}</span>
									</td>
									<td><a
										href="/codegroup/read?groupCode=${codeGroup.groupCode}"
										class="name-link"> ${codeGroup.groupName} </a></td>
									<td class="text-center"><span class="date-text"> <fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${codeGroup.regDate}" />
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
			} else if (result === "Fail") {
				alert("삭제 처리 실패");
			}
		});
	</script>
</body>
</html>