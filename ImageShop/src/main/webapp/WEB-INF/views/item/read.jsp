<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Register Board</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/item/modify.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="item.header.read" />
			</h2>

			<form:form modelAttribute="item">
				<form:hidden path="itemId" />
				<table>
					<tr>
						<td><spring:message code="item.itemName" /></td>
						<td><form:input path="itemName" readonly="true"/></td>
						<td><font color="red"><form:errors path="itemName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPrice" /></td>
						<td><form:input path="price" readonly="true"/>&nbsp;원</td>
						<td><font color="red"><form:errors path="price" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.picture" /></td>
						<td><img src="/item/picture?itemId=${item.itemId}" width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="item.preview" /></td>
						<td><img src="/item/display?itemId=${item.itemId}" width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemDescription" /></td>
						<td><form:textarea path="description"  readonly="true"/></td>
						<td><form:errors path="description" /></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			let formObj = $("#item");
			$("#btnList").on("click", function() {
				self.location = "/item/list";
			});
		});
	</script>
</body>
</html>