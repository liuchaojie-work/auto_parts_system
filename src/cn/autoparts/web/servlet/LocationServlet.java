package cn.autoparts.web.servlet;

import cn.autoparts.bean.Location;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.LocationException;
import cn.autoparts.service.ILocationService;
import cn.autoparts.service.impl.LocationServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/location/*")
public class LocationServlet extends BaseServlet {
    private ILocationService locationService = new LocationServiceImpl();

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
            PageBean<Location> locationPageBean = locationService.pageQuery(currentPage, pageSize, conditionStr);
            writeValue(locationPageBean, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }

    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Location> locations = locationService.findAll();
            writeValue(locations, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }

    public void findByNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        try {
            Location byNo = locationService.findByNo(no);
            writeValue(byNo, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }

    public void findByLoca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loca = request.getParameter("loca");
        try {
            Location byNo = locationService.findByLoca(loca);
            writeValue(byNo, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }


    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Location> byCondition = locationService.findAllByCondition(condition);
            writeValue(byCondition, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Location location = new Location();
        try {
            BeanUtils.populate(location, params);
            boolean flag = locationService.add(location);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        Location location = new Location();
        try {
            BeanUtils.populate(location, params);
            boolean flag = locationService.change(location);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }

    public void deleteByNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        try {
            boolean flag = locationService.deleteByNo(no);
            writeValue(flag, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }
    public void deleteByNos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nos = request.getParameter("nos");
        try {
            boolean flag = locationService.deleteByNos(nos);
            writeValue(flag, response);
        } catch (LocationException e) {
            e.printStackTrace();
        }
    }
}
