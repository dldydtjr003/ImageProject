package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.security.domain.CustomUser;
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

		comment.setUserId(auth.getName());

		int count = service.register(comment);
		if(count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}else {
			rttr.addFlashAttribute("msg", "Fail");
		}
		rttr.addAttribute("noticeNo", comment.getBoardNo());

		return "redirect:/notice/read";
	}

	@PostMapping("/update")
	public String update(NoticeComment comment, Authentication auth, RedirectAttributes rttr) throws Exception {
		CustomUser customUser = (CustomUser)auth.getPrincipal();

		comment.setUserId(customUser.getUsername());

		service.update(comment);

		rttr.addAttribute("noticeNo", comment.getBoardNo());
		return "redirect:/notice/read";
	}
	
	@PostMapping("/delete")
	public String delete(NoticeComment comment, RedirectAttributes rttr, Authentication auth) throws Exception{
		CustomUser customUser = (CustomUser)auth.getPrincipal();

		comment.setUserId(customUser.getUsername());
		service.delete(comment);

		rttr.addAttribute("noticeNo", comment.getBoardNo());
		return "redirect:/notice/read";
	}
	

}
