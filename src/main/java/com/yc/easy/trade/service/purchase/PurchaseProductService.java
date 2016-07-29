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
	private IPurchaseProductMapper PurchaseProductMapper;
	
	public List<PurchaseProduct> queryPurchaseProductList(PurchaseProduct purchaseProduct){
		return PurchaseProductMapper.findBySelective(purchaseProduct);
	}
	
	public Integer addPurchaseProduct(PurchaseProduct purchaseProduct){
		return PurchaseProductMapper.create(purchaseProduct);
	}
	
	public Integer updatePurchaseProduct(PurchaseProduct purchaseProduct){
		return PurchaseProductMapper.update(purchaseProduct);
	}
	
	public Page queryPurchaseProductPaged(Map<String,Object> parameterObject, int pageNo, int pageSize){
		int startIndex = Page.getStartOfPage(pageNo, pageSize);
		long totalCount = PurchaseProductMapper.getPagesCount(parameterObject);
		if (totalCount < 1) {
			return new Page(pageSize);
		}
		parameterObject.put("startIndex", startIndex);
		parameterObject.put("endIndex", pageNo * pageSize);
		List<Object> list = PurchaseProductMapper.getPages(parameterObject);
		return new Page(startIndex, totalCount, pageSize, list);
	}
}
