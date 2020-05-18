package cn.autoparts.web.servlet;

import cn.autoparts.bean.Category;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.CategoryException;
import cn.autoparts.service.ICategoryService;
import cn.autoparts.service.impl.CategoryServiceImpl;
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
 * 有关类别的Servlet
 */
@WebServlet("/category/*")
public class CategoryServlet extends BaseServlet {
    private ICategoryService categoryService = new CategoryServiceImpl();

    public void pageQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr = request.getParameter("currentPage");
        String pageSizeStr = request.getParameter("pageSize");
        String conditionStr = request.getParameter("condition");

        int currentPage = 0;//当前页码
        if(null != currentPageStr && 0 != currentPageStr.length()){
            currentPage = Integer.parseInt(currentPageStr);
        }else{
            currentPage = 1;
        }
        int pageSize = 0;//每页显示条数
        if(null != pageSizeStr && 0 != pageSizeStr.length()){
            pageSize = Integer.parseInt(pageSizeStr);
        }else {
            pageSize = 5;
        }

        try {
            PageBean<Category> categoryPageBean = categoryService.pageQuery(currentPage, pageSize, conditionStr);
            writeValue(categoryPageBean, response);
        } catch (CategoryException e) {
            e.printStackTrace();
        }

    }

    /**
     * 查找所有
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            List<Category> categorys = categoryService.findAll();
            writeValue(categorys,response);
        } catch (CategoryException e) {
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
            List<Category> categorys = categoryService.findByCondition(condition);
            writeValue(categorys,response);
        } catch (CategoryException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据类别名查找
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        try {
            Category byName = categoryService.findByName(name);
            writeValue(byName,response);
        } catch (CategoryException e) {
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
        Category category = new Category();
        try {
            BeanUtils.populate(category, params);
            boolean flag = categoryService.add(category);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (CategoryException e) {
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
        Category category = new Category();
        try {
            BeanUtils.populate(category, params);
            boolean flag = categoryService.change(category);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (CategoryException e) {
            e.printStackTrace();
        }

    }

    /**
     * 根据类别名删除类别
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        try {
            boolean flag = categoryService.deleteByName(name);
            writeValue(flag, response);
        } catch (CategoryException e) {
            e.printStackTrace();
        }

    }

    /**
     * 根据类别名拼接的字符串批量删除类别
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteByNames(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String names = request.getParameter("names");
        try {
            boolean flag = categoryService.deleteByNames(names);
            writeValue(flag, response);
        } catch (CategoryException e) {
            e.printStackTrace();
        }
    }
}
