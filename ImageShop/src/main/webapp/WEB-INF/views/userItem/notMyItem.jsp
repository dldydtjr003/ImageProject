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
	href="<spring:url value='/css/userItem/notMyItem.css'/>">
</head>
<body>
	<h2>
		<spring:message code="item.header.downloadError" />
	</h2>
	<p>
		<spring:message code="item.notMyItem" />
	</p>
	<a href="list"><spring:message code="action.list" /></a>
</body>
</html>