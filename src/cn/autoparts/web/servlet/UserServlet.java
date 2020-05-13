package cn.autoparts.web.servlet;

import cn.autoparts.bean.User;
import cn.autoparts.exception.UserException;
import cn.autoparts.service.IUserService;
import cn.autoparts.service.impl.UserServiceImpl;
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

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {
    private IUserService userService = new UserServiceImpl();
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
