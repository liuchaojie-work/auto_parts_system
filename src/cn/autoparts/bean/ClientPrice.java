package cn.autoparts.bean;

import java.sql.Timestamp;

/**
 * 客户价格
 */
public class ClientPrice {
    private String cpNo;
    private String userId;
    private String proId;
    private Integer price;
    private Timestamp time;
    private String remark;

    public ClientPrice() {
    }

    public ClientPrice(String cpNo, String userId,
                       String proId, Integer price,
                       Timestamp time, String remark) {
        this.cpNo = cpNo;
        this.userId = userId;
        this.proId = proId;
        this.price = price;
        this.time = time;
        this.remark = remark;
    }

    public String getCpNo() {
        return cpNo;
    }

    public void setCpNo(String cpNo) {
        this.cpNo = cpNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "ClientPrice{" +
                "cpNo='" + cpNo + '\'' +
                ", userId='" + userId + '\'' +
                ", proId='" + proId + '\'' +
                ", price=" + price +
                ", time=" + time +
                ", remark='" + remark + '\'' +
                '}';
    }
}
