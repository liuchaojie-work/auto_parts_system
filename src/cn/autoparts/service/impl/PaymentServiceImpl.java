package cn.autoparts.service.impl;

import cn.autoparts.bean.Payment;
import cn.autoparts.dao.IPaymentDao;
import cn.autoparts.dao.impl.PaymentDaoImpl;
import cn.autoparts.exception.PaymentException;
import cn.autoparts.service.IPaymentService;

import java.sql.SQLException;
import java.util.List;

public class PaymentServiceImpl implements IPaymentService {
    private IPaymentDao paymentDao = new PaymentDaoImpl();
    @Override
    public List<Payment> findAll() throws PaymentException {
        try {
            return paymentDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("查找失败！");
        }
    }

    @Override
    public List<Payment> findAllByCondition(String condition) throws PaymentException {
        try {
            return paymentDao.findAllByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("根据条件查找失败！");
        }
    }

    @Override
    public Payment findByPayWay(String payWay) throws PaymentException {
        try {
            return paymentDao.findByPayWay(payWay);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("根据支付方式查找失败！");
        }
    }

    @Override
    public boolean add(Payment payment) throws PaymentException {
        try {
            return paymentDao.add(payment);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("新增支付方式失败！");
        }
    }

    @Override
    public boolean change(Payment payment) throws PaymentException {
        try {
            return paymentDao.change(payment);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("修改失败！");
        }
    }

    @Override
    public boolean deleteByPayWay(String payWay) throws PaymentException {
        try {
            return paymentDao.deleteByPayWay(payWay);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("根据支付方式删除失败！");
        }
    }

    @Override
    public boolean deleteByPayWays(String payWays) throws PaymentException {
        try {
            return paymentDao.deleteByPayWays(payWays);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("根据支付方式批量删除失败！");
        }
    }
}
