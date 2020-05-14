package cn.autoparts.web.servlet;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.Product;
import cn.autoparts.exception.CategoryBrandException;
import cn.autoparts.exception.ProductException;
import cn.autoparts.service.ICategoryBrandService;
import cn.autoparts.service.IProductService;
import cn.autoparts.service.impl.CategoryBrandServiceImpl;
import cn.autoparts.service.impl.ProductServiceImpl;
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

/**
 * 产品
 */
@WebServlet("/product/*")
public class ProductServlet extends BaseServlet {
    private IProductService productService = new ProductServiceImpl();

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Object[]> objects = productService.findAll();
            writeValue(objects, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }

    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Object[]> objects = productService.findAllByCondition(condition);
            writeValue(objects, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }
    public void findByProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        try {
            Object[] byProId = productService.findByProId(proId);
            writeValue(byProId, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }

    public void findByTypenoAndCbId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeno = request.getParameter("typeno");
        String cbId = request.getParameter("cbId");
        try {
            Object[] byTypenoAndCbId = productService.findByTypenoAndCbId(typeno, cbId);
            writeValue(byTypenoAndCbId, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }

    public void findByTypeno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String typeno = request.getParameter("typeno");
        try {
            List<Product> byTypeno = productService.findByTypeno(typeno);
            writeValue(byTypeno, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }

    public void findByTypenoAndCname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String typeno = request.getParameter("typeno");
        String cname = request.getParameter("cname");
        try {
            List<Object[]> byTypenoAndCname = productService.findByTypenoAndCname(typeno, cname);
            writeValue(byTypenoAndCname, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }


    ICategoryBrandService categoryBrandService = new CategoryBrandServiceImpl();

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = UUIDUtils.getID("pro");
        String cname = request.getParameter("cname");
        String bname = request.getParameter("bname");
        try {
            CategoryBrand byTwoName = categoryBrandService.findByTwoName(cname, bname);
            String cbId = byTwoName.getCbId();
            Map<String, String[]> params = request.getParameterMap();
            Product product = new Product();
            product.setCbId(cbId);
            product.setProId(proId);
            BeanUtils.populate(product, params);
            boolean flag = productService.add(product);
            writeValue(flag, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cname = request.getParameter("cname");
        String bname = request.getParameter("bname");
        try {
            CategoryBrand byTwoName = categoryBrandService.findByTwoName(cname, bname);
            String cbId = byTwoName.getCbId();
            Map<String, String[]> params = request.getParameterMap();
            Product product = new Product();
            product.setCbId(cbId);
            BeanUtils.populate(product, params);
            boolean flag = productService.change(product);
            writeValue(flag, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }


    public void deleteByProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        try {
            boolean flag = productService.deleteByProId(proId);
            writeValue(flag, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }


    public void deleteByProIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proIds = request.getParameter("proIds");
        try {
            boolean flag = productService.deleteByProIds(proIds);
            writeValue(flag, response);
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }
}
