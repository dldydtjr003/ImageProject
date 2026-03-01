package com.project.service;

import java.util.List;

import org.jspecify.annotations.Nullable;

import com.project.domain.Notice;
import com.project.domain.NoticeComment;

public interface NoticeCommentService {

	public int register(NoticeComment comment) throws Exception;

	public List<NoticeComment> list(Notice notice) throws Exception;

	public List<Notice> list(int boardNo) throws Exception;


}
