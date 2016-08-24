package com.yc.easy.trade.action.purchase;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.easy.trade.common.base.BaseAction;
import com.yc.easy.trade.common.base.Constants;
import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.domain.purchase.PurchaseContract;
import com.yc.easy.trade.domain.purchase.PurchaseProduct;
import com.yc.easy.trade.service.purchase.PurchaseContractService;
import com.yc.easy.trade.vo.PurchaseVO;
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
	public String savePurchaseContract(ModelMap modelMap,PurchaseVO purchase){
		Map<String,Object> purchaseMap = new HashMap<String,Object>();
		
		PurchaseContract purchaseContract = new PurchaseContract();
		purchaseContract.setBuyCompanyName(purchase.getBuyCompanyName());
		purchaseContract.setBuyContactsName(purchase.getBuyContactsName());
		purchaseContract.setBuyContactsTel(purchase.getBuyContactsTel());
		purchaseContract.setContractCode(purchase.getContractCode());
		purchaseContract.setContractName(purchase.getContractName());
		purchaseContract.setCreateTime(new Date());
		purchaseContract.setDelFlag(Constants.DEL_FLAG_NO);
		purchaseContract.setEffectiveTime(purchase.getEffectiveTime());
		purchaseContract.setRemark(purchase.getRemark());
		purchaseContract.setSellCompanyName(purchase.getSellCompanyName());
		purchaseContract.setSellContactsName(purchase.getSellContactsName());
		purchaseContract.setSellContactsTel(purchase.getSellContactsTel());
		purchaseContract.setUpdateTime(new Date());
		purchaseMap.put("purchaseContract", purchaseContract);
		
		List<PurchaseProduct> purchaseProductList = new ArrayList<PurchaseProduct>();
		List<String> productNames = purchase.getProductName();//商品名称
		List<String> productModels = purchase.getProductModel();; //型号
	    List<String> nums = purchase.getNum();; //数量
	    List<String> productSpecifications = purchase.getProductSpecifications(); //规格
	    List<String> remarks = purchase.getRemarks();; //备注
	    List<String> totalAmounts = purchase.getTotalAmount(); //总金额
	    List<String> units = purchase.getUnit(); //单位
	    List<String> prices = purchase.getPrice();; //单价
	    List<String> perValues = purchase.getPerValue();; //1单位数量
		if(productNames != null && productNames.size() > 0){
			for(int i=0;i<productNames.size();i++){
				PurchaseProduct purchaseProduct = new PurchaseProduct();
				purchaseProduct.setCreateTime(new Date());
				purchaseProduct.setDelFlag(Constants.DEL_FLAG_NO);
				purchaseProduct.setNum(nums.get(i) != null && !"".equals(nums.get(i).trim()) ? new BigDecimal(nums.get(i)): new BigDecimal("0"));
				purchaseProduct.setPerValue(perValues.get(i));
				purchaseProduct.setPrice(prices.get(i) != null && !"".equals(prices.get(i)) ? new BigDecimal(prices.get(i)) : new BigDecimal("0"));
				purchaseProduct.setProductModel(productModels.get(i));
				purchaseProduct.setProductName(productNames.get(i));
				purchaseProduct.setProductSpecifications(productSpecifications.get(i));
				purchaseProduct.setRemark(remarks.get(i));
				purchaseProduct.setTotalAmount(totalAmounts.get(i) != null && !"".equals(new BigDecimal(totalAmounts.get(i))) ? new BigDecimal(totalAmounts.get(i)) : new BigDecimal("0"));
				purchaseProduct.setUnit(units.get(i));
				purchaseProduct.setUpdateTime(new Date());
				purchaseProductList.add(purchaseProduct);
			}
		}
		purchaseMap.put("purchaseProductList", purchaseProductList);
		purchaseContractService.addPurchaseRdTx(purchaseMap);
		return "redirect:/purchaseManage/purchaseCountractIndex.htm";
	}
	
	/**
	 * 
	  * @Title exportBidRecordExcel
	  * @Description 导出excel测试
	  * @author yanghuiping
	  * @param @param request
	  * @param @param response
	  * @param @return    设定文件
	  * @return String    返回类型
	  * @throws
	  * @date 2016年8月24日 下午5:26:33
	 */
	@RequestMapping(value="/exportExcel.htm",produces={"text/plain;charset=UTF-8"})
	@ResponseBody
	public String exportBidRecordExcel(HttpServletRequest request,HttpServletResponse response){
		//开始导出
		Map<String,Object> headerMap = new LinkedHashMap<String,Object>();
		headerMap.put("NO", "编号");
		headerMap.put("NAME", "名称");
		headerMap.put("SEX", "性别");
		headerMap.put("TEL", "电话");
		headerMap.put("EMAIL", "邮箱");
		try{
			String fileName = "测试.xls";
			List<HashMap<String, Object>> objectList = new ArrayList<HashMap<String,Object>>();
			for(int i=0;i<10;i++){
				HashMap<String,Object> hashMap = new HashMap<String,Object>();
				hashMap.put("NO", "编号_"+i);
				hashMap.put("NAME", "名称_"+i);
				hashMap.put("SEX", "性别_"+i);
				hashMap.put("TEL", "电话_"+i);
				hashMap.put("EMAIL", "邮箱_"+i);
				objectList.add(hashMap);
			}
			return purchaseContractService.exportExcel(request,response, fileName, headerMap, objectList);
		}catch(Exception e){
			logger.error("导出excel异常！");
			e.printStackTrace();
		}
		return null;
	}
}
