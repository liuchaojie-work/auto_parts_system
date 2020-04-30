package cn.autoparts.bean;

import java.sql.Timestamp;

/**
 * 登录记录
 */
public class LoginInfo {
    private String no;
    private String userId;
    private Timestamp time;
    private String remark;

    public LoginInfo() {
    }

    public LoginInfo(String no, String userId,
                     Timestamp time, String remark) {
        this.no = no;
        this.userId = userId;
        this.time = time;
        this.remark = remark;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "LoginInfo{" +
                "no='" + no + '\'' +
                ", userId='" + userId + '\'' +
                ", time='" + time + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
