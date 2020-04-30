package cn.autoparts.bean;

/**
 * 库位
 */
public class Location {
    private String no;
    private String loca;
    private String remark;

    public Location() {
    }

    public Location(String no, String loca, String remark) {
        this.no = no;
        this.loca = loca;
        this.remark = remark;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getLoca() {
        return loca;
    }

    public void setLoca(String loca) {
        this.loca = loca;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Location{" +
                "no='" + no + '\'' +
                ", loca='" + loca + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}

