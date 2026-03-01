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
<link rel="stylesheet" href="<spring:url value='/css/codedetail/modify.css'/>">
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
			let formObj = $("#codedetail");

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