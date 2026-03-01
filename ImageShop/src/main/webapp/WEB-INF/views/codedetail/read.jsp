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
<link rel="stylesheet" href="<spring:url value='/css/codedetail/read.css'/>">
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
				<table>
					<tr>
						<td class="label-cell"><spring:message
								code="codedetail.groupCode" /></td>
						<td><form:select path="groupCode" items="${groupCodeList}"
								itemValue="value" itemLabel="label" 
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
			let formObj = $("#codeDetailForm");

			// 편집 버튼
			$("#btnEdit").on("click", function() {
				formObj.attr("action", "/codedetail/modify");
				formObj.attr("method", "post");
				formObj.submit();
			});

			// 삭제 버튼
			$("#btnRemove").on("click", function() {
				if (confirm("정말로 삭제하시겠습니까?")) {
					$("#groupCode").removeAttr("disabled");
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