<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop | Notice Read</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/notice/read.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="loginId" />
		<c:set var="loginUserNo" value="1" />
	</sec:authorize>

	<div class="page-container">
		<div class="content-wrapper">
			<%-- [1] 공지사항 카드 --%>
			<div class="card">
				<div class="card-header">
					<spring:message code="notice.header.read" />
				</div>
				<form:form modelAttribute="notice">
					<form:hidden path="noticeNo" id="noticeNo" />
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

			<div class="comment-list-card card">
				<h3 class="comment-card-title">댓글 (${commentList.size()})</h3>
				<c:choose>
					<c:when test="${empty commentList}">
						<div class="empty-comment-msg">등록된 댓글이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${commentList}" var="c">
							<div class="comment-item">
								<div class="comment-header-flex">
									<div class="comment-user-info">
										<strong>${c.userId}</strong> <span>${c.regDate}</span>
									</div>
									<div class="comment-actions">
										<sec:authorize access="isAuthenticated()">
											<c:if test="${loginId eq c.userId}">
												<button type="button" class="btn-comment-edit-view"
													data-no="${c.commentNo}">수정</button>

												<form action="<c:url value='/comment/delete'/>"	method="post" >
													<input type="hidden" name="commentNo"
														value="${c.commentNo}" /> <input type="hidden"
														name="boardNo" value="${notice.noticeNo}" />
													<button type="submit"
														onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
												</form>
											</c:if>
										</sec:authorize>
									</div>
								</div>

								<div id="display_area_${c.commentNo}" class="comment-body">
									${c.content}</div>

								<div id="edit_area_${c.commentNo}">
									<form action="<c:url value='/comment/update'/>" method="post">
										<input type="hidden" name="commentNo" value="${c.commentNo}" />
										<input type="hidden" name="boardNo" value="${notice.noticeNo}" />
										<input type="hidden" name="userId" value="${loginId}" />
										<textarea name="content">${c.content}</textarea>
										<div>
											<button type="submit">저장</button>
											<button type="button" class="btn-edit-cancel"
												data-no="${c.commentNo}">취소</button>
										</div>
									</form>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="comment-write-card card">
				<h3 class="comment-card-title">댓글 작성</h3>
				<sec:authorize access="isAuthenticated()">
					<form id="commentForm" action="<c:url value='/comment/register'/>"
						method="post">
						<input type="hidden" name="boardNo" value="${notice.noticeNo}" />
						<input type="hidden" name="userNo" value="${loginUserNo}" /> <input
							type="hidden" name="userId" value="${loginId}" />
						<div class="comment-write-row">
							<div class="comment-writer-box">
								<input type="text" value="${loginId}" readonly />
							</div>
							<div class="comment-input-box">
								<textarea class="comment-write-text" name="content"
									placeholder="댓글을 입력하세요." required></textarea>
							</div>
							<div class="comment-submit-box">
								<button type="submit">등록</button>
							</div>
						</div>
					</form>
				</sec:authorize>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			$("#btnEdit").on("click", function() {

				let noticeNo = $("#noticeNo").val();
				self.location = "/notice/modify?noticeNo=" + noticeNo;
			});
			$("#btnRemove").on("click", function() {
				if (confirm("정말로 삭제하시겠습니까?")) {
					let noticeNo = $("#noticeNo").val();
					self.location = "/notice/remove?noticeNo=" + noticeNo;
				}
			});
			$("#btnList").on("click", function() {
				self.location = "/notice/list";
			});
			
			$(".btn-comment-edit-view").on("click", function() {
				let commentNo = $(this).data("no");
				$("#display_area_" + commentNo).hide();
				$("#edit_area_" + commentNo).show();
			});


		});
	</script>
</body>
</html>