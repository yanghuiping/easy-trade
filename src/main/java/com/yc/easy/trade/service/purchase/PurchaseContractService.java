package com.yc.easy.trade.service.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.dao.purchase.IPurchaseContractMapper;
import com.yc.easy.trade.domain.purchase.PurchaseContract;
import com.yc.easy.trade.domain.purchase.PurchaseProduct;
import com.yc.easy.trade.service.base.CommonService;

@Service("purchaseContractService")
public class PurchaseContractService {
	
	@Resource
	private IPurchaseContractMapper purchaseContractMapper;
	@Resource
	private PurchaseProductService purchaseProductService;
	@Resource
	private CommonService commonService;
	
	
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
	
	@SuppressWarnings("unchecked")
	public Integer addPurchaseRdTx(Map<String,Object> purchaseMap){
		PurchaseContract purchaseContract = (PurchaseContract)purchaseMap.get("purchaseContract");
		Integer id = this.addPurchaseContract(purchaseContract);
		List<PurchaseProduct> list = (List<PurchaseProduct>)purchaseMap.get("purchaseProductList");
		List<PurchaseProduct> purchaseProductList = list;
		List<PurchaseProduct> productList = new ArrayList<PurchaseProduct>();
		if(purchaseProductList != null && purchaseProductList.size() > 0){
			for(PurchaseProduct purchaseProduct : purchaseProductList){
				purchaseProduct.setContractId(id);
				productList.add(purchaseProduct);
			}
		}
		purchaseProductService.addPurchaseProductBatch(productList);
		return 1;
	}
	
	public String exportExcel(HttpServletRequest request,HttpServletResponse response, String fileName, Map<String,Object> map, List<HashMap<String,Object>> objectList){
		return commonService.exportExcel(request, response, fileName, map, objectList);
	}
}
