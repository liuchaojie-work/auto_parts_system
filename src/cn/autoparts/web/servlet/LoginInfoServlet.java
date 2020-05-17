package cn.autoparts.web.servlet;

import cn.autoparts.bean.LoginInfo;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.LoginInfoException;
import cn.autoparts.service.ILoginInfoService;
import cn.autoparts.service.impl.LoginInfoServiceImpl;
import cn.autoparts.util.UUIDUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/loginInfo/*")
public class LoginInfoServlet extends BaseServlet {
    private ILoginInfoService loginInfoService = new LoginInfoServiceImpl();

    /**
     * 分页查询
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
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
            PageBean<Map<String, Object>> mapPageBean = loginInfoService.pageQuery(currentPage, pageSize, conditionStr);
            writeValue(mapPageBean, response);
        } catch (LoginInfoException e) {
            e.printStackTrace();
        }

    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Map<String, Object>> all = loginInfoService.findAll();
            writeValue(all, response);
        } catch (LoginInfoException e) {
            e.printStackTrace();
        }
    }

    public void findByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<Map<String, Object>> byCondition = loginInfoService.findByCondition(condition);
            writeValue(byCondition, response);
        } catch (LoginInfoException e) {
            e.printStackTrace();
        }
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = UUIDUtils.getID("log");
        String userId = request.getParameter("userId");
        LoginInfo loginInfo = new LoginInfo();
        loginInfo.setNo(no);
        loginInfo.setUserId(userId);
        try {
            boolean flag = loginInfoService.add(loginInfo);
            writeValue(flag, response);
        } catch (LoginInfoException e) {
            e.printStackTrace();
        }
    }
    public void deleteByNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        try {
            boolean flag = loginInfoService.deleteByNo(no);
            writeValue(flag, response);
        } catch (LoginInfoException e) {
            e.printStackTrace();
        }
    }

    public void deleteByNos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nos = request.getParameter("nos");
        try {
            boolean flag = loginInfoService.deleteByNos(nos);
            writeValue(flag, response);
        } catch (LoginInfoException e) {
            e.printStackTrace();
        }
    }
}
