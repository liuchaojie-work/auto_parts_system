package cn.autoparts.service;

import cn.autoparts.bean.Payment;
import cn.autoparts.exception.PaymentException;

import java.util.List;

/**
 * 支付方式
 */
public interface IPaymentService {
    /**
     * 查找所有
     * @return
     * @throws PaymentException
     */
    List<Payment> findAll() throws PaymentException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws PaymentException
     */
    List<Payment> findAllByCondition(String condition) throws PaymentException;

    /**
     * 根据支付方式查找
     * @param payWay
     * @return
     * @throws PaymentException
     */
    Payment findByPayWay(String payWay) throws PaymentException;

    /**
     * 增加
     * @param payment
     * @return
     * @throws PaymentException
     */
    boolean add(Payment payment) throws PaymentException;

    /**
     * 修改
     * @param payment
     * @return
     * @throws PaymentException
     */
    boolean change(Payment payment) throws PaymentException;

    /**
     * 根据支付方式删除
     * @param payWay
     * @return
     * @throws PaymentException
     */
    boolean deleteByPayWay(String payWay) throws PaymentException;

    /**
     * 根据支付方式批量删除
     * @param payWays
     * @return
     * @throws PaymentException
     */
    boolean deleteByPayWays(String payWays) throws PaymentException;
}
