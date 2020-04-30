package cn.autoparts.bean;

/**
 * 产品表
 */
public class Product {
    private String proId;
    private String typeno;
    private String cbId;
    private String img;
    private String descr;
    private String remark;

    public Product() {
    }

    public Product(String proId, String typeno,
                   String cbId, String img,
                   String descr, String remark) {
        this.proId = proId;
        this.typeno = typeno;
        this.cbId = cbId;
        this.img = img;
        this.descr = descr;
        this.remark = remark;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }


    public String getTypeno() {
        return typeno;
    }

    public void setTypeno(String typeno) {
        this.typeno = typeno;
    }

    public String getCbId() {
        return cbId;
    }

    public void setCbId(String cbId) {
        this.cbId = cbId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Product{" +
                "proId='" + proId + '\'' +
                ", typeno='" + typeno + '\'' +
                ", cbId='" + cbId + '\'' +
                ", img='" + img + '\'' +
                ", descr='" + descr + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
