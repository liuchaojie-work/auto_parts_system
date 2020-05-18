package cn.autoparts.service.impl;

import cn.autoparts.bean.PageBean;
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
    public PageBean<Payment> pageQuery(int currentPage, int pageSize, String condition) throws PaymentException {
        PageBean<Payment> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = paymentDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<Payment> list = paymentDao.findByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PaymentException("分页查询失败！");
        }
    }

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
