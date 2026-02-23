<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.main-menu-nav {
	background: #ffffff;
	padding: 15px 40px;
	display: flex;
	gap: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.02);
}

.menu-item {
	padding: 10px 20px;
	border-radius: 12px;
	text-decoration: none;
	color: #4b5563;
	font-size: 15px;
	font-weight: 600;
	transition: all 0.2s;
	display: flex;
	align-items: center;
	gap: 6px;
}

.menu-item:hover {
	background-color: #f0f7ff;
	color: #007aff;
}

/* 활성화된 메뉴 스타일 (현재 페이지 표시) */
.menu-item.active {
	background-color: #007aff;
	color: #ffffff;
}
</style>

<nav class="main-menu-nav">
	<a href="/codegroup/list" class="menu-item active"> <i
		data-lucide="settings-2" style="width: 18px;"></i> 코드그룹 관리
	</a> <a href="/code/list" class="menu-item"> <i data-lucide="code"
		style="width: 18px;"></i> 공통코드 관리
	</a> <a href="/member/list" class="menu-item"> <i data-lucide="users"
		style="width: 18px;"></i> 회원 관리
	</a> <a href="/item/list" class="menu-item"> <i
		data-lucide="shopping-bag" style="width: 18px;"></i> 상품 관리
	</a>
</nav>

<script src="https://unpkg.com/lucide@latest"></script>
<script>
	lucide.createIcons();
</script>
<hr>