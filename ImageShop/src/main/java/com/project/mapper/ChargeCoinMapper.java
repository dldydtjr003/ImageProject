package com.project.mapper;

import java.util.List;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;
import com.project.domain.PayCoin;

public interface ChargeCoinMapper {

	// 개인코인 충전
	public int charge(ChargeCoin chargeCoin) throws Exception;

	// 충전내역 등록
	public int create(ChargeCoin chargeCoin) throws Exception;

	// 충전내역 리스트
	public List<ChargeCoin> list(int userNo) throws Exception;
	
	// 개인코인 차감
	public int pay(PayCoin payCoin) throws Exception; 
	
	// 차감내역 등록
	public int createPayHistory(PayCoin payCoin) throws Exception;

	// 구매내역 조회
	public List<PayCoin> listPayHistory(Member member) throws Exception;
}
