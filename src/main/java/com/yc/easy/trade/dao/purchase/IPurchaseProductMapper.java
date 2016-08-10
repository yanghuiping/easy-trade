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
	 * 
	  * @Title batchCreate
	  * @Description 批量创建
	  * @author yanghuiping
	  * @param @param purchaseProductList    设定文件
	  * @return void    返回类型
	  * @throws
	  * @date 2016年8月10日 下午4:27:18
	 */
	public void batchCreate(List<PurchaseProduct> purchaseProductList);
	
	/**
	 * 修改
	 * @param PurchaseProduct
	 * @return
	 */
	public Integer update(PurchaseProduct purchaseProduct);
}
