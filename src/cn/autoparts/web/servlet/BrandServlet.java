package cn.autoparts.web.servlet;

import cn.autoparts.bean.Brand;
import cn.autoparts.exception.BrandException;
import cn.autoparts.service.IBrandService;
import cn.autoparts.service.impl.BrandServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;


/**
 * 有关品牌的Servlet
 */
@WebServlet("/brand/*")
public class BrandServlet extends BaseServlet {
    private IBrandService brandService = new BrandServiceImpl();

    /**
     * 查找所有
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            List<Brand> brands = brandService.findAll();
            writeValue(brands,response);
        } catch (BrandException e) {
            e.printStackTrace();
        }
    }


    /**
     * 根据某条件查询
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String condition = request.getParameter("condition");
        try {
            List<Brand> brands = brandService.findByCondition(condition);
            writeValue(brands,response);
        } catch (BrandException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据品牌名查找
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        try {
            Brand byName = brandService.findByName(name);
            writeValue(byName,response);
        } catch (BrandException e) {
            e.printStackTrace();
        }
    }

    /**
     * 新增
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        Map<String, String[]> params = request.getParameterMap();
        Brand brand = new Brand();
        try {
            BeanUtils.populate(brand, params);
            boolean flag = brandService.add(brand);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (BrandException e) {
            e.printStackTrace();
        }

    }

    /**
     * 保存修改
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        Map<String, String[]> params = request.getParameterMap();
        Brand brand = new Brand();
        try {
            BeanUtils.populate(brand, params);
            boolean flag = brandService.change(brand);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (BrandException e) {
            e.printStackTrace();
        }

    }

    /**
     * 根据品牌名删除品牌
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        try {
            boolean flag = brandService.deleteByName(name);
            writeValue(flag, response);
        } catch (BrandException e) {
            e.printStackTrace();
        }

    }

    /**
     * 根据品牌名拼接的字符串批量删除品牌
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteByNames(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String names = request.getParameter("names");
        try {
            boolean flag = brandService.deleteByNames(names);
            writeValue(flag, response);
        } catch (BrandException e) {
            e.printStackTrace();
        }
    }
}
