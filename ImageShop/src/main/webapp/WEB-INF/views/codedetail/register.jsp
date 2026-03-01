<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Code Detail Register</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/codedetail/register.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="codegroup.header.register" />
			</h2>

			<form:form modelAttribute="codedetail" action="/codedetail/register"
				method="post" id="codedetailForm">
				<table>
					<tr>
						<td><spring:message code="codedetail.groupCode" /></td>
						<td><form:select path="groupCode" items="${groupCodeList}"
								itemValue="value" itemLabel="label" />
							<div class="error-msg-cell">
								<form:errors path="groupCode" cssClass="error-msg" />
							</div></td>
					</tr>
					<tr>
						<td><spring:message code="codedetail.codeValue" /></td>
						<td><form:input path="codeValue" placeholder="코드 값을 입력하세요" />
							<div class="error-msg-cell">
								<form:errors path="codeValue" cssClass="error-msg" />
							</div></td>
					</tr>
					<tr>
						<td><spring:message code="codedetail.codeName" /></td>
						<td><form:input path="codeName" placeholder="코드 명칭을 입력하세요" />
							<div class="error-msg-cell">
								<form:errors path="codeName" cssClass="error-msg" />
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
			// 명시적 ID 선택으로 안정성 확보
			let formObj = $("#codedetailForm");

			$("#btnRegister").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/codedetail/list";
			});
		});
	</script>
</body>
</html>