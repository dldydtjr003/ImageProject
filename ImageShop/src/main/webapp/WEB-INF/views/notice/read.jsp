<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Notice Read</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/notice/read.css'/>">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="page-container">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-header">
					<spring:message code="notice.header.read" />
				</div>

				<form:form modelAttribute="notice">
					<form:hidden path="noticeNo" />

					<table>
						<tr>
							<td><spring:message code="notice.title" /></td>
							<td><form:input path="title" readonly="true" /></td>
						</tr>
						<tr>
							<td><spring:message code="notice.content" /></td>
							<td><form:textarea path="content" readonly="true" /></td>
						</tr>
					</table>
				</form:form>

				<div class="btn-group">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="btnEdit">수정</button>
						<button type="button" id="btnRemove">삭제</button>
					</sec:authorize>
					<button type="button" id="btnList">목록</button>
				</div>
			</div>

			<div class="card">
				<div class="comment-section-title">댓글 목록</div>

				<form id="commentForm" action="/comment/register" method="post">
					<input type="hidden" name="boardNo" value="${notice.noticeNo}">
					<input type="hidden" id="userNo" name="userNo" value="1">

					<div class="comment-input-area">
						<textarea id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
						<button type="button" id="btnRegister">등록</button>
						<div style="clear: both;"></div>
					</div>
				</form>

				<div class="comment-list">
					<c:choose>
						<c:when test="${empty commentList}">
							<div style="text-align: center; color: #94a3b8; padding: 30px 0;">등록된
								댓글이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="comment" items="${commentList}">
								<div class="comment-item">
									<div class="comment-info">
										<span class="comment-user">${comment.userId}</span> <span>${comment.regDate}</span>
									</div>
									<div class="comment-content">${comment.content}</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			// 버튼 클릭 이벤트
			$("#btnEdit").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				self.location = "/notice/modify?noticeNo=" + noticeNo;
			});

			$("#btnRemove").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				if (confirm("정말로 삭제하시겠습니까?")) {
					self.location = "/notice/remove?noticeNo=" + noticeNo;
				}
			});

			$("#btnList").on("click", function() {
				self.location = "/notice/list"
			});

			// 댓글 등록
			$("#btnRegister").on("click", function() {
				const userNo = $("#userNo").val();
				const content = $("#content").val();

				if (!userNo || userNo === "") {
					alert("로그인 후 댓글을 작성할 수 있습니다.");
					return;
				}
				if (!content || content.trim() === "") {
					alert("댓글 내용을 입력해주세요.");
					return;
				}
				$("#commentForm").submit();
			});
		});
	</script>
</body>
</html>