<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Code Group Register</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/codegroup/register.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="codegroup.header.register" />
			</h2>

			<form:form modelAttribute="codeGroup" action="register" method="post"
				id="codeGroupForm">
				<table>
					<tr>
						<td><spring:message code="codegroup.groupCode" /></td>
						<td><form:input path="groupCode" placeholder="코드를 입력하세요" />
							<div class="error-msg-cell">
								<form:errors path="groupCode" cssClass="error-msg" />
							</div></td>
					</tr>
					<tr>
						<td><spring:message code="codegroup.groupName" /></td>
						<td><form:input path="groupName" placeholder="그룹명을 입력하세요" />
							<div class="error-msg-cell">
								<form:errors path="groupName" cssClass="error-msg" />
							</div></td>
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
			// 폼 ID를 지정하여 안전하게 선택
			let formObj = $("#codeGroupForm");

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