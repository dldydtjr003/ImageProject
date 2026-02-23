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
	min-height: 90vh;
	padding: 40px 20px;
}

.register-card {
	background: #ffffff;
	width: 100%;
	max-width: 480px;
	padding: 40px;
	border-radius: 32px;
	/* read.jsp와 동일한 입체감 있는 카드 그림자 */
	box-shadow: 20px 20px 60px #d9dbe0, -20px -20px 60px #ffffff;
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

/* 공통 인풋 스타일 */
input {
	width: 100%;
	max-width: 380px;
	padding: 18px 20px;
	border: none;
	border-radius: 16px;
	font-size: 15px;
	font-weight: 600;
	box-sizing: border-box;
	text-align: center;
	transition: all 0.3s ease;
	outline: none;
}

/* [read.jsp와 동일] 읽기 전용 인풋 (음각) */
input[readonly] {
	color: #4b5563;
	background-color: #f8f9fb;
	box-shadow: inset 5px 5px 10px #e2e4e9, inset -5px -5px 10px #ffffff;
	cursor: default;
}

/* [차별점] 수정 가능한 인풋 (양각 느낌 + 포커스 효과) */
#groupNameInput {
	background-color: #ffffff;
	color: #1a1a1a;
	/* 기본 상태는 살짝 떠 보이는 느낌 */
	box-shadow: 4px 4px 10px #e2e4e9, -4px -4px 10px #ffffff, inset 0px 0px
		0px transparent;
	border: 1px solid #edf2f7;
}

#groupNameInput:focus {
	border: 1px solid #007aff;
	box-shadow: 0px 0px 0px 4px rgba(0, 122, 255, 0.1);
	background-color: #fff;
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

/* 수정 완료 버튼 (블루) */
#btnModify {
	background-color: #007aff;
	color: white;
	box-shadow: 0 4px 15px rgba(0, 122, 255, 0.3);
}

#btnModify:hover {
	background-color: #0063d1;
	transform: translateY(-2px);
}

/* 목록 버튼 (그레이) */
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