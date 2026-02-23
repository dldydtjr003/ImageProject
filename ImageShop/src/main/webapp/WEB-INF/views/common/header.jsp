<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.main-header {
	height: 70px;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 40px;
	border-bottom: 1px solid #e1e4e8;
	position: sticky;
	top: 0;
	z-index: 1000;
}

.logo-area {
	font-size: 20px;
	font-weight: 800;
	color: #007aff;
	text-decoration: none;
	display: flex;
	align-items: center;
	gap: 8px;
}

.user-info {
	display: flex;
	align-items: center;
	gap: 15px;
	font-size: 14px;
	color: #4b5563;
}

.logout-link {
	color: #f04452;
	text-decoration: none;
	font-weight: 600;
	padding: 6px 12px;
	border-radius: 8px;
	background: #fff0f0;
	transition: 0.2s;
}

.logout-link:hover {
	background: #ffe0e0;
}
</style>

<header class="main-header">
	<a href="/" class="logo-area"> <i data-lucide="image"></i> <span>IMAGE
			SHOP</span>
	</a>

</header>
<hr>