package cn.autoparts.bean;

/**
 * 支付表
 */
public class Payment {
    private String payWay;
    private String payStatus;
    private String remark;

    public Payment() {
    }

    public Payment(String payWay, String payStatus, String remark) {
        this.payWay = payWay;
        this.payStatus = payStatus;
        this.remark = remark;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "payWay='" + payWay + '\'' +
                ", payStatus='" + payStatus + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
