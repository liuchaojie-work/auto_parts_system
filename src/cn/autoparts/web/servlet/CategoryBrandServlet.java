package cn.autoparts.web.servlet;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.CategoryBrandException;
import cn.autoparts.service.ICategoryBrandService;
import cn.autoparts.service.impl.CategoryBrandServiceImpl;
import cn.autoparts.util.UUIDUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;


@WebServlet("/categoryBrand/*")
public class CategoryBrandServlet extends BaseServlet{
    private ICategoryBrandService categoryBrandService = new CategoryBrandServiceImpl();

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
            PageBean<CategoryBrand> categoryBrandPageBean = categoryBrandService.pageQuery(currentPage, pageSize, conditionStr);
            writeValue(categoryBrandPageBean, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }

    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<CategoryBrand> categoryBrands = categoryBrandService.findAll();
            writeValue(categoryBrands,response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

    public void findByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String condition = request.getParameter("condition");
        try {
            List<CategoryBrand> byCondition = categoryBrandService.findByCondition(condition);
            writeValue(byCondition, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

    public void findByCname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cname = request.getParameter("cname");
        try {
            List<CategoryBrand> byCname = categoryBrandService.findByCname(cname);
            writeValue(byCname, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

    public void findByBname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String bname = request.getParameter("bname");
        try {
            List<CategoryBrand> byBname = categoryBrandService.findByBname(bname);
            writeValue(byBname, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

    public void findByTwoName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cname = request.getParameter("cname");
        String bname = request.getParameter("bname");
        try {
            CategoryBrand byTwoName = categoryBrandService.findByTwoName(cname, bname);
            writeValue(byTwoName, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

    public void findByCbId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cbId = request.getParameter("cbId");
        try {
            CategoryBrand byCbId = categoryBrandService.findByCbId(cbId);
            writeValue(byCbId, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        CategoryBrand categoryBrand = new CategoryBrand();
        categoryBrand.setCbId(UUIDUtils.getID("cb"));
        Map<String, String[]> params = request.getParameterMap();
        try {
            BeanUtils.populate(categoryBrand, params);
            boolean flag = categoryBrandService.add(categoryBrand);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }
    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        CategoryBrand categoryBrand = new CategoryBrand();
        Map<String, String[]> params = request.getParameterMap();
        try {
            BeanUtils.populate(categoryBrand, params);
            boolean flag = categoryBrandService.change(categoryBrand);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

    public void deleteByCbId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cbId = request.getParameter("cbId");
        try {
            boolean flag = categoryBrandService.deleteByCbId(cbId);
            writeValue(flag, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }
    public void deleteByCbIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cbIds = request.getParameter("cbIds");
        try {
            boolean flag = categoryBrandService.deleteByCbIds(cbIds);
            writeValue(flag, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        }
    }

}
