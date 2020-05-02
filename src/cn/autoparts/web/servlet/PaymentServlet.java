package cn.autoparts.web.servlet;

import cn.autoparts.bean.Payment;
import cn.autoparts.exception.PaymentException;
import cn.autoparts.service.IPaymentService;
import cn.autoparts.service.impl.PaymentServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/payment/*")
public class PaymentServlet extends BaseServlet {
    private IPaymentService paymentService = new PaymentServiceImpl();
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Payment> payments = paymentService.findAll();
            writeValue(payments, response);
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }

    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Payment> byCondition = paymentService.findAllByCondition(condition);
            writeValue(byCondition, response);
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }
    public void findByPayWay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String payWay = request.getParameter("payWay");
        try {
            Payment byPayWay = paymentService.findByPayWay(payWay);
            writeValue(byPayWay, response);
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Payment payment = new Payment();
        try {
            BeanUtils.populate(payment, params);
            boolean flag = paymentService.add(payment);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }
    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Payment payment = new Payment();
        try {
            BeanUtils.populate(payment, params);
            boolean flag = paymentService.change(payment);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }

    public void deleteByPayWay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String payWay = request.getParameter("payWay");
        try {
            boolean flag = paymentService.deleteByPayWay(payWay);
            writeValue(flag, response);
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }
    public void deleteByPayWays(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String payWays = request.getParameter("payWays");
        try {
            boolean flag = paymentService.deleteByPayWays(payWays);
            writeValue(flag, response);
        } catch (PaymentException e) {
            e.printStackTrace();
        }
    }

}
