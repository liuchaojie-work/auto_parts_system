package cn.autoparts.dao;

import cn.autoparts.bean.User;

import java.sql.SQLException;
import java.util.List;

/**
 * 用户表
 */
public interface IUserDao {
    int findAllTotalCount(String condition) throws SQLException;
    int findAllAdminTotalCount(String condition) throws SQLException;
    int findAllCustomerTotalCount(String condition) throws SQLException;

    List<User> findAllByPage(int start, int pageSize, String condition) throws SQLException;
    List<User> findAllAdminByPage(int start, int pageSize, String condition) throws SQLException;
    List<User> findAllCustomerByPage(int start, int pageSize, String condition) throws SQLException;
    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<User> findAll() throws SQLException;

    /**
     * 根据账号密码查找
     * @param account
     * @param password
     * @return
     * @throws SQLException
     */
    User findByAccountAndPassword(String account, String password) throws SQLException;

    /**
     * 查找所有管理员
     * @return
     * @throws SQLException
     */
    List<User> findAllAdmin() throws SQLException;

    /**
     * 查找所有顾客
     * @return
     * @throws SQLException
     */
    List<User> findAllCustomer() throws SQLException;

    /**
     * 根据用户id查找
     * @param userId
     * @return
     * @throws SQLException
     */
    User findByUserId(String userId) throws SQLException;
    /**
     * 根据用户名查找
     * @param username
     * @return
     * @throws SQLException
     */
    User findByUsername(String username) throws SQLException;

    /**
     * 根据用户名查询用户
     * @param phone
     * @return
     * @throws SQLException
     */
    User findByPhone(String phone) throws SQLException;

    /**
     * 根据邮箱查找用户
     * @param email
     * @return
     * @throws SQLException
     */
    User findByEmail(String email) throws SQLException;

    /**
     * 根据用户名，电话，或邮件查询用户
     * @param account
     * @return
     * @throws SQLException
     */
    User findByThreeCondition(String account) throws  SQLException;
    /**
     * 条件查询顾客
     * @param condition
     * @return
     * @throws SQLException
     */
    List<User> findCustomerByCondition(String condition) throws SQLException;

    /**
     * 条件查询管理员
     * @param condition
     * @return
     * @throws SQLException
     */
    List<User> findAdminByCondition(String condition) throws SQLException;

    /**
     * 条件查询所有
     * @param condition
     * @return
     * @throws SQLException
     */
    List<User> findAllByCondition(String condition) throws SQLException;
    /**
     * 添加用户
     * @param user
     * @return
     * @throws SQLException
     */
    boolean add(User user) throws SQLException;

    /**
     * 修改用户
     * @param user
     * @return
     * @throws SQLException
     */
    boolean change(User user) throws SQLException;

    /**
     * 根据用户名完善信息
     * @param user
     * @return
     * @throws SQLException
     */
    boolean changeByUsername(User user) throws SQLException;
    /**
     * 修改密码
     * @param account
     * @param newPassword
     * @return
     * @throws SQLException
     */
    boolean changePassword(String account, String newPassword) throws SQLException;

    /**
     * 修改激活状态
     * @param activeCode
     * @return
     * @throws SQLException
     */
    boolean changeActiceStatus(String activeCode) throws SQLException;
    /**
     * 根据用户id删除用户
     * @param userId
     * @return
     * @throws SQLException
     */
    boolean deleteByUserId(String userId) throws SQLException;

    /**
     * 根据用户id批量删除用户
     * @param userIds
     * @return
     * @throws SQLException
     */
    boolean deleteByUserIds(String userIds) throws SQLException;

}
