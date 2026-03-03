package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.ChargeCoinMapper;
import com.project.mapper.UserItemMapper;

@Service
public class UserItemServiceImpl implements UserItemService {

	@Autowired
	private UserItemMapper mapper;
	
	@Autowired
	private ChargeCoinMapper coinMapper;
}
