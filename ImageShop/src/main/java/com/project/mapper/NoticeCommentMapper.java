package com.project.mapper;

import java.util.List;

import com.project.domain.Notice;
import com.project.domain.NoticeComment;

public interface NoticeCommentMapper {

	public int register(NoticeComment comment) throws Exception;

	public List<NoticeComment> list(Notice notice) throws Exception;

	public List<Notice> list(int boardNo) throws Exception;

}
