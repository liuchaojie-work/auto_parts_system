package cn.autoparts.web.servlet;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.ClientPrice;
import cn.autoparts.bean.PageBean;
import cn.autoparts.bean.User;
import cn.autoparts.exception.*;
import cn.autoparts.service.ICategoryBrandService;
import cn.autoparts.service.IClientPriceService;
import cn.autoparts.service.IProductService;
import cn.autoparts.service.IUserService;
import cn.autoparts.service.impl.CategoryBrandServiceImpl;
import cn.autoparts.service.impl.ClientPriceServiceImpl;
import cn.autoparts.service.impl.ProductServiceImpl;
import cn.autoparts.service.impl.UserServiceImpl;
import cn.autoparts.util.UUIDUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/clientPrice/*")
public class ClientPriceServlet extends BaseServlet {
    private IClientPriceService clientPriceService = new ClientPriceServiceImpl();

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
            PageBean<Map<String, Object>> mapPageBean = clientPriceService.pageQuery(currentPage, pageSize, conditionStr);
            writeValue(mapPageBean, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Map<String, Object>> all = clientPriceService.findAll();
            writeValue(all, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    public void findByUserIdAndProId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String proId = request.getParameter("proId");
        try {
            Map<String, Object> byUserIdAndProId = clientPriceService.findByUserIdAndProId(userId, proId);
            writeValue(byUserIdAndProId, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    public void findByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Map<String, Object>> byCondition = clientPriceService.findByCondition(condition);
            writeValue(byCondition, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    public void findByCpNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpNo = request.getParameter("cpNo");
        try {
            Map<String, Object> byCpNo = clientPriceService.findByCpNo(cpNo);
            writeValue(byCpNo, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    private ICategoryBrandService categoryBrandService = new CategoryBrandServiceImpl();
    private IProductService productService = new ProductServiceImpl();
    private IUserService userService = new UserServiceImpl();
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpNo = UUIDUtils.getID("cpNo");
        String typeno = request.getParameter("typeno");
        String cname = request.getParameter("cname");
        String bname = request.getParameter("bname");
        String username = request.getParameter("username");
        try {
            User byUsername = userService.findByUsername(username);
            String userId = byUsername.getUserId();
            CategoryBrand byTwoName = categoryBrandService.findByTwoName(cname, bname);
            String cbId = byTwoName.getCbId();
            Object[] byTypenoAndCbId = productService.findByTypenoAndCbId(typeno, cbId);
            String proId = (String) byTypenoAndCbId[0];
            ClientPrice clientPrice = new ClientPrice();
            Map<String, String[]> params = request.getParameterMap();
            BeanUtils.populate(clientPrice, params);
            clientPrice.setCpNo(cpNo);
            clientPrice.setUserId(userId);
            clientPrice.setProId(proId);
            boolean flag = clientPriceService.add(clientPrice);
            writeValue(flag,response);
        } catch (CategoryBrandException e) {
            e.printStackTrace();
        } catch (ProductException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (UserException e) {
            e.printStackTrace();
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Timestamp time = new Timestamp(new Date().getTime());
        ClientPrice clientPrice = new ClientPrice();
        try {
            BeanUtils.populate(clientPrice, params);
            clientPrice.setTime(time);
            boolean flag = clientPriceService.change(clientPrice);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }

    }

    public void deleteByCpNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpNo = request.getParameter("cpNo");
        try {
            boolean flag = clientPriceService.deleteByCpNo(cpNo);
            writeValue(flag, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

    public void deleteByCpNos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpNos = request.getParameter("cpNos");
        try {
            boolean flag = clientPriceService.deleteByCpNos(cpNos);
            writeValue(flag, response);
        } catch (ClientPriceException e) {
            e.printStackTrace();
        }
    }

}
