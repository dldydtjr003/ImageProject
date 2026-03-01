<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="<spring:url value='/css/common/header.css'/>">

<div class="user-header-wrapper">
	<a href="/" class="header-logo">
		<div class="header-logo-text">
			IMAGE<span>SHOP</span>
		</div>
	</a>

	<div class="user-nav-group">
		<sec:authorize access="!isAuthenticated()">
			<a href="/user/register" class="user-nav-link"> <spring:message
					code="header.joinMember" />
			</a>
			<a href="/auth/login" class="user-nav-link"> <spring:message
					code="header.login" />
			</a>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<div class="user-profile-capsule">
				<div class="user-name">
					<sec:authentication property="principal.username" />
					<span>님</span>
				</div>
				<a href="/auth/logout" class="logout-btn"> <spring:message
						code="header.logout" />
				</a>
			</div>
		</sec:authorize>
	</div>
</div>
<hr class="header-divider">