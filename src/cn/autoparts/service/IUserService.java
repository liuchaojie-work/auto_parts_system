package cn.autoparts.service;

import cn.autoparts.bean.User;
import cn.autoparts.exception.UserException;

import java.util.List;

public interface IUserService {
    /**
     * 查找所有
     * @return
     * @throws UserException
     */
    List<User> findAll() throws UserException;

    /**
     * 查找所有管理员
     * @return
     * @throws UserException
     */
    List<User> findAllAdmin() throws UserException;

    /**
     * 查找所有顾客
     * @return
     * @throws UserException
     */
    List<User> findAllCustomer() throws UserException;

    /**
     * 根据用户名查找
     * @param username
     * @return
     * @throws UserException
     */
    User findByUsername(String username) throws UserException;

    /**
     * 根据用户名查询用户
     * @param phone
     * @return
     * @throws UserException
     */
    User findByPhone(String phone) throws UserException;

    /**
     * 根据邮箱查找用户
     * @param email
     * @return
     * @throws UserException
     */
    User findByEmail(String email) throws UserException;

    /**
     * 根据用户名，电话，或邮件查询用户
     * @param account
     * @return
     * @throws UserException
     */
    User findByThreeCondition(String account) throws  UserException;
    /**
     * 条件查询顾客
     * @param condition
     * @return
     * @throws UserException
     */
    List<User> findCustomerByCondition(String condition) throws UserException;

    /**
     * 条件查询管理员
     * @param condition
     * @return
     * @throws UserException
     */
    List<User> findAdminByCondition(String condition) throws UserException;

    /**
     * 添加用户
     * @param user
     * @return
     * @throws UserException
     */
    boolean add(User user) throws UserException;

    /**
     * 修改用户
     * @param user
     * @return
     * @throws UserException
     */
    boolean change(User user) throws UserException;

    /**
     * 根据用户id删除用户
     * @param userId
     * @return
     * @throws UserException
     */
    boolean deleteByUserId(String userId) throws UserException;

    /**
     * 根据用户id批量删除用户
     * @param userIds
     * @return
     * @throws UserException
     */
    boolean deleteByUserIds(String userIds) throws UserException;
}
