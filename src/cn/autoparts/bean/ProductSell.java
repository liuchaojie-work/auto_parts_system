package cn.autoparts.bean;

/**
 * 产品销售表
 */
public class ProductSell {
    private String sellNo;
    private String purNo;
    private Integer sellNum;
    private String userId;
    private Integer sellAll;
    private String payWay;
    private Integer sellIden;
    private String remark;

    public ProductSell() {
    }

    public ProductSell(String sellNo, String purNo,
                       Integer sellNum, String userId,
                       Integer sellAll, String payWay,
                       Integer sellIden, String remark) {
        this.sellNo = sellNo;
        this.purNo = purNo;
        this.sellNum = sellNum;
        this.userId = userId;
        this.sellAll = sellAll;
        this.payWay = payWay;
        this.sellIden = sellIden;
        this.remark = remark;
    }

    public String getSellNo() {
        return sellNo;
    }

    public void setSellNo(String sellNo) {
        this.sellNo = sellNo;
    }

    public String getPurNo() {
        return purNo;
    }

    public void setPurNo(String purNo) {
        this.purNo = purNo;
    }

    public Integer getSellNum() {
        return sellNum;
    }

    public void setSellNum(Integer sellNum) {
        this.sellNum = sellNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getSellAll() {
        return sellAll;
    }

    public void setSellAll(Integer sellAll) {
        this.sellAll = sellAll;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public Integer getSellIden() {
        return sellIden;
    }

    public void setSellIden(Integer sellIden) {
        this.sellIden = sellIden;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "ProductSell{" +
                "sellNo='" + sellNo + '\'' +
                ", purNo='" + purNo + '\'' +
                ", sellNum=" + sellNum +
                ", userId='" + userId + '\'' +
                ", sellAll=" + sellAll +
                ", payWay='" + payWay + '\'' +
                ", sellIden=" + sellIden +
                ", remark='" + remark + '\'' +
                '}';
    }
}
