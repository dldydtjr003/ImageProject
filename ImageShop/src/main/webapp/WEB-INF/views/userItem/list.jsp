<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Item List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/userItem/list.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="content-container">
		<div class="list-header">
			<h2>
				<spring:message code="useritem.header.list" />
			</h2>

			<%-- 구식 속성(border, width 등)을 제거하고 클래스를 부여했습니다. --%>
			<table class="item-list-table">
				<thead>
					<tr>
						<th><spring:message code="useritem.no" /></th>
						<th><spring:message code="useritem.itemName" /></th>
						<th><spring:message code="useritem.itemPrice" /></th>
						<th><spring:message code="useritem.regdate" /></th>
						<th><spring:message code="useritem.download" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" class="empty-msg"><spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="useritem">
								<tr>
									<td>${useritem.userItemNo}</td>
									<td class="item-name-cell"><a
										href="/userItem/read?userItemNo=${useritem.userItemNo}">${useritem.itemName}</a>
									</td>
									<td class="price-cell"><fmt:formatNumber
											value="${useritem.price}" type="number" /> 원</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${useritem.regDate}" /></td>
									<td><a
										href="/userItem/download?userItemNo=${useritem.userItemNo}"
										class="btn-download">DOWNLOAD</a></td>
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