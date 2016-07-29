package com.yc.easy.trade.dao.purchase;

import java.util.List;

import com.yc.easy.trade.dao.base.IBasePageMapper;
import com.yc.easy.trade.domain.purchase.PurchaseProduct;

public interface IPurchaseProductMapper extends IBasePageMapper{
	/**
	 * 查询
	 * @param PurchaseProduct
	 * @return
	 */
	public List<PurchaseProduct> findBySelective(PurchaseProduct purchaseProduct);
	
	/**
	 * 创建
	 * @param PurchaseProduct
	 * @return
	 */
	public Integer create(PurchaseProduct purchaseProduct);
	
	/**
	 * 修改
	 * @param PurchaseProduct
	 * @return
	 */
	public Integer update(PurchaseProduct purchaseProduct);
}
