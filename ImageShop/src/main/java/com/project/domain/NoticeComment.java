package com.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeComment {

	private int commentNo;
	private int boardNo;
	private int userNo;
	private String userId;
	private String content;
	private Date regDate;
}
