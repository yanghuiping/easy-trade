package com.yc.easy.trade.dao.purchase;

import java.util.List;

import com.yc.easy.trade.domain.purchase.PurchaseContract;

public interface IPurchaseContractMapper {
	/**
	 * 查询
	 * @param purchaseContract
	 * @return
	 */
	public List<PurchaseContract> findBySelective(PurchaseContract purchaseContract);
	
	/**
	 * 创建
	 * @param purchaseContract
	 * @return
	 */
	public Integer create(PurchaseContract purchaseContract);
	
	/**
	 * 修改
	 * @param purchaseContract
	 * @return
	 */
	public Integer update(PurchaseContract purchaseContract);
}
