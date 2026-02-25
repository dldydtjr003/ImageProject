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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">

<style>
body {
	background-color: #f5f7fa;
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	color: #333;
}

.register-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	padding: 40px 20px;
}

.register-card {
	background: #ffffff;
	width: 100%;
	max-width: 600px;
	padding: 45px;
	border-radius: 24px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
}

h2 {
	font-size: 26px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 35px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 15px; 
}

tr {
	display: table-row;
}

td:first-child {
	width: 120px;
	font-size: 14px;
	font-weight: 600;
	color: #64748b;
	vertical-align: middle;
	padding-right: 15px;
}

input[type="text"], input[type="password"], select {
	width: 100%;
	padding: 13px 16px;
	border: 1px solid #e2e8f0;
	border-radius: 12px;
	font-size: 15px;
	background-color: #f8fafc;
	color: #334155;
	box-sizing: border-box;
	transition: all 0.2s ease-in-out;
}

input:focus, select:focus {
	outline: none;
	border-color: #007aff;
	background-color: #fff;
	box-shadow: 0 0 0 4px rgba(0, 122, 255, 0.1);
}

.error-msg-cell {
	padding-top: 4px;
	display: block;
}

.error-msg {
	font-size: 12px;
	color: #e11d48;
	font-weight: 500;
}

.btn-container {
	display: flex;
	gap: 12px;
	margin-top: 35px;
}

button {
	flex: 1;
	height: 52px;
	border-radius: 14px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s;
	border: none;
}

#btnRegister {
	background-color: #007aff;
	color: white;
}

#btnRegister:hover {
	background-color: #0063d1;
	transform: translateY(-1px);
}

#btnList {
	background-color: #f1f5f9;
	color: #475569;
}

#btnList:hover {
	background-color: #e2e8f0;
}

button:active {
	transform: scale(0.98);
}
</style>
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