package com.yc.easy.trade.vo;

import java.util.List;

import com.yc.easy.trade.domain.purchase.PurchaseContract;
/**
 * @author yanghuiping
 */
public class PurchaseVO extends PurchaseContract {
	
	private static final long serialVersionUID = 4432915733212790648L;
	
	private List<String> productModel; //型号
    private List<String> num; //数量
    private List<String> productSpecifications; //规格
    private List<String> remarks; //备注
    private List<String> productName; //商品名称
    private List<String> totalAmount; //总金额
    private List<String> unit; //单位
    private List<String> price; //单价
    private List<String> perValue; //1单位数量
	/**
	 * getter method
	 * @return the productModel
	 */
	public List<String> getProductModel() {
		return productModel;
	}
	/**
	 * setter method
	 * @param productModel the productModel to set
	 */
	public void setProductModel(List<String> productModel) {
		this.productModel = productModel;
	}
	/**
	 * getter method
	 * @return the num
	 */
	public List<String> getNum() {
		return num;
	}
	/**
	 * setter method
	 * @param num the num to set
	 */
	public void setNum(List<String> num) {
		this.num = num;
	}
	/**
	 * getter method
	 * @return the productSpecifications
	 */
	public List<String> getProductSpecifications() {
		return productSpecifications;
	}
	/**
	 * setter method
	 * @param productSpecifications the productSpecifications to set
	 */
	public void setProductSpecifications(List<String> productSpecifications) {
		this.productSpecifications = productSpecifications;
	}
	/**
	 * getter method
	 * @return the remarks
	 */
	public List<String> getRemarks() {
		return remarks;
	}
	/**
	 * setter method
	 * @param remarks the remarks to set
	 */
	public void setRemarks(List<String> remarks) {
		this.remarks = remarks;
	}
	/**
	 * getter method
	 * @return the productName
	 */
	public List<String> getProductName() {
		return productName;
	}
	/**
	 * setter method
	 * @param productName the productName to set
	 */
	public void setProductName(List<String> productName) {
		this.productName = productName;
	}
	/**
	 * getter method
	 * @return the totalAmount
	 */
	public List<String> getTotalAmount() {
		return totalAmount;
	}
	/**
	 * setter method
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(List<String> totalAmount) {
		this.totalAmount = totalAmount;
	}
	/**
	 * getter method
	 * @return the unit
	 */
	public List<String> getUnit() {
		return unit;
	}
	/**
	 * setter method
	 * @param unit the unit to set
	 */
	public void setUnit(List<String> unit) {
		this.unit = unit;
	}
	/**
	 * getter method
	 * @return the price
	 */
	public List<String> getPrice() {
		return price;
	}
	/**
	 * setter method
	 * @param price the price to set
	 */
	public void setPrice(List<String> price) {
		this.price = price;
	}
	/**
	 * getter method
	 * @return the perValue
	 */
	public List<String> getPerValue() {
		return perValue;
	}
	/**
	 * setter method
	 * @param perValue the perValue to set
	 */
	public void setPerValue(List<String> perValue) {
		this.perValue = perValue;
	}
    
}
