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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">

<style>
body {
	background-color: #f5f7fa;
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	color: #333;
}

.success-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	padding: 40px 20px;
}

.success-card {
	background: #ffffff;
	width: 100%;
	max-width: 450px;
	padding: 60px 40px;
	border-radius: 24px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
	text-align: center;
}

.icon-box {
	width: 80px;
	height: 80px;
	background-color: #e0f2fe;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto 30px;
}

.icon-box svg {
	width: 40px;
	height: 40px;
	color: #007aff;
}

h2 {
	font-size: 24px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 16px;
	line-height: 1.4;
}

p {
	font-size: 15px;
	color: #64748b;
	margin-bottom: 40px;
}

.login-btn {
	display: block;
	height: 52px;
	line-height: 52px;
	background-color: #007aff;
	color: white;
	text-decoration: none;
	border-radius: 14px;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.2s;
}

.login-btn:hover {
	background-color: #0063d1;
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(0, 122, 255, 0.2);
}

.login-btn:active {
	transform: scale(0.98);
}
</style>
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