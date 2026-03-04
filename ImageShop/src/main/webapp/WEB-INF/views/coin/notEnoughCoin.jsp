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
	href="<spring:url value='/css/coin/notEnoughCoin.css'/>">
</head>
<body>
	<div class="result-container">
		<div class="status-icon">
			<i class="fas fa-exclamation-circle"></i>
		</div>

		<h2 class="result-title">
			<spring:message code="coin.header.chargeCoin" />
		</h2>

		<p class="result-msg">
			<spring:message code="coin.notEnoughCoin" />
		</p>

		<div class="btn-group">
			<a href="/coin/charge" class="btn-primary"> <spring:message
					code="coin.charge" />
			</a> <a href="javascript:history.back()" class="btn-secondary"> 이전으로
			</a>
		</div>
	</div>
</body>
</html>