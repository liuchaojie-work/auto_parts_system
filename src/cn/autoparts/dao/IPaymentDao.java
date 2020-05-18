package cn.autoparts.dao;

import cn.autoparts.bean.Payment;

import java.sql.SQLException;
import java.util.List;

/**
 * 支付方式
 */
public interface IPaymentDao {

    int findTotalCount(String condition) throws SQLException;

    List<Payment> findByPage(int start, int pageSize, String condition) throws SQLException;

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Payment> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Payment> findAllByCondition(String condition) throws SQLException;

    /**
     * 根据支付方式查找
     * @param payWay
     * @return
     * @throws SQLException
     */
    Payment findByPayWay(String payWay) throws SQLException;

    /**
     * 增加
     * @param payment
     * @return
     * @throws SQLException
     */
    boolean add(Payment payment) throws SQLException;

    /**
     * 修改
     * @param payment
     * @return
     * @throws SQLException
     */
    boolean change(Payment payment) throws SQLException;

    /**
     * 根据支付方式删除
     * @param payWay
     * @return
     * @throws SQLException
     */
    boolean deleteByPayWay(String payWay) throws SQLException;

    /**
     * 根据支付方式批量删除
     * @param payWays
     * @return
     * @throws SQLException
     */
    boolean deleteByPayWays(String payWays) throws SQLException;
}
