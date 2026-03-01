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
<link rel="stylesheet" href="<spring:url value='/css/codegroup/modify.css'/>">
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