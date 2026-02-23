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
/* 전체 배경 및 폰트 설정 */
body {
	background-color: #f5f7fa; /* 아주 연한 그레이 블루 */
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	color: #333;
}

/* 메인 컨테이너 */
.register-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	padding: 20px;
}

/* 화이트 카드 디자인 */
.register-card {
	background: #ffffff;
	width: 100%;
	max-width: 450px;
	padding: 40px;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
}

h2 {
	font-size: 24px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 30px;
	text-align: center;
}

/* 테이블을 모던한 폼 형태로 변환 */
table {
	width: 100%;
	border-collapse: collapse;
}

tr {
	display: flex;
	flex-direction: column;
	margin-bottom: 20px;
}

/* 라벨 스타일 */
td:first-child {
	font-size: 14px;
	font-weight: 600;
	color: #555;
	margin-bottom: 8px;
}

/* 인풋 박스 스타일 */
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
	box-shadow: 0 0 0 4px rgba(0, 122, 255, 0.1);
}

/* 에러 메시지 */
font[color="red"] {
	font-size: 12px;
	margin-top: 5px;
	display: block;
	font-weight: 500;
}

/* 버튼 그룹 */
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

/* 등록 버튼: 메인 블루 */
#btnRegister {
	background-color: #007aff;
	color: white;
}

#btnRegister:hover {
	background-color: #0063d1;
	transform: translateY(-1px);
}

/* 목록 버튼: 소프트 그레이 */
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
				<spring:message code="codegroup.header.register" />
			</h2>

			<form:form modelAttribute="codeGroup" action="register" method="post">
				<table>
					<tr>
						<td><spring:message code="codegroup.groupCode" /></td>
						<td><form:input path="groupCode" placeholder="코드를 입력하세요" /></td>
						<td><font color="red"><form:errors path="groupCode" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="codegroup.groupName" /></td>
						<td><form:input path="groupName" placeholder="그룹명을 입력하세요" /></td>
						<td><font color="red"><form:errors path="groupName" /></font></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
				<button type="button" id="btnRegister">
					<spring:message code="action.register" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#codeGroup");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>