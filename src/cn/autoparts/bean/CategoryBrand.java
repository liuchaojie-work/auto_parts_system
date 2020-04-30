package cn.autoparts.bean;

/**
 * 品牌和类别关联表
 */
public class CategoryBrand {
    private String cbId;
    private String cname;
    private String bname;
    private String remark;

    public CategoryBrand() {
    }

    public CategoryBrand(String cbId, String cname, String bname, String remark) {
        this.cbId = cbId;
        this.cname = cname;
        this.bname = bname;
        this.remark = remark;
    }

    public String getCbId() {
        return cbId;
    }

    public void setCbId(String cbId) {
        this.cbId = cbId;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "CategoryBrand{" +
                "cbId='" + cbId + '\'' +
                ", cname='" + cname + '\'' +
                ", bname='" + bname + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
