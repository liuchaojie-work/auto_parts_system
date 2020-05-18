package cn.autoparts.web.servlet;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.Inventory;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.CategoryBrandException;
import cn.autoparts.exception.InventoryException;
import cn.autoparts.exception.ProductException;
import cn.autoparts.service.ICategoryBrandService;
import cn.autoparts.service.IInventoryService;
import cn.autoparts.service.IProductService;
import cn.autoparts.service.impl.CategoryBrandServiceImpl;
import cn.autoparts.service.impl.InventoryServiceImpl;
import cn.autoparts.service.impl.ProductServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/inventory/*")
public class InventoryServlet extends BaseServlet {
    private IInventoryService inventoryService = new InventoryServiceImpl();

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
            inventoryService.pageQuery(currentPage, pageSize, conditionStr)
            writeValue(mapPageBean, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }

    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Map<String, Object>> all = inventoryService.findAll();
            writeValue(all, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Map<String, Object>> allByCondition = inventoryService.findAllByCondition(condition);
            writeValue(allByCondition, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void findByProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        try {
            Map<String, Object> byProId = inventoryService.findByProId(proId);
            writeValue(byProId, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    ICategoryBrandService categoryBrandService = new CategoryBrandServiceImpl();
    IProductService productService = new ProductServiceImpl();
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeno = request.getParameter("typeno");
        String cname = request.getParameter("cname");
        String bname = request.getParameter("bname");
        String remark = request.getParameter("remark");
        Integer count = Integer.valueOf(request.getParameter("count"));
        Inventory inventory = new Inventory();
        try {
            CategoryBrand byTwoName = categoryBrandService.findByTwoName(cname, bname);
            String cbId = byTwoName.getCbId();
            Object[] byTypenoAndCbId = productService.findByTypenoAndCbId(typeno, cbId);
            String proId = (String) byTypenoAndCbId[0];
            Map<String, Object> byProId = inventoryService.findByProId(proId);
            inventory.setProId(proId);
            inventory.setRemark(remark);
            if(null != byProId){
                count += (Integer) byProId.get("count");
                inventory.setCount(count);
                boolean flag = inventoryService.change(inventory);
                writeValue(flag, response);
                return;
            }
            inventory.setCount(count);
            boolean flag = inventoryService.add(inventory);
            writeValue(flag, response);
        }  catch (InventoryException e) {
            e.printStackTrace();
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        } catch (ProductException e) {
            e.printStackTrace();
        }
    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Inventory inventory = new Inventory();
        try {
            BeanUtils.populate(inventory, params);
            boolean flag = inventoryService.change(inventory);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void deleteByProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        try {
            boolean flag = inventoryService.deleteByProId(proId);
            writeValue(flag, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void deleteByProIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proIds = request.getParameter("proIds");
        try {
            boolean flag = inventoryService.deleteByProIds(proIds);
            writeValue(flag, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

}
