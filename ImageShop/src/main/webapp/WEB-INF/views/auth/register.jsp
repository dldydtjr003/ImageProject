<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Join</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/auth/register.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="user.header.register" />
			</h2>

			<form:form modelAttribute="member" action="/user/register"
				method="post" id="memberForm">
				<table>
					<tr>
						<td><spring:message code="user.userId" /></td>
						<td><form:input path="userId" placeholder="아이디" />
							<div class="error-msg-cell">
								<form:errors path="userId" cssClass="error-msg" />
							</div></td>
					</tr>
					<tr>
						<td><spring:message code="user.userPw" /></td>
						<td><form:password path="userPw" placeholder="비밀번호" />
							<div class="error-msg-cell">
								<form:errors path="userPw" cssClass="error-msg" />
							</div></td>
					</tr>
					<tr>
						<td><spring:message code="user.userName" /></td>
						<td><form:input path="userName" placeholder="이름" />
							<div class="error-msg-cell">
								<form:errors path="userName" cssClass="error-msg" />
							</div></td>
					</tr>
					<tr>
						<td><spring:message code="user.job" /></td>
						<td><form:select path="job" items="${jobList}"
								itemValue="value" itemLabel="label" />
							<div class="error-msg-cell">
								<form:errors path="job" cssClass="error-msg" />
							</div></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
				</sec:authorize>
				
				<button type="button" id="btnRegister">
					<spring:message code="action.register" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			let formObj = $("#memberForm");

			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "/user/list";
			});
		});
	</script>
</body>
</html>