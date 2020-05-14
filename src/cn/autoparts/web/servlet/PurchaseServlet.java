package cn.autoparts.web.servlet;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.Location;
import cn.autoparts.bean.Purchase;
import cn.autoparts.exception.CategoryBrandException;
import cn.autoparts.exception.LocationException;
import cn.autoparts.exception.ProductException;
import cn.autoparts.exception.PurchaseException;
import cn.autoparts.service.ICategoryBrandService;
import cn.autoparts.service.ILocationService;
import cn.autoparts.service.IProductService;
import cn.autoparts.service.IPurchaseService;
import cn.autoparts.service.impl.CategoryBrandServiceImpl;
import cn.autoparts.service.impl.LocationServiceImpl;
import cn.autoparts.service.impl.ProductServiceImpl;
import cn.autoparts.service.impl.PurchaseServiceImpl;
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

@WebServlet("/purchase/*")
public class PurchaseServlet extends BaseServlet {
    private IPurchaseService purchaseService = new PurchaseServiceImpl();
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Object[]> all = purchaseService.findAll();
            writeValue(all, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }

    public void findByPrimarykey(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        Integer purchasePrice = Integer.valueOf(request.getParameter("purchasePrice"));
        try {
            Object[] byPrimarykey = purchaseService.findByPrimarykey(proId, purchasePrice);
            writeValue(byPrimarykey, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }

    public void findByProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        try {
            List<Object[]> byProId = purchaseService.findByProId(proId);
            writeValue(byProId, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }

    public void findByPurNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String purNo = request.getParameter("purNo");
        try {
            Object[] byPurNo = purchaseService.findByPurNo(purNo);
            writeValue(byPurNo, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }

    public void findByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Object[]> byCondition = purchaseService.findByCondition(condition);
            writeValue(byCondition, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }

    ICategoryBrandService categoryBrandService = new CategoryBrandServiceImpl();
    IProductService productService = new ProductServiceImpl();
    ILocationService locationService = new LocationServiceImpl();
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String purNo = UUIDUtils.getID("rk");
        String typeno = request.getParameter("typeno");
        String cname = request.getParameter("cname");
        String bname = request.getParameter("bname");
        String loca = request.getParameter("loca");
        Map<String, String[]> params = request.getParameterMap();
        Purchase purchase = new Purchase();
        try {
            CategoryBrand byTwoName = categoryBrandService.findByTwoName(cname, bname);
            String cbId = byTwoName.getCbId();
            Object[] byTypenoAndCbId = productService.findByTypenoAndCbId(typeno, cbId);
            String proId = (String) byTypenoAndCbId[0];
            Location byLoca = locationService.findByLoca(loca);
            String no = byLoca.getNo();
            BeanUtils.populate(purchase, params);
            purchase.setPurNo(purNo);
            purchase.setProId(proId);
            purchase.setLocNo(no);
            boolean flag = purchaseService.add(purchase);
            writeValue(flag, response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        } catch (ProductException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (PurchaseException e) {
            e.printStackTrace();
        } catch (LocationException e) {
            e.printStackTrace();
        }

    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loca = request.getParameter("loca");
        Map<String, String[]> params = request.getParameterMap();
        Purchase purchase = new Purchase();
        try {
            Location byLoca = locationService.findByLoca(loca);
            String locNo = byLoca.getNo();
            BeanUtils.populate(purchase, params);
            purchase.setLocNo(locNo);
            boolean flag = purchaseService.change(purchase);
            writeValue(flag, response);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        catch (PurchaseException e) {
            e.printStackTrace();
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }

    public void changeCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, PurchaseException {
        String proId = request.getParameter("proId");
        Integer purchasePrice = Integer.valueOf(request.getParameter("purchasePrice"));
        Object[] byPrimarykey = purchaseService.findByPrimarykey(proId, purchasePrice);
        if(null != byPrimarykey && 0 != byPrimarykey.length){
            Purchase purchase = new Purchase();
            Map<String, String[]> params = request.getParameterMap();
            try {
                BeanUtils.populate(purchase, params);
                boolean flag = purchaseService.changeCount(purchase);
                writeValue(flag, response);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteByPurNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String purNo = request.getParameter("purNo");
        try {
            boolean flag = purchaseService.deleteByPurNo(purNo);
            writeValue(flag, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }

    public void deleteByPurNos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String purNos = request.getParameter("purNos");
        try {
            boolean flag = purchaseService.deleteByPurNos(purNos);
            writeValue(flag, response);
        } catch (PurchaseException e) {
            e.printStackTrace();
        }
    }
}
