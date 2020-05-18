package cn.autoparts.service.impl;

import cn.autoparts.bean.PageBean;
import cn.autoparts.bean.User;
import cn.autoparts.dao.IUserDao;
import cn.autoparts.dao.impl.UserDaoImpl;
import cn.autoparts.exception.UserException;
import cn.autoparts.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserDao userDao = new UserDaoImpl();

    @Override
    public PageBean<User> pageQueryAll(int currentPage, int pageSize, String condition) throws UserException {
        PageBean<User> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = userDao.findAllTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<User> list = userDao.findAllByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("分页查询失败！");
        }
    }

    @Override
    public PageBean<User> pageQueryAllAdmin(int currentPage, int pageSize, String condition) throws UserException {
        PageBean<User> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = userDao.findAllAdminTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<User> list = userDao.findAllAdminByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("分页查询失败！");
        }
    }

    @Override
    public PageBean<User> pageQueryAllCustomer(int currentPage, int pageSize, String condition) throws UserException {
        PageBean<User> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = userDao.findAllCustomerTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<User> list = userDao.findAllCustomerByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("分页查询失败！");
        }
    }

    @Override
    public List<User> findAll() throws UserException {
        try {
            return userDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("查找失败！");
        }
    }

    @Override
    public User findByAccountAndPassword(String account, String password) throws UserException {
        try {
            return userDao.findByAccountAndPassword(account, password);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("根据账号密码查找失败！");
        }
    }

    @Override
    public List<User> findAllAdmin() throws UserException {
        try {
            return userDao.findAllAdmin();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("查找所有管理员失败！");
        }
    }

    @Override
    public List<User> findAllCustomer() throws UserException {
        try {
            return userDao.findAllCustomer();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("查找所有顾客失败！");
        }
    }

    @Override
    public User findByUsername(String username) throws UserException {
        try {
            return userDao.findByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("通过用户名查找失败！");
        }
    }

    @Override
    public User findByPhone(String phone) throws UserException {
        try {
            return userDao.findByPhone(phone);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("通过电话查询失败！");
        }
    }

    @Override
    public User findByEmail(String email) throws UserException {
        try {
            return userDao.findByEmail(email);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("通过email查找失败！");
        }
    }

    @Override
    public User findByUserId(String userId) throws UserException {
        try {
            return userDao.findByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("通过userId查找失败！");
        }
    }

    @Override
    public User findByThreeCondition(String account) throws UserException {
        try {
            return userDao.findByThreeCondition(account);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("通过用户名，电话和email查找失败！");
        }
    }

    @Override
    public List<User> findCustomerByCondition(String condition) throws UserException {
        try {
            return userDao.findCustomerByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("条件查询客户失败！");
        }
    }

    @Override
    public List<User> findAdminByCondition(String condition) throws UserException {
        try {
            return userDao.findAdminByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("条件查询管理员失败！");
        }
    }

    @Override
    public List<User> findAllByCondition(String condition) throws UserException {
        try {
            return userDao.findAllByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("条件查询所有失败！");
        }
    }

    @Override
    public boolean add(User user) throws UserException {
        try {
            return userDao.add(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("增加失败！");
        }
    }

    @Override
    public boolean change(User user) throws UserException {
        try {
            return userDao.change(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("修改失败！");
        }
    }

    @Override
    public boolean changeByUsername(User user) throws UserException {
        try {
            return userDao.changeByUsername(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("根据用户名修改失败！");
        }
    }

    @Override
    public boolean changePassword(String account, String newPassword) throws UserException {
        try {
            return userDao.changePassword(account, newPassword);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("修改密码失败！");
        }
    }

    @Override
    public boolean changeActiceStatus(String activeCode) throws UserException {
        try {
            return userDao.changeActiceStatus(activeCode);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("修改激活状态失败！");
        }
    }

    @Override
    public boolean deleteByUserId(String userId) throws UserException {
        try {
            return userDao.deleteByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("根据用户id删除！");
        }
    }

    @Override
    public boolean deleteByUserIds(String userIds) throws UserException {
        try {
            return userDao.deleteByUserIds(userIds);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("根据用户id批量删除！");
        }
    }
}
