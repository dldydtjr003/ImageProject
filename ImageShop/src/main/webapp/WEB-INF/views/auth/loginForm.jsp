<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/auth/loginForm.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="login-wrapper">
		<div class="login-card">
			<h2>
				<spring:message code="auth.header.login" />
			</h2>

			<c:if test="${not empty error}">
				<div class="status-msg msg-error">
					<c:out value="${error}" />
				</div>
			</c:if>

			<c:if test="${not empty logout}">
				<div class="status-msg msg-info">
					<c:out value="${logout}" />
				</div>
			</c:if>

			<form method="post" action="/login">
				<div class="input-group">
					<label class="input-label">아이디</label> <input type="text"
						name="username" class="form-control" placeholder="아이디를 입력하세요"
						required autofocus>
				</div>

				<div class="input-group">
					<label class="input-label">비밀번호</label> <input type="password"
						name="password" class="form-control" placeholder="비밀번호를 입력하세요"
						required>
				</div>

				<label class="remember-me-container"> <input type="checkbox"
					name="remember-me"> <spring:message code="auth.rememberMe" />
				</label>

				<button type="submit" class="btn-login">
					<spring:message code="action.login" />
				</button>

				<sec:csrfInput />
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>