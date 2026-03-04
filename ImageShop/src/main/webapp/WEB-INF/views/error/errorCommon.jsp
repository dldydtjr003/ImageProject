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
<title>Image Shop | Error</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="<spring:url value='/css/error/errorCommon.css'/>">
</head>
<body>
	<div class="result-container">
		<div class="status-icon">
			<span>!</span>
		</div>

		<h2 class="result-title">
			<spring:message code="common.error.errorOccurred" />
		</h2>

		<p class="result-msg">
			서비스 이용 중 예기치 못한 문제가 발생했습니다.<br> 잠시 후 다시 시도해 주세요.
		</p>

		<div class="btn-group">
			<a href="javascript:window.history.back();" class="btn-primary">
				<spring:message code="common.error.backPage" />
			</a> <a href="/" class="btn-secondary"> <spring:message
					code="common.error.returnHome" />
			</a>
		</div>
	</div>
</body>
</html>