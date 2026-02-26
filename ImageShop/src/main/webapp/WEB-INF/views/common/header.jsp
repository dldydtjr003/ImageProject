<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
.user-header-wrapper {
	display: flex;
	justify-content: space-between; 
	align-items: center;
	padding: 15px 50px; 
	background-color: #ffffff;
	font-family: 'Pretendard', sans-serif;
}

.header-logo {
	text-decoration: none;
	display: flex;
	align-items: center;
}

.header-logo-text {
	font-size: 22px;
	font-weight: 800;
	letter-spacing: -1px;
	color: #1a1a1a;
}

.header-logo-text span {
	color: #007aff;
}

.user-nav-group {
	display: flex;
	gap: 15px;
	align-items: center;
}

.user-nav-link {
	text-decoration: none;
	font-size: 14px;
	font-weight: 600;
	color: #666;
	transition: all 0.2s ease;
	padding: 8px 12px;
	border-radius: 8px;
}

.user-nav-link:hover {
	color: #007aff;
	background-color: #f0f7ff;
}

.user-profile-capsule {
	display: flex;
	align-items: center;
	gap: 12px;
	background-color: #f8fbff;
	padding: 8px 20px;
	border-radius: 50px;
	border: 1px solid #e1e9f3;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.user-name {
	font-weight: 700;
	color: #333;
	font-size: 14px;
}

.user-name span {
	font-weight: 400;
	color: #888;
	margin-left: 2px;
}

.logout-btn {
	text-decoration: none;
	color: #ff4d4f;
	font-weight: 700;
	font-size: 13px;
	border-left: 1px solid #dce2e8;
	padding-left: 12px;
	transition: color 0.2s ease;
}

.logout-btn:hover {
	color: #cf1322;
}

.header-divider {
	border: 0;
	height: 1px;
	background-color: #f1f3f5;
	margin: 0;
}
</style>

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