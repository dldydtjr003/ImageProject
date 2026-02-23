package com.project.service;

import java.util.List;

import com.project.domain.CodeGroup;

public interface CodeGroupService {

	// 코드그룹 등록 처리 요청
	public int register(CodeGroup codeGroup) throws Exception;
	// 코드그룹 목록 페이지 요청
	public List<CodeGroup> list() throws Exception;
}
