package com.yc.easy.trade.test.purchase;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.yc.easy.trade.common.base.Constants;
import com.yc.easy.trade.domain.purchase.PurchaseContract;
import com.yc.easy.trade.service.purchase.PurchaseContractService;
import com.yc.easy.trade.test.base.BaseTest;

public class PurchaseTest extends BaseTest {
	
	@Resource
	private PurchaseContractService pourchaseContractService;
	
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
	
	
}
