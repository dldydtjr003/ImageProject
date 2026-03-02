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
					<input type="hidden" id="userNo" name="userNo" value="1"> <input
						type="hidden" name="commentNo" value="${comment.commentNo}">

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
								<div class="comment-item" id="comment_${comment.commentNo}">
									<div class="comment-info">
										<span class="comment-user">${comment.userId}</span> <span>${comment.regDate}</span>

										<sec:authorize access="isAuthenticated()">
											<c:set var="loginId">
												<sec:authentication property="principal.username" />
											</c:set>
											<c:if test="${loginId eq comment.userId}">
												<div class="comment-actions"
													style="display: inline; margin-left: 10px;">
													<a href="javascript:void(0)"
														onclick="showEditForm('${comment.commentNo}', '${comment.content}')"
														style="font-size: 12px; color: #3b82f6;">수정</a> <a
														href="javascript:void(0)"
														onclick="deleteComment('${comment.commentNo}')"
														style="font-size: 12px; color: #ef4444; margin-left: 5px;">삭제</a>
												</div>
											</c:if>
										</sec:authorize>
									</div>

									<div class="comment-content" id="content_${comment.commentNo}">${comment.content}</div>

									<div class="edit-area" id="edit_area_${comment.commentNo}"
										style="display: none; margin-top: 10px;">
										<textarea id="edit_input_${comment.commentNo}"
											style="width: 100%; border: 1px solid #ddd;">${comment.content}</textarea>
										<div style="text-align: right; margin-top: 5px;">
											<button type="button"
												onclick="updateComment('${comment.commentNo}')">완료</button>
											<button type="button"
												onclick="hideEditForm('${comment.commentNo}')">취소</button>
										</div>
									</div>
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
		function showEditForm(no, content) {
			$(".edit-area").hide();
			$(".comment-content").show();

			$("#content_" + no).hide();
			$("#edit_area_" + no).show();
		}

		function hideEditForm(no) {
			$("#content_" + no).show();
			$("#edit_area_" + no).hide();
		}

		function updateComment(no) {
			const newContent = $("#edit_input_" + no).val();

			if (!newContent.trim()) {
				alert("내용을 입력해주세요.");
				return;
			}

			if (confirm("댓글을 수정하시겠습니까?")) {
				const form = $('<form></form>');
				form.attr("method", "post");
				form.attr("action", "/comment/update");

				form.append($('<input/>', {
					type : 'hidden',
					name : 'commentNo',
					value : no
				}));
				form.append($('<input/>', {
					type : 'hidden',
					name : 'content',
					value : newContent
				}));
				form.append($('<input/>', {
					type : 'hidden',
					name : 'noticeNo',
					value : '${notice.noticeNo}'
				}));
				form.append($('<input/>', {
					type : 'hidden',
					name : 'boardNo',
					value : '${notice.noticeNo}'
				}));

				form.appendTo('body');
				form.submit();
			}
		}
			function deleteComment(no) {
				if (confirm("댓글을 삭제하시겠습니까?")) {
					const form = $('<form></form>');
					form.attr("method", "post");
					form.attr("action", "/comment/delete");

					form.append($('<input/>', {
						type : 'hidden',
						name : 'commentNo',
						value : no
					}));

					form.append($('<input/>', {
						type : 'hidden',
						name : 'boardNo',
						value : '${notice.noticeNo}'
					}));

					form.appendTo('body');
					form.submit();
				}
			}
	</script>
</body>
</html>