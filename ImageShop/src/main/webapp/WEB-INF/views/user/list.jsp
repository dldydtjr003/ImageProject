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
<link rel="stylesheet" href="<spring:url value='/css/user/list.css'/>">
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