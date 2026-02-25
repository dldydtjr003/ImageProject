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
	max-width: 480px; 
	padding: 40px;
	border-radius: 24px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
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

.label-cell {
	font-size: 14px;
	font-weight: 600;
	color: #555;
	margin-bottom: 8px;
}

.form-control {
	width: 100%;
	padding: 14px 16px;
	border: 1px solid #e1e4e8;
	border-radius: 12px;
	font-size: 15px;
	background-color: #f9fbff;
	transition: all 0.2s;
	box-sizing: border-box;
	appearance: none; 
	-webkit-appearance: none;
}

.form-control:focus {
	outline: none;
	border-color: #007aff;
	background-color: #fff;
	box-shadow: 0 0 0 3px rgba(0, 122, 255, 0.1);
}

.form-control:disabled, .form-control[readonly] {
	background-color: #f1f3f5;
	color: #adb5bd;
	cursor: not-allowed;
	border-color: #e9ecef;
}

.error-msg {
	font-size: 12px;
	color: #ff4d4f;
	margin-top: 6px;
	display: block;
	font-weight: 500;
}

.btn-container {
	display: flex;
	gap: 10px; 
	margin-top: 20px;
}

.btn {
	flex: 1; 
	height: 52px;
	border-radius: 12px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s;
	border: none;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn-primary {
	background-color: #007aff;
	color: white;
}

.btn-primary:hover {
	background-color: #0063d1;
	transform: translateY(-1px);
}

.btn-danger {
	background-color: #fff1f0;
	color: #ff4d4f;
}

.btn-danger:hover {
	background-color: #ffccc7;
}

.btn-secondary {
	background-color: #f0f2f5;
	color: #4b5563;
}

.btn-secondary:hover {
	background-color: #e4e7eb;
}

.btn:active {
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

			<form:form modelAttribute="codeDetail" id="codeDetailForm">
				<form:hidden path="groupCode" />
				<table>
					<tr>
						<td class="label-cell"><spring:message
								code="codedetail.groupCode" /></td>
						<td><form:select path="groupCode" items="${groupCodeList}"
								itemValue="value" itemLabel="label" disabled="true"
								class="form-control" /></td>
						<td><form:errors path="groupCode" cssClass="error-msg" /></td>
					</tr>
					<tr>
						<td class="label-cell"><spring:message
								code="codedetail.codeValue" /></td>
						<td><form:input path="codeValue" readonly="true"
								class="form-control" /></td>
						<td><form:errors path="codeValue" cssClass="error-msg" /></td>
					</tr>
					<tr>
						<td class="label-cell"><spring:message
								code="codedetail.codeName" /></td>
						<td><form:input path="codeName" class="form-control" /></td>
						<td><form:errors path="codeName" cssClass="error-msg" /></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<button type="button" id="btnEdit" class="btn btn-primary">
					<spring:message code="action.edit" />
				</button>
				<button type="button" id="btnRemove" class="btn btn-danger">
					<spring:message code="action.remove" />
				</button>
				<button type="button" id="btnList" class="btn btn-secondary">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#codeDetailForm");

			// 편집 버튼
			$("#btnEdit").on("click", function() {
				formObj.attr("action", "/codedetail/modify");
				formObj.attr("method", "post");
				formObj.submit();
			});

			// 삭제 버튼
			$("#btnRemove").on("click", function() {
				if (confirm("정말로 삭제하시겠습니까?")) {
					formObj.attr("action", "/codedetail/remove");
					formObj.attr("method", "post"); // 삭제는 보안상 post 권장
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