package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Item;
import com.project.domain.Member;
import com.project.domain.PayCoin;
import com.project.domain.UserItem;
import com.project.exception.NotEnoughCoinException;
import com.project.mapper.ChargeCoinMapper;
import com.project.mapper.UserItemMapper;

@Service
public class UserItemServiceImpl implements UserItemService {

	@Autowired
	private UserItemMapper mapper;

	@Autowired
	private ChargeCoinMapper coinMapper;

	@Override
	@Transactional
	public int register(Member member, Item _item) throws Exception {
		// 사용자 정보 번호
		int userNo = member.getUserNo();
		// 사용자가 가지고있는 코인
		int coin = member.getCoin();
		// 구입한 물건 정보번호
		int itemId = _item.getItemId();
		// 구입한 물건 가격
		int price = _item.getPrice();
		String itemName = _item.getItemName();

		// 장바구니 등록(구입한 사용자 정보, 구입한 상품 정보)
		UserItem userItem = new UserItem();
		userItem.setUserNo(userNo);
		userItem.setItemId(itemId);
		userItem.setItemName(itemName);

		// 사용자의 코인이 부족한지 체크한다.
		if (coin < price) {
			throw new NotEnoughCoinException("코인이 부족합니다.");
		}

		// 구매 상품에 대한 코인지급
		PayCoin payCoin = new PayCoin();
		payCoin.setUserNo(userNo);
		payCoin.setItemId(itemId);
		payCoin.setAmount(price);
		payCoin.setItemName(itemName);

		coinMapper.pay(payCoin); // 코인 지급
		coinMapper.createPayHistory(payCoin); // 구매 내역 등록

		// 장바구니 생성
		return mapper.register(userItem);
	}

	@Override
	public List<UserItem> list(Member member) throws Exception {
		return mapper.list(member);
	}

	@Override
	public UserItem read(UserItem userItem) throws Exception {
		return mapper.read(userItem);
	}
}
