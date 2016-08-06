/**
*
* auto generated by ibatis tools 
*
**/
package com.yc.easy.trade.domain.purchase;


/**
* purchase_contract
*/

public class PurchaseContract  implements java.io.Serializable {

	private static final long serialVersionUID = 3765318696628084848L;
	
	private String buyContactsTel; //需方联系人电话
    private java.util.Date effectiveTime; //合同签订时间
    private String sellContactsTel; //供方联系人电话
    private java.util.Date updateTime; //更新时间
    private String remark; //备注
    private Integer delFlag; //删除标识。0：非删除；1：删除
    private String buyContactsName; //需方联系人姓名
    private String sellCompanyName; //供方公司名称
    private java.util.Date createTime; //添加时间
    private String contractName; //合同名称
    private Integer id; //主键ID，自动生成
    private String buyCompanyName; //需方公司名称
    private String contractCode; //合同编号
    private String sellContactsName; //供方联系人姓名

    public String getBuyContactsTel (){
        return buyContactsTel;
    }
    
    public void setBuyContactsTel (String buyContactsTel){
        this.buyContactsTel = buyContactsTel;
    }
    public java.util.Date getEffectiveTime (){
        return effectiveTime;
    }
    
    public void setEffectiveTime (java.util.Date effectiveTime){
        this.effectiveTime = effectiveTime;
    }
    public String getSellContactsTel (){
        return sellContactsTel;
    }
    
    public void setSellContactsTel (String sellContactsTel){
        this.sellContactsTel = sellContactsTel;
    }
    public java.util.Date getUpdateTime (){
        return updateTime;
    }
    
    public void setUpdateTime (java.util.Date updateTime){
        this.updateTime = updateTime;
    }
    public String getRemark (){
        return remark;
    }
    
    public void setRemark (String remark){
        this.remark = remark;
    }
    public Integer getDelFlag (){
        return delFlag;
    }
    
    public void setDelFlag (Integer delFlag){
        this.delFlag = delFlag;
    }
    public String getBuyContactsName (){
        return buyContactsName;
    }
    
    public void setBuyContactsName (String buyContactsName){
        this.buyContactsName = buyContactsName;
    }
    public String getSellCompanyName (){
        return sellCompanyName;
    }
    
    public void setSellCompanyName (String sellCompanyName){
        this.sellCompanyName = sellCompanyName;
    }
    public java.util.Date getCreateTime (){
        return createTime;
    }
    
    public void setCreateTime (java.util.Date createTime){
        this.createTime = createTime;
    }
    public String getContractName (){
        return contractName;
    }
    
    public void setContractName (String contractName){
        this.contractName = contractName;
    }
    public Integer getId (){
        return id;
    }
    
    public void setId (Integer id){
        this.id = id;
    }
    public String getBuyCompanyName (){
        return buyCompanyName;
    }
    
    public void setBuyCompanyName (String buyCompanyName){
        this.buyCompanyName = buyCompanyName;
    }
    public String getContractCode (){
        return contractCode;
    }
    
    public void setContractCode (String contractCode){
        this.contractCode = contractCode;
    }
    public String getSellContactsName (){
        return sellContactsName;
    }
    
    public void setSellContactsName (String sellContactsName){
        this.sellContactsName = sellContactsName;
    }

}