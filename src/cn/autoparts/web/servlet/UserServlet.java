package cn.autoparts.web.servlet;

import cn.autoparts.bean.PageBean;
import cn.autoparts.bean.User;
import cn.autoparts.exception.UserException;
import cn.autoparts.service.IUserService;
import cn.autoparts.service.impl.UserServiceImpl;
import cn.autoparts.util.SendMailUtils;
import cn.autoparts.util.UUIDUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {
    private IUserService userService = new UserServiceImpl();

    public void pageQueryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            PageBean<User> userPageBean = userService.pageQueryAll(currentPage, pageSize, conditionStr);
            writeValue(userPageBean, response);
        } catch (UserException e) {
            e.printStackTrace();
        }

    }
    public void pageQueryAllAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            PageBean<User> userPageBean = userService.pageQueryAllAdmin(currentPage, pageSize, conditionStr);
            writeValue(userPageBean, response);
        } catch (UserException e) {
            e.printStackTrace();
        }

    }
    public void pageQueryAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            PageBean<User> userPageBean = userService.pageQueryAllCustomer(currentPage, pageSize, conditionStr);
            writeValue(userPageBean, response);
        } catch (UserException e) {
            e.printStackTrace();
        }

    }


    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            User byAccountAndPassword = userService.findByAccountAndPassword(account, password);
            session.setAttribute("user",byAccountAndPassword);
            writeValue(byAccountAndPassword, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getSession().invalidate();
    }

    public void checkCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String checkcode = request.getParameter("checkcode");
        HttpSession session = request.getSession();
        String checkcode_server = (String)session.getAttribute("CHECKCODE_SERVER");
        boolean flag = checkcode_server.equalsIgnoreCase(checkcode);
        writeValue(flag, response);
    }

    public void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String activeCode = request.getParameter("activeCode");
        try {
            boolean flag = userService.changeActiceStatus(activeCode);
            if(flag){
                request.getRequestDispatcher("/success.jsp").forward(request,response);
            }
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        session.setAttribute("email",email);
//        request.getRequestDispatcher("/reset-password.jsp").forward(request,response);
        response.sendRedirect(request.getContextPath()+"/reset-password.jsp");
    }

    public void sendResetPasswordEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String email = request.getParameter("email");
        String emailMsg = "请<a href='http://localhost:8080/auto_parts_system/user/resetPassword?email="+ email +"' target='_blank'>点击重置密码</a>";
        boolean flag = SendMailUtils.sendMail(email, emailMsg, "用户重置密码邮件");
        writeValue(flag, response);
    }

    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Map<String, String[]> params = request.getParameterMap();
        String userId = UUIDUtils.getID("u");
        String activeCode = UUIDUtils.getID("a");
        User user = new User();
        user.setUserId(userId);
        user.setActiveCode(activeCode);
        user.setIden(0);
        user.setActiveStatus("0");
        try {
            BeanUtils.populate(user,params);
            boolean flag = userService.add(user);
            if(flag){
                String emailMsg = "注册成功！ 请<a href='http://localhost:8080/auto_parts_system/user/active?activeCode="+ activeCode +"' target='_blank'>点击激活</a> 后登录";
                SendMailUtils.sendMail(user.getEmail(), emailMsg, "用户激活邮件");
            }
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String newPassword = request.getParameter("password");
        String account = request.getParameter("account");
        try {
            boolean flag = userService.changePassword(account, newPassword);
            writeValue(flag, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<User> users = userService.findAll();
            writeValue(users, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findAllAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<User> admins = userService.findAllAdmin();
            writeValue(admins, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }
    public void findAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<User> customers = userService.findAllCustomer();
            writeValue(customers, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findByUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("account");
        try {
            User byUsername = userService.findByUsername(username);
            writeValue(byUsername, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }
    public void findByPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("account");
        try {
            User byPhone = userService.findByPhone(phone);
            writeValue(byPhone, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findByEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("account");
        try {
            User byEmail = userService.findByEmail(email);
            writeValue(byEmail, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        try {
            User byUserId = userService.findByUserId(userId);
            System.out.println(byUserId.toString());
            writeValue(byUserId, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findByThreeCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        try {
            User byThreeCondition = userService.findByThreeCondition(account);
            writeValue(byThreeCondition, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }


    public void findCustomerByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<User> customerByCondition = userService.findCustomerByCondition(condition);
            writeValue(customerByCondition, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findAdminByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<User> adminByCondition = userService.findAdminByCondition(condition);
            writeValue(adminByCondition, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void findAllByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition = request.getParameter("condition");
        try {
            List<User> allByCondition = userService.findAllByCondition(condition);
            writeValue(allByCondition, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        String userId = UUIDUtils.getID("u");
        String activeCode = UUIDUtils.getID("a");
        User user = new User();
        user.setUserId(userId);
        user.setActiveCode(activeCode);
        try {
            BeanUtils.populate(user, params);
            boolean flag = userService.add(user);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user, params);
            boolean flag = userService.change(user);
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void changeByUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user, params);
            boolean flag = userService.changeByUsername(user);
            if(flag){
                String username = request.getParameter("username");
                User byUsername = userService.findByUsername(username);
                HttpSession session = request.getSession();
                session.setAttribute("user",byUsername);
            }
            writeValue(flag, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void deleteByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        try {
            boolean flag = userService.deleteByUserId(userId);
            writeValue(flag, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    public void deleteByUserIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIds = request.getParameter("userIds");
        try {
            boolean flag = userService.deleteByUserIds(userIds);
            writeValue(flag, response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }
}
