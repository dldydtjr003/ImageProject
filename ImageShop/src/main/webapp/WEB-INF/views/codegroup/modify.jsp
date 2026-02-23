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
h2 {
	font-size: 24px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 35px;
	text-align: center;
	letter-spacing: -0.5px;
}

table {
	width: 100%;
	max-width: 400px; 
	margin: 0 auto;
	border-collapse: collapse;
}

tr {
	display: flex;
	flex-direction: column;
	margin-bottom: 24px;
	align-items: center; 
}

td {
	width: 100%;
	display: block;
	text-align: center; 
}

td:first-child {
	font-size: 14px;
	font-weight: 600;
	color: #5e6e82;
	margin-bottom: 8px;
	padding-left: 0; 
}

input {
	width: 100%;
	max-width: 360px; 
	padding: 14px;
	border: 1px solid #e1e4e8;
	border-radius: 12px;
	font-size: 15px;
	box-sizing: border-box;
	text-align: center; 
}

.btn-container {
	display: flex;
	justify-content: center;
	gap: 12px;
	margin-top: 30px;
}

button {
	width: 140px; 
	height: 48px;
	border-radius: 10px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s ease;
	border: none;
	display: flex;
	align-items: center;
	justify-content: center;
}

#btnModify {
	background-color: #007aff;
	color: white;
}

#btnList {
	background-color: #f1f3f5;
	color: #495057;
}

button:hover {
	transform: translateY(-1px);
	filter: brightness(0.95);
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="codegroup.header.modify" />
			</h2>

			<form:form modelAttribute="codeGroup" id="codeGroupForm"
				action="/codegroup/modify" method="post">
				<table>
					<tr>
						<td><spring:message code="codegroup.groupCode" /></td>
						<td><form:input path="groupCode" readonly="true"
								id="groupCodeInput" /></td>
					</tr>
					<tr>
						<td><spring:message code="codegroup.groupName" /></td>
						<td><form:input path="groupName" id="groupNameInput" /></td>
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
			let formObj = $("#codeGroupForm");

			// 편집 버튼
			$("#btnModify").on("click", function() {
				formObj.attr("action", "modify");
				formObj.attr("method", "post");
				// input의 id로 값을 정확히 가져옴
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