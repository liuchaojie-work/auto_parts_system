package cn.autoparts.web.servlet;

import cn.autoparts.bean.Logistics;
import cn.autoparts.exception.LogisticsException;
import cn.autoparts.service.ILogisticsService;
import cn.autoparts.service.impl.LogisticsServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/logistics/*")
public class LogisticsServlet extends BaseServlet {

    private ILogisticsService logisticsService = new LogisticsServiceImpl();

    /**
     * 查找所有
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Logistics> logistics = logisticsService.findAll();
            writeValue(logistics,response);
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }

    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Logistics> logistics = logisticsService.findAllByCondition(condition);
            writeValue(logistics,response);
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }
    public void findByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        try {
            Logistics byName = logisticsService.findByName(name);
            writeValue(byName, response);
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Map<String, String[]> params = request.getParameterMap();
        Logistics logistics = new Logistics();
        try {
            BeanUtils.populate(logistics, params);
            boolean flag = logisticsService.add(logistics);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Map<String, String[]> params = request.getParameterMap();
        Logistics logistics = new Logistics();
        try {
            BeanUtils.populate(logistics, params);
            boolean flag = logisticsService.change(logistics);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }

    public void deleteByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        try {
            boolean flag = logisticsService.deleteByName(name);
            writeValue(flag, response);
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }
    public void deleteByNames(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String names = request.getParameter("names");
        try {
            boolean flag = logisticsService.deleteByNames(names);
            writeValue(flag, response);
        } catch (LogisticsException e) {
            e.printStackTrace();
        }
    }

}
