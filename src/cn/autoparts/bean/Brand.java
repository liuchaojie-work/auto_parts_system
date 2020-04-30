package cn.autoparts.bean;

/**
 * 品牌
 */
public class Brand {
    private String name;
    private String factory;
    private String place;
    private String remark;

    public Brand() {
    }

    public Brand(String name, String factory,
                 String place, String remark) {
        this.name = name;
        this.factory = factory;
        this.place = place;
        this.remark = remark;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "brand='" + name + '\'' +
                ", factory='" + factory + '\'' +
                ", place='" + place + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
