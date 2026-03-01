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
<link rel="stylesheet" href="<spring:url value='/css/codegroup/read.css'/>">

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