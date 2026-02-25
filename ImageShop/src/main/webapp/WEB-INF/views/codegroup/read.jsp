<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Detail</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">
<script src="https://unpkg.com/lucide@latest"></script>

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
	min-height: 90vh;
	padding: 40px 20px;
}

.register-card {
	background: #ffffff;
	width: 100%;
	max-width: 480px;
	padding: 40px;
	border-radius: 32px;
}

h2 {
	font-size: 26px;
	font-weight: 800;
	color: #1a1a1a;
	margin-bottom: 40px;
	text-align: center;
	letter-spacing: -1px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

tr {
	display: flex;
	flex-direction: column;
	margin-bottom: 28px;
	align-items: center;
}

td:first-child {
	font-size: 14px;
	font-weight: 700;
	color: #8a94a6;
	margin-bottom: 10px;
	text-align: center;
}

input[readonly] {
	width: 100%;
	max-width: 380px;
	padding: 18px 20px;
	border: none;
	border-radius: 16px;
	font-size: 15px;
	font-weight: 600;
	color: #4b5563;
	background-color: #f8f9fb;
	box-sizing: border-box;
	cursor: default;
	text-align: center;
	transition: all 0.3s ease;
}

.btn-container {
	display: flex;
	justify-content: center;
	gap: 12px;
	margin-top: 45px;
}

button {
	width: 110px; 
	height: 50px;
	border-radius: 14px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
	border: none;
	display: flex;
	align-items: center;
	justify-content: center;
}

#btnEdit {
	background-color: #007aff;
	color: white;
}

#btnEdit:hover {
	background-color: #0063d1;
	transform: translateY(-2px);
}

#btnRemove {
	background-color: #fff0f1;
	color: #f04452;
}

#btnRemove:hover {
	background-color: #f04452;
	color: white;
}

#btnList {
	background-color: #f0f2f5;
	color: #5e6e82;
}

#btnList:hover {
	background-color: #e4e7eb;
}

button:active {
	transform: scale(0.96);
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

			<form:form modelAttribute="codeGroup" id="codeGroupForm">
				<table>
					<tr>
						<td><spring:message code="codegroup.groupCode" /></td>
						<td><form:input path="groupCode" readonly="true"
								id="groupCodeInput" /></td>
					</tr>
					<tr>
						<td><spring:message code="codegroup.groupName" /></td>
						<td><form:input path="groupName" readonly="true"
								id="groupNameInput" /></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<button type="button" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="button" id="btnRemove">
					<spring:message code="action.remove" />
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
			$("#btnEdit").on("click", function() {
				// input의 id로 값을 정확히 가져옴
				let groupCodeValue = $("#groupCodeInput").val();
				self.location = "modify?groupCode=" + groupCodeValue;
			});

			// 삭제 버튼
			$("#btnRemove").on("click", function() {
				if (confirm("정말로 삭제하시겠습니까?")) {
					// 4. 경로를 현재 위치 기준 상대 경로로 적거나 명확히 설정
					formObj.attr("action", "remove");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});

			// 목록 버튼
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>