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
<link rel="stylesheet" href="<spring:url value='/css/board/register.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="register-wrapper">
		<div class="register-card">
			<h2>
				<spring:message code="board.header.register" />
			</h2>

			<form:form modelAttribute="board" action="/board/register"
				method="post" id="board">
				<table>
					<tr>
						<td><spring:message code="board.title" /></td>
						<td><form:input path="title" placeholder="제목을 입력해주세요." />
							<div class="error-msg-cell">
								<form:errors path="title" cssClass="error-msg" />
							</div></td>
					</tr>

					<tr>
						<td><spring:message code="board.writer" /></td>
						<td><form:input path="writer" readonly="true" />
							<div class="error-msg-cell">
								<form:errors path="writer" cssClass="error-msg" />
							</div></td>
					</tr>

					<tr>
						<td style="vertical-align: top; padding-top: 15px;"><spring:message
								code="board.content" /></td>
						<td><form:textarea path="content" placeholder="내용을 입력해주세요." />
							<div class="error-msg-cell">
								<form:errors path="content" cssClass="error-msg" />
							</div></td>
					</tr>
				</table>
			</form:form>

			<div class="btn-container">
				<sec:authorize access="isAuthenticated()">
					<button type="button" id="btnRegister">
						<spring:message code="action.register" />
					</button>
				</sec:authorize>

				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			let formObj = $("#board");

			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "/board/list"; 
			});
		});
	</script>
</body>
</html>