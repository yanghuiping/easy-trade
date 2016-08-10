package com.yc.easy.trade.service.purchase;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.dao.purchase.IPurchaseProductMapper;
import com.yc.easy.trade.domain.purchase.PurchaseProduct;

@Service("purchaseProductService")
public class PurchaseProductService {
	@Resource
	private IPurchaseProductMapper purchaseProductMapper;
	
	public List<PurchaseProduct> queryPurchaseProductList(PurchaseProduct purchaseProduct){
		return purchaseProductMapper.findBySelective(purchaseProduct);
	}
	
	public Integer addPurchaseProduct(PurchaseProduct purchaseProduct){
		return purchaseProductMapper.create(purchaseProduct);
	}
	
	public void addPurchaseProductBatch(List<PurchaseProduct> purchaseProductList){
		purchaseProductMapper.batchCreate(purchaseProductList);
	}
	
	public Integer updatePurchaseProduct(PurchaseProduct purchaseProduct){
		return purchaseProductMapper.update(purchaseProduct);
	}
	
	public Page queryPurchaseProductPaged(Map<String,Object> parameterObject, int pageNo, int pageSize){
		int startIndex = Page.getStartOfPage(pageNo, pageSize);
		long totalCount = purchaseProductMapper.getPagesCount(parameterObject);
		if (totalCount < 1) {
			return new Page(pageSize);
		}
		parameterObject.put("startIndex", startIndex);
		parameterObject.put("endIndex", pageNo * pageSize);
		List<Object> list = purchaseProductMapper.getPages(parameterObject);
		return new Page(startIndex, totalCount, pageSize, list);
	}
}
