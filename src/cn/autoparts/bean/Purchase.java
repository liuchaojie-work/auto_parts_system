package cn.autoparts.bean;

import java.sql.Timestamp;

/**
 * 进货表
 */
public class Purchase {
    private String purNo;
    private String proId;
    private Integer purchasePrice;
    private Integer count;
    private Integer sellPrice;
    private Timestamp time;
    private String locNo;
    private String remark;

    public Purchase() {
    }

    public Purchase(String purNo, String proId,
                    Integer purchasePrice, Integer count,
                    Integer sellPrice, Timestamp time,
                    String locNo, String remark) {
        this.purNo = purNo;
        this.proId = proId;
        this.purchasePrice = purchasePrice;
        this.count = count;
        this.sellPrice = sellPrice;
        this.time = time;
        this.locNo = locNo;
        this.remark = remark;
    }

    public String getPurNo() {
        return purNo;
    }

    public void setPurNo(String purNo) {
        this.purNo = purNo;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Integer getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(Integer purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Integer sellPrice) {
        this.sellPrice = sellPrice;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getLocNo() {
        return locNo;
    }

    public void setLocNo(String locNo) {
        this.locNo = locNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "purNo='" + purNo + '\'' +
                ", proId='" + proId + '\'' +
                ", purchasePrice=" + purchasePrice +
                ", count=" + count +
                ", sellPrice=" + sellPrice +
                ", time=" + time +
                ", locNo='" + locNo + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
