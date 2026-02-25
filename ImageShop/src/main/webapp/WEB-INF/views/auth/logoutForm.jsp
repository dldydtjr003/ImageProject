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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css">

<style>
body {
	background-color: #f5f7fa;
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	color: #333;
}

.login-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	padding: 20px;
}

.login-card {
	background: #ffffff;
	width: 100%;
	max-width: 420px;
	padding: 40px;
	border-radius: 24px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
}

.login-card h2 {
	font-size: 24px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 30px;
	text-align: center;
}

.status-msg {
	padding: 12px;
	border-radius: 12px;
	font-size: 14px;
	margin-bottom: 20px;
	text-align: center;
	font-weight: 500;
}

.msg-error {
	background-color: #fff1f0;
	border: 1px solid #ffa39e;
	color: #ff4d4f;
}

.msg-info {
	background-color: #e6f7ff;
	border: 1px solid #91d5ff;
	color: #1890ff;
}

.input-group {
	margin-bottom: 20px;
}

.input-label {
	display: block;
	font-size: 14px;
	font-weight: 600;
	color: #555;
	margin-bottom: 8px;
}

.form-control {
	width: 100%;
	padding: 14px 16px;
	border: 1px solid #e1e4e8;
	border-radius: 12px;
	font-size: 15px;
	background-color: #f9fbff;
	transition: all 0.2s;
	box-sizing: border-box;
}

.form-control:focus {
	outline: none;
	border-color: #007aff;
	background-color: #fff;
	box-shadow: 0 0 0 3px rgba(0, 122, 255, 0.1);
}

.remember-me-container {
	display: flex;
	align-items: center;
	gap: 8px;
	margin-bottom: 25px;
	font-size: 14px;
	color: #666;
	cursor: pointer;
}

.remember-me-container input {
	width: 18px;
	height: 18px;
	accent-color: #007aff;
	cursor: pointer;
}

.btn-login {
	width: 100%;
	height: 52px;
	background-color: #007aff;
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s;
	box-shadow: 0 4px 12px rgba(0, 122, 255, 0.2);
}

.btn-login:hover {
	background-color: #0063d1;
	transform: translateY(-1px);
}

.btn-login:active {
	transform: scale(0.98);
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="login-wrapper">
		<div class="login-card">
			<h2>
				<spring:message code="auth.header.logout" />
			</h2>


			<form method="post" action="/logout">
				<table>
					<tr>
						<td>
							<button type="submit" class="btn-logout">
								<spring:message code="action.logout" />
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>