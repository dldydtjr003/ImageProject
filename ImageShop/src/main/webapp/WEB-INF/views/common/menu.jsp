<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.nav-menu-wrapper {
	background-color: #ffffff;
	border-bottom: 2px solid #f1f3f5;
	margin-bottom: 30px;
}

.nav-table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 100%;
	max-width: 700px;
	table-layout: fixed;
}

.nav-table tr {
	display: table-row !important; 
}

.nav-item {
	padding: 0;
	text-align: center;
	display: table-cell !important; 
}

.nav-link {
	display: block;
	padding: 20px 0;
	text-decoration: none;
	color: #495057;
	font-size: 16px;
	font-weight: 500;
	letter-spacing: -0.5px;
	transition: all 0.25s ease;
	position: relative;
}

.nav-link:hover {
	color: #007aff;
	background-color: #f8f9fa;
}

.nav-link::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 3px;
	background-color: #007aff;
	transition: width 0.3s ease;
}

.nav-link:hover::after {
	width: 100%;
}
</style>

<div class="nav-menu-wrapper">
	<table class="nav-table">
		<tr>
			<td class="nav-item"><a href="/codegroup/list" class="nav-link">
					<spring:message code="menu.codegroup.list" />
			</a></td>
			<td class="nav-item"><a href="/codedetail/list" class="nav-link">
					<spring:message code="menu.codedetail.list" />
			</a></td>
			<td class="nav-item"><a href="/user/list" class="nav-link">
					<spring:message code="menu.user.admin" />
			</a></td>
			<td class="nav-item"><a href="/user/register" class="nav-link">
					<spring:message code="header.joinMember" />
			</a></td>
		</tr>
	</table>
</div>