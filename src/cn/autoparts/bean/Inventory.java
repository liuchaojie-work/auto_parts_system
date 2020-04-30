package cn.autoparts.bean;

/**
 * 库存
 */
public class Inventory {
    private String proId;
    private Integer count;
    private String remark;

    public Inventory() {
    }

    public Inventory(String proId, Integer count, String remark) {
        this.proId = proId;
        this.count = count;
        this.remark = remark;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Inventory{" +
                "proId='" + proId + '\'' +
                ", count=" + count +
                ", remark='" + remark + '\'' +
                '}';
    }
}
