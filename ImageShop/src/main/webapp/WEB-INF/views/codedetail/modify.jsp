<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
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
	padding: 20px;
}

.register-card {
	background: #ffffff;
	width: 100%;
	max-width: 450px;
	padding: 40px;
	border-radius: 20px;
}

h2 {
	font-size: 24px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 30px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

tr {
	display: flex;
	flex-direction: column;
	margin-bottom: 20px;
}

td:first-child {
	font-size: 14px;
	font-weight: 600;
	color: #555;
	margin-bottom: 8px;
}

input[type="text"] {
	width: 100%;
	padding: 14px 16px;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	font-size: 15px;
	background-color: #f9fbff;
	transition: all 0.2s;
	box-sizing: border-box;
}

input[type="text"]:focus {
	outline: none;
	border-color: #007aff;
	background-color: #fff;
}

font[color="red"] {
	font-size: 12px;
	margin-top: 5px;
	display: block;
	font-weight: 500;
}

.btn-container {
	display: flex;
	gap: 12px;
	margin-top: 10px;
}

button {
	flex: 1;
	height: 50px;
	border-radius: 10px;
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
	background-color: #f0f2f5;
	color: #4b5563;
}

#btnList:hover {
	background-color: #e4e7eb;
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
				<spring:message code="codegroup.header.read" />
			</h2>

			<form:form modelAttribute="codeDetail">
			<form:hidden path="groupCode"/>
			<form:hidden path="codeValue"/>
				<table>
					<tr>
						<td><spring:message code="codedetail.groupCode" /></td>
						<td><form:select path="groupCode" items="${groupCodeList}"
								itemValue="value" itemLabel="label" disabled="true" /></td>
						<td><font color="red"><form:errors path="groupCode" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="codedetail.codeValue" /></td>
						<td><form:input path="codeValue" readonly="true" /></td>
						<td><font color="red"><form:errors path="codeValue" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="codedetail.codeName" /></td>
						<td><form:input path="codeName" /></td>
						<td><font color="red"><form:errors path="codeName" /></font></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<button type="button" id="btnModify">
					<spring:message code="action.modify" />
				</button>
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			// 3. 폼 객체를 정확한 ID로 선택
			var formObj = $("#codedetail");

			// 편집 버튼
			$("#btnModify").on("click", function() {
				// input의 id로 값을 정확히 가져옴
				formObj.attr("action", "/codedetail/modify");
				formObj.attr("method", "post");
				formObj.submit();
			});

			// 목록 버튼
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>