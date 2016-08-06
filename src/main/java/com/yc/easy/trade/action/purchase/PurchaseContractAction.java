package com.yc.easy.trade.action.purchase;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yc.easy.trade.common.base.BaseAction;
import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.domain.purchase.PurchaseContract;
import com.yc.easy.trade.service.purchase.PurchaseContractService;
@Controller
@RequestMapping("/purchaseManage")
public class PurchaseContractAction extends BaseAction {
	
	@Autowired
	private PurchaseContractService purchaseContractService;
	
	/**
	 * 分页查询
	 * @param purchaseContract
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="/purchaseCountractIndex.htm")
	public ModelAndView purchaseContractList(@Param("purchaseContract")PurchaseContract purchaseContract,@Param("pageNo") String pageNo,@Param("pageSize") String pageSize){
		ModelAndView modelAndView = new ModelAndView("purchase/purchaseContractIndex");
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		int pageNoInt = 1;
		if(pageNo == null || "".equals(pageNo)){
			pageNoInt = 1;
		}else{
			pageNoInt = Integer.valueOf(pageNo);
		}
		int pageSizeInt = 10;
		if(pageSize != null){
			pageSizeInt = Integer.valueOf(pageSize);
		}
		if(purchaseContract != null){
			parameterMap.put("contractCode", purchaseContract.getContractCode());//和页面上的一致
		}
		Page resultPage = purchaseContractService.queryPurchaseContractPaged(parameterMap, pageNoInt, pageSizeInt);//page.getPageSize()
		modelAndView.addObject("page", resultPage);
		return modelAndView;
	}
	
	/**
	 * 详细查询
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/purchaseContractDetail.htm")
	public ModelAndView purchaseContractDetail(@Param("id") Integer id){
		ModelAndView modelAndView = new ModelAndView();
		if(id != null){
			
		}
		return modelAndView;
	}
	
	/**
	 * 新增
	 * @return
	 */
	@RequestMapping(value="/addPurchaseContract.htm")
	public ModelAndView addPurchaseContract(){
		ModelAndView modelAndView = new ModelAndView("purchase/addPurchaseContract");
		
		return modelAndView;
	}
	
	/**
	 * 保存
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/savePurchaseContract.htm")
	public String savePurchaseContract(ModelMap modelMap){
		return "";
	}
}
