package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Notice;
import com.project.service.NoticeCommentService;
import com.project.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;

	@Autowired
	private NoticeCommentService commentService;
	
	// 공지사항 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) throws Exception {
		Notice notice = new Notice();
		model.addAttribute(notice);
	}

	// 공지사항 등록 처리
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Notice notice, RedirectAttributes rttr) throws Exception {
		int count = service.register(notice);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "Fail");
		}
		return "redirect:/notice/list";
	}

	// 공지사항 목록 페이지
	@GetMapping("/list")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}

	@GetMapping("/read")
	public String read(Notice notice, Model model) throws Exception {
		// 💡 notice.getNoticeNo() 값이 제대로 들어있는지 확인!
		Notice dbNotice = service.read(notice);

		if (dbNotice == null) {
			log.error("공지사항을 찾을 수 없습니다. 번호: " + notice.getNoticeNo());
			return "redirect:/notice/list";
		}
		model.addAttribute("commentList", commentService.list(notice.getNoticeNo()));

		model.addAttribute("notice", dbNotice);
		return "notice/read";
	}

	// 공지사항 수정 페이지
	@GetMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modifyForm(Notice notice, Model model) throws Exception {

		Notice readNotice = service.read(notice);

		if (readNotice == null) {
			return "redirect:/notice/list";
		}
		model.addAttribute("notice", readNotice);

		return "notice/modify";
	}

	// 공지사항 수정 처리
	@PostMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(Notice notice, RedirectAttributes rttr) throws Exception {
		int count = service.modify(notice);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "Fail");
		}
		return "redirect:/notice/list";
	}

	// 공지사항 삭제 처리
	@GetMapping("/remove")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(Notice notice, RedirectAttributes rttr) throws Exception {
		int count = service.remove(notice);
		if (count != 0) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "Fail");
		}
		return "redirect:/notice/list";
	}

}
