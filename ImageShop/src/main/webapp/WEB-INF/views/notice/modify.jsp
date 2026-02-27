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

textarea {
	width: 100%;
	min-height: 250px;
	padding: 16px;
	border: 1px solid #e2e8f0;
	border-radius: 12px;
	font-size: 15px;
	line-height: 1.8;
	background-color: #f8fafc;
	color: #334155;
	box-sizing: border-box;
	font-family: 'Pretendard', sans-serif;
	resize: none;
	outline: none;
	display: block;
}

textarea:focus {
	border-color: #007aff;
	background-color: #ffffff;
	box-shadow: 0 0 0 4px rgba(0, 122, 255, 0.1);
}

#btnEdit {
	background-color: #007aff;
	color: white;
}

#btnEdit:hover {
	background-color: #0063d1;
	transform: translateY(-1px);
}

#btnRemove {
	background-color: #fff1f2;
	color: #e11d48;
}

#btnRemove:hover {
	background-color: #ffe4e6;
	transform: translateY(-1px);
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
				<spring:message code="notice.header.read" />
			</h2>

			<form:form modelAttribute="notice" action="/notice/modify" method="post">
				<form:hidden path="noticeNo" />
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
								let noticeNo = $("#noticeNo").val();
								self.location = "/notice/modify?noticeNo=" + noticeNo;
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