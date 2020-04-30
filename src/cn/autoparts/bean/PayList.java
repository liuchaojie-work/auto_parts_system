package cn.autoparts.bean;

import java.sql.Timestamp;

/**
 * 付款记录
 */
public class PayList {
    private Timestamp payTime;
    private String userId;
    private Integer payMoney;
    private Integer payIden;
    private String payWay;
    private String remark;

    public PayList() {
    }

    public PayList(Timestamp payTime, String userId,
                   Integer payMoney, Integer payIden,
                   String payWay, String remark) {
        this.payTime = payTime;
        this.userId = userId;
        this.payMoney = payMoney;
        this.payIden = payIden;
        this.payWay = payWay;
        this.remark = remark;
    }

    public Timestamp getPayTime() {
        return payTime;
    }

    public void setPayTime(Timestamp payTime) {
        this.payTime = payTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(Integer payMoney) {
        this.payMoney = payMoney;
    }

    public Integer getPayIden() {
        return payIden;
    }

    public void setPayIden(Integer payIden) {
        this.payIden = payIden;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "PayList{" +
                "payTime=" + payTime +
                ", userId='" + userId + '\'' +
                ", payMoney=" + payMoney +
                ", payIden=" + payIden +
                ", payWay='" + payWay + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
