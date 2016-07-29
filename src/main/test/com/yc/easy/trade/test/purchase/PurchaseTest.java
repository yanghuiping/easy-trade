package com.yc.easy.trade.test.purchase;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import com.yc.easy.trade.common.base.Constants;
import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.domain.purchase.PurchaseContract;
import com.yc.easy.trade.domain.purchase.PurchaseProduct;
import com.yc.easy.trade.service.purchase.PurchaseContractService;
import com.yc.easy.trade.service.purchase.PurchaseProductService;
import com.yc.easy.trade.test.base.BaseTest;

public class PurchaseTest extends BaseTest {
	
	@Resource
	private PurchaseContractService pourchaseContractService;
	@Resource
	private PurchaseProductService pourchaseProductService;
	
	@Test
	public void create() throws Exception{
		PurchaseContract purchaseContract = new PurchaseContract();
		purchaseContract.setContractCode("ls1000000001");
		purchaseContract.setContractName("测试合同");
		purchaseContract.setCreateTime(new Date());
		purchaseContract.setUpdateTime(new Date());
		purchaseContract.setDelFlag(Constants.DEL_FLAG_NO);
//		purchaseContract.setBuyCompanyName("");
//		purchaseContract.setBuyContactsName("");
//		purchaseContract.setBuyContactsTel("");
//		purchaseContract.setSellCompanyName("");
//		purchaseContract.setSellContactsName("");
//		purchaseContract.setSellContactsTel("");
//		purchaseContract.setEffectiveTime(new Date());
//		purchaseContract.setRemark("");
//		purchaseContract.setId(new BigDecimal("11"));
		int id = pourchaseContractService.addPurchaseContract(purchaseContract);
		System.out.println(id +":"+ purchaseContract.getId());
	}
	
	@Test
	public void update(){
		PurchaseContract purchaseContract = new PurchaseContract();
		purchaseContract.setContractCode("ls1000000001-1");
		purchaseContract.setContractName("测试合同-修改");
		purchaseContract.setCreateTime(new Date());
		purchaseContract.setUpdateTime(new Date());
		purchaseContract.setDelFlag(Constants.DEL_FLAG_NO);
		purchaseContract.setId(1);
		
		purchaseContract.setBuyCompanyName("BuyCompanyName");
		purchaseContract.setBuyContactsName("BuyContactsName");
		purchaseContract.setBuyContactsTel("BuyContactsTel");
		purchaseContract.setSellCompanyName("SellCompanyName");
		purchaseContract.setSellContactsName("SellContactsName");
		purchaseContract.setSellContactsTel("SellContactsTel");
		purchaseContract.setEffectiveTime(new Date());
		purchaseContract.setRemark("remark");
		
		Integer r = pourchaseContractService.updatePurchaseContract(purchaseContract);
		System.out.println(r);
	}
	
	@Test
	public void query() throws Exception{
		PurchaseContract purchaseContract = new PurchaseContract();
		List<PurchaseContract> list = pourchaseContractService.queryPurchaseContractList(purchaseContract);
		System.out.println(list.size());
	}
	
	@Test
	public void queryPage(){
		Map<String,Object> parameterObject = new HashMap<String,Object>();
		int pageNo = 2;
		int pageSize = 3;
		Page page = pourchaseContractService.queryPurchaseContractPaged(parameterObject, pageNo, pageSize);
		List<PurchaseContract> list = (List<PurchaseContract>)page.getData();
		for(PurchaseContract purchaseContract : list){
			System.out.println(purchaseContract.getContractName());
		}
		System.out.println(list.size());
	}
	
	//--------采购产品
	@Test
	public void createPurchaseProduct(){
		for(int i=0;i<5;i++){
			PurchaseProduct purchaseProduct = new PurchaseProduct();
			purchaseProduct.setContractId(1);
			purchaseProduct.setDelFlag(Constants.DEL_FLAG_NO);
			purchaseProduct.setUpdateTime(new Date());
			purchaseProduct.setCreateTime(new Date());
			purchaseProduct.setProductName("产品_"+i);
			pourchaseProductService.addPurchaseProduct(purchaseProduct);
		}
	}
	
}
