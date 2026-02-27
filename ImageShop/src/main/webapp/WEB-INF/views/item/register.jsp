<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Register Board</title>
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
	max-width: 700px;
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
	border-spacing: 0 10px;
}

td:first-child {
	width: 100px;
	font-size: 14px;
	font-weight: 600;
	color: #64748b;
	vertical-align: middle;
	padding-bottom: 8px;
}

input[type="text"], input[type="password"], select, textarea {
	width: 100%;
	padding: 14px 18px;
	border: 1px solid #e2e8f0;
	border-radius: 12px;
	font-size: 15px;
	background-color: #f8fafc;
	color: #334155;
	box-sizing: border-box;
	transition: all 0.2s ease-in-out;
	font-family: inherit;
}

textarea {
	height: 250px;
	resize: vertical;
	line-height: 1.6;
}

input[readonly] {
	background-color: #edf2f7;
	color: #94a3b8;
	cursor: not-allowed;
}

input:focus, select:focus, textarea:focus {
	outline: none;
	border-color: #007aff;
	background-color: #fff;
	box-shadow: 0 0 0 4px rgba(0, 122, 255, 0.1);
}

.error-msg-cell {
	padding-top: 4px;
	padding-bottom: 10px;
}

.error-msg {
	font-size: 12px;
	color: #e11d48;
	font-weight: 500;
	display: block;
	margin-top: 5px;
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
				<spring:message code="item.header.register" />
			</h2>

			<form:form modelAttribute="item" action="/item/register"
				enctype="multipart/form-data" method="post">
				<table>
					<tr>
						<td><spring:message code="item.itemName" /></td>
						<td><form:input path="itemName" /></td>
						<td><font color="red"><form:errors path="itemName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPrice" /></td>
						<td><form:input path="price" />&nbsp;원</td>
						<td><font color="red"><form:errors path="price" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemFile" /></td>
						<td><input type="file" name="picture" /></td>
						<td></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPreviewFile" /></td>
						<td><input type="file" name="preview" /></td>
						<td></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemDescription" /></td>
						<td><form:textarea path="description" /></td>
						<td><form:errors path="description" /></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<sec:authorize access="isAuthenticated()">
					<button type="submit" id="btnRegister">
						<spring:message code="action.register" />
					</button>
				</sec:authorize>

				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			let formObj = $("#item");

			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "/item/list";
			});
		});
	</script>
</body>
</html>