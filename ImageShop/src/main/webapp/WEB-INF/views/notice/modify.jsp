<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Join</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">

<link rel="stylesheet" href="<spring:url value='/css/notice/modify.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="notice.header.read" />
			</h2>

			<form:form modelAttribute="notice" action="/notice/modify" method="post">
				<form:hidden path="noticeNo" id="noticeNo"/>
				<table>
					<tr>
						<td><spring:message code="notice.title" /></td>
						<td><form:input path="title" /></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td><form:textarea path="content" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
					</table>
					</form:form>
					<div class="btn-container">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" id="btnModify">
								<spring:message code="action.modify" />
							</button>
						</sec:authorize>

						<button type="button" id="btnList">
							<spring:message code="action.list" />
						</button>
					</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(
				function() {
					let formObj = $("#notice");

					$("#btnModify").on(
							"click",
							function() {
								$("#notice").submit();
							});
					$("#btnList").on(
							"click",
							function() {
								self.location = "/notice/list"
							});
				});
	</script>
</body>
</html>