package com.yc.easy.trade.service.purchase;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.dao.purchase.IPurchaseContractMapper;
import com.yc.easy.trade.domain.purchase.PurchaseContract;

@Service("purchaseContractService")
public class PurchaseContractService {
	
	@Resource
	private IPurchaseContractMapper purchaseContractMapper;
	
	public List<PurchaseContract> queryPurchaseContractList(PurchaseContract purchaseContract){
		return purchaseContractMapper.findBySelective(purchaseContract);
	}
	
	public Integer addPurchaseContract(PurchaseContract purchaseContract){
		return purchaseContractMapper.create(purchaseContract);
	}
	
	public Integer updatePurchaseContract(PurchaseContract purchaseContract){
		return purchaseContractMapper.update(purchaseContract);
	}
	
	public Page queryPurchaseContractPaged(Map<String,Object> parameterObject, int pageNo, int pageSize){
		int startIndex = Page.getStartOfPage(pageNo, pageSize);
		long totalCount = purchaseContractMapper.getPagesCount(parameterObject);
		if (totalCount < 1) {
			return new Page(pageSize);
		}
		parameterObject.put("startIndex", startIndex);
		parameterObject.put("endIndex", pageNo * pageSize);
		List<Object> list = purchaseContractMapper.getPages(parameterObject);
		return new Page(startIndex, totalCount, pageSize, list);
	}
}
