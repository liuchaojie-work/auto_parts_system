package cn.autoparts.bean;

/**
 * 产品类别
 */
public class Category {
    private String name;
    private String unit;
    private String remark;

    public Category() {
    }

    public Category(String name, String unit, String remark) {
        this.name = name;
        this.unit = unit;
        this.remark = remark;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Category{" +
                "name='" + name + '\'' +
                ", unit='" + unit + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
