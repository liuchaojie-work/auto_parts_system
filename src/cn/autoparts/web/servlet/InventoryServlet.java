package cn.autoparts.web.servlet;

import cn.autoparts.bean.Inventory;
import cn.autoparts.exception.InventoryException;
import cn.autoparts.service.IInventoryService;
import cn.autoparts.service.impl.InventoryServiceImpl;
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
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Inventory> inventories = inventoryService.findAll();
            writeValue(inventories, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Inventory> byCondition = inventoryService.findAllByCondition(condition);
            writeValue(byCondition, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void findByProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proId = request.getParameter("proId");
        try {
            Inventory byProId = inventoryService.findByProId(proId);
            writeValue(byProId, response);
        } catch (InventoryException e) {
            e.printStackTrace();
        }
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Inventory inventory = new Inventory();
        try {
            BeanUtils.populate(inventory, params);
            boolean flag = inventoryService.add(inventory);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (InventoryException e) {
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
