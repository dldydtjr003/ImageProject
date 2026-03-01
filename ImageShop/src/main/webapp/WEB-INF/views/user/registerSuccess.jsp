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
<title>Image Shop | Welcome</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/user/registerSuccess.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="success-wrapper">
		<div class="success-card">
			<div class="icon-box">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none"
					viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
						stroke-width="3" d="M5 13l4 4L19 7" />
                </svg>
			</div>

			<p>
				회원가입이 정상적으로 완료되었습니다.<br>지금 바로 로그인하여 서비스를 이용해보세요!
			</p>

			<a href="/auth/login" class="login-btn"> <spring:message
					code="action.login" />
			</a>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>