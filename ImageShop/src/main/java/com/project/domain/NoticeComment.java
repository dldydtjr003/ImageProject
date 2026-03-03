package com.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeComment {

	private Integer commentNo;
	private Integer boardNo;
	private Integer userNo;
	private String userId;
	private String content;
	private Date regDate;
}
