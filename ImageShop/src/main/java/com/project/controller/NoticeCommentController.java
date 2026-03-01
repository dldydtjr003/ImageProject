package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.NoticeComment;
import com.project.service.NoticeCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/comment")
public class NoticeCommentController {

	@Autowired
	private NoticeCommentService service;

	@PostMapping("/register")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public String register(NoticeComment comment, RedirectAttributes rttr, Authentication auth) throws Exception {

		if (auth != null) {
			comment.setUserId(auth.getName());
		}

		service.register(comment);

		// 리다이렉트
		rttr.addAttribute("noticeNo", comment.getBoardNo());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/read";
	}

}
