package cn.autoparts.bean;

/**
 * 物流
 */
public class Logistics {
    private String name;
    private String phone;
    private String address;
    private String remark;

    public Logistics() {
    }

    public Logistics(String name, String phone,
                     String address, String remark) {
        this.name = name;
        this.phone = phone;
        this.address = address;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
                ", address='" + address + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
