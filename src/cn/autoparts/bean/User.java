package cn.autoparts.bean;

import java.sql.Timestamp;

/**
 * 账号信息
 */
public class User {
    private String userId;
    private String username;
    private String phone;
    private String email;
    private String activeCode;
    private String activeStatus;
    private String password;
    private Timestamp regTime;
    private String img;
    private String name;
    private String gender;
    private Integer iden;
    private String address;
    private String receiverAdd;
    private String logName;
    private String remark;

    public User() {
    }

    public User(String userId, String username, String phone,
                String email, String activeCode, String activeStatus,
                String password, Timestamp regTime, String img,
                String name, String gender, Integer iden,
                String address, String receiverAdd, String logName, String remark) {
        this.userId = userId;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.activeCode = activeCode;
        this.activeStatus = activeStatus;
        this.password = password;
        this.regTime = regTime;
        this.img = img;
        this.name = name;
        this.gender = gender;
        this.iden = iden;
        this.address = address;
        this.receiverAdd = receiverAdd;
        this.logName = logName;
        this.remark = remark;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    public String getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(String activeStatus) {
        this.activeStatus = activeStatus;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getRegTime() {
        return regTime;
    }

    public void setRegTime(Timestamp regTime) {
        this.regTime = regTime;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getIden() {
        return iden;
    }

    public void setIden(Integer iden) {
        this.iden = iden;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiverAdd() {
        return receiverAdd;
    }

    public void setReceiverAdd(String receiverAdd) {
        this.receiverAdd = receiverAdd;
    }

    public String getLogName() {
        return logName;
    }

    public void setLogName(String logName) {
        this.logName = logName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", activeCode='" + activeCode + '\'' +
                ", activeStatus='" + activeStatus + '\'' +
                ", password='" + password + '\'' +
                ", regTime=" + regTime +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", iden=" + iden +
                ", address='" + address + '\'' +
                ", receiverAdd='" + receiverAdd + '\'' +
                ", logName='" + logName + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
