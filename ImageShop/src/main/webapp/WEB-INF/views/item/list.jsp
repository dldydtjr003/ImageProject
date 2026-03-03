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
<link rel="stylesheet" href="<spring:url value='/css/item/list.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="content-container">
		<div class="list-header">
			<h2 class="title">
				<spring:message code="item.header.list" />
			</h2>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/item/register" class="btn-new"> <spring:message
						code="action.new" />
				</a>
			</sec:authorize>
		</div>

		<div class="table-card">
			<table class="item-table">
				<thead>
					<tr>
						<th class="col-id"><spring:message code="item.itemId" /></th>
						<th class="col-name"><spring:message code="item.itemName" /></th>
						<th class="col-price"><spring:message code="item.itemPrice" /></th>

						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<th class="col-action"><spring:message code="item.edit" /></th>
							<th class="col-action"><spring:message code="item.remove" /></th>
						</sec:authorize>

						<sec:authorize
							access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
							<th class="col-action"><spring:message code="item.read" /></th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty itemList}">
							<tr class="empty-row">
								<c:set var="colSpan" value="3" />
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<c:set var="colSpan" value="5" />
								</sec:authorize>
								<sec:authorize
									access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
									<c:set var="colSpan" value="4" />
								</sec:authorize>
								<td colspan="${colSpan}" class="text-center"><spring:message
										code="common.listEmpty" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${itemList}" var="item">
								<tr>
									<td class="text-center">${item.itemId}</td>
									<td class="text-left item-name">${item.itemName}</td>
									<td class="text-right price-tag"><fmt:formatNumber
											value="${item.price}" type="number" />원</td>

									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<td class="text-center"><a
											href="/item/modify?itemId=${item.itemId}" class="link-modify">
												<spring:message code="item.edit" />
										</a></td>
										<td class="text-center"><a
											href="/item/remove?itemId=${item.itemId}" class="link-remove">
												<spring:message code="item.remove" />
										</a></td>
									</sec:authorize>

									<sec:authorize
										access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
										<td class="text-center"><a
											href="/item/read?itemId=${item.itemId}" class="link-read">
												<spring:message code="item.read" />
										</a></td>
									</sec:authorize>
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