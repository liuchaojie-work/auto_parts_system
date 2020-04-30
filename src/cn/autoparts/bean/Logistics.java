package cn.autoparts.bean;

/**
 * 物流
 */
public class Logistics {
    private String name;
    private String phone;
    private String add;
    private String remark;

    public Logistics() {
    }

    public Logistics(String name, String phone,
                     String add, String remark) {
        this.name = name;
        this.phone = phone;
        this.add = add;
        this.remark = remark;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Logistics{" +
                "name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", add='" + add + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
