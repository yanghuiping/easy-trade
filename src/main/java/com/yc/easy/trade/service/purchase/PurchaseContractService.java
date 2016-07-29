package com.yc.easy.trade.service.purchase;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
}
