package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Notice;
import com.project.domain.NoticeComment;
import com.project.mapper.NoticeCommentMapper;

@Service
public class NoticeCommentServiceImpl implements NoticeCommentService {

	@Autowired
	private NoticeCommentMapper mapper;


	@Override
	public int register(NoticeComment comment) throws Exception {
		return mapper.register(comment);
	}


	@Override
	public List<NoticeComment> list(Notice notice) throws Exception {
		return mapper.list(notice);
	}


	@Override
	public List<Notice> list(int boardNo) throws Exception {
		return mapper.list(boardNo);
	}
	
}
