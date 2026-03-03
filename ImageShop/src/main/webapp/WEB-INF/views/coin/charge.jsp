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
<link rel="stylesheet" href="<spring:url value='/css/coin/charge.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="coin.header.chargeCoin" />
			</h2>

			<form:form modelAttribute="chargeCoin" action="/coin/charge"
				method="post">
				<table>
					<tr>
						<td><spring:message code="coin.amount" /></td>
						<td><form:input path="amount" placeholder="충전할 금액을 입력하세요" />
							<form:errors path="amount" cssClass="error-msg" /></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<button type="button" id="btnCharge">
						<spring:message code="action.charge" />
					</button>
				</sec:authorize>
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			var formObj = $("#chargeCoin");

			$("#btnCharge").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>