package cn.autoparts.dao.impl;

import cn.autoparts.bean.User;
import cn.autoparts.dao.IUserDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements IUserDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findAllTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(userId) from tab_user";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(userId) from tab_user where userId like ? or " +
                    " username like ? or phone like ? or email like ? or" +
                    " name like ? or iden like ? or remark like ?";
            Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                    "%" + condition + "%","%" + condition + "%","%" + condition + "%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public int findAllAdminTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(userId) from tab_user where iden = 1 or iden = 999";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(userId) from tab_user where (iden = 1 or iden = 999) and (userId like ? or " +
                    " username like ? or phone like ? or email like ? or regTime like binary ? or img like ? or " +
                    " name like ? or gender like ? or remark like ?)";
            Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                    "%" + condition + "%","%" + condition + "%","%" + condition + "%","%" + condition + "%" ,"%" + condition + "%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public int findAllCustomerTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(userId) from tab_user where iden = 0";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(userId) from tab_user where iden = 0 and (" +
                    " phone like ? or name like ? or gender like ? or address like ? or receiverAdd like ? or logName like ? or remark like ?)";
            Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                    "%" + condition + "%","%" + condition + "%","%" + condition + "%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<User> findAllByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_user limit ?, ?";
            return runner.query(sql, new BeanListHandler<User>(User.class), start, pageSize);
        }else{
            String sql = "select * from tab_user where userId like ? or " +
                    " username like ? or phone like ? or email like ? or" +
                    " name like ? or iden like ? or remark like ? limit ?, ?";
            Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                    "%" + condition + "%","%" + condition + "%","%" + condition + "%", start, pageSize};
            return runner.query(sql, new BeanListHandler<User>(User.class), params);
        }
    }

    @Override
    public List<User> findAllAdminByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_user where iden = 1 or iden = 999 limit ?, ?";
            return runner.query(sql, new BeanListHandler<User>(User.class), start, pageSize);
        }else{
            String sql = "select * from tab_user where (iden = 1 or iden = 999 )and (userId like ? or " +
                    " username like ? or phone like ? or email like ? or regTime like binary ? or img like ? or " +
                    " name like ? or gender like ? or remark like ?) limit ?, ?";
            Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                    "%" + condition + "%","%" + condition + "%","%" + condition + "%","%" + condition + "%" ,"%" + condition + "%", start, pageSize};
            return runner.query(sql, new BeanListHandler<User>(User.class), params);
        }
    }

    @Override
    public List<User> findAllCustomerByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_user where iden = 0 limit ?, ?";
            return runner.query(sql, new BeanListHandler<User>(User.class), start, pageSize);
        }else{
            String sql = "select * from tab_user where iden = 0 and (" +
                    " phone like ? or name like ? or gender like ? or address like ? or receiverAdd like ? or logName like ? or remark like ?) limit ?, ?";
            Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                    "%" + condition + "%","%" + condition + "%","%" + condition + "%", start, pageSize};
            return runner.query(sql, new BeanListHandler<User>(User.class), params);
        }
    }

    @Override
    public List<User> findAll() throws SQLException {
        String sql = "select * from tab_user";
        return runner.query(sql, new BeanListHandler<User>(User.class));
    }

    @Override
    public User findByAccountAndPassword(String account, String password) throws SQLException {
        String sql = "select * from tab_user where (username = ? or phone = ? or email = ?) and password = ?";
        Object[] params = {account, account, account, password};
        return runner.query(sql, new BeanHandler<User>(User.class), params);
    }

    /**
     * 标识符为1/999为管理员,0为普通用户
     * @return
     * @throws SQLException
     */
    @Override
    public List<User> findAllAdmin() throws SQLException {
        String sql = "select * from tab_user where iden = 1 or iden = 999";
        return runner.query(sql, new BeanListHandler<User>(User.class));
    }

    @Override
    public List<User> findAllCustomer() throws SQLException {
        String sql = "select * from tab_user where iden = 0";
        return runner.query(sql, new BeanListHandler<User>(User.class));
    }

    @Override
    public User findByUserId(String userId) throws SQLException {
        String sql = "select * from tab_user where userId = ?";
        return runner.query(sql, new BeanHandler<User>(User.class), userId);
    }

    @Override
    public User findByUsername(String username) throws SQLException {
        String sql = "select * from tab_user where username = ?";
        return runner.query(sql, new BeanHandler<User>(User.class), username);
    }

    @Override
    public User findByPhone(String phone) throws SQLException {
        String sql = "select * from tab_user where phone = ?";
        return runner.query(sql, new BeanHandler<User>(User.class), phone);
    }

    @Override
    public User findByEmail(String email) throws SQLException {
        String sql = "select * from tab_user where email = ?";
        return runner.query(sql, new BeanHandler<User>(User.class), email);
    }

    @Override
    public User findByThreeCondition(String account) throws SQLException {
        String sql = "select * from tab_user where username = ? or phone = ? or email = ?";
        return runner.query(sql, new BeanHandler<User>(User.class) , account, account, account);
    }

    @Override
    public List<User> findCustomerByCondition(String condition) throws SQLException {
        String sql = "select * from tab_user where iden = 0 and (" +
                " phone like ? or name like ? or gender like ? or address like ? or receiverAdd like ? or logName like ? or remark like ?)";
        Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                "%" + condition + "%","%" + condition + "%","%" + condition + "%"};
        return runner.query(sql, new BeanListHandler<User>(User.class), params);
    }

    @Override
    public List<User> findAdminByCondition(String condition) throws SQLException {
        String sql = "select * from tab_user where (iden = 1 or iden = 999 )and (userId like ? or " +
                " username like ? or phone like ? or email like ? or regTime like ? or img like ? or " +
                " name like ? or gender like ? or remark like ?)";
        Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                "%" + condition + "%","%" + condition + "%","%" + condition + "%","%" + condition + "%" ,"%" + condition + "%"};
        return runner.query(sql, new BeanListHandler<User>(User.class), params);
    }

    @Override
    public List<User> findAllByCondition(String condition) throws SQLException {
        String sql = "select * from tab_user where userId like ? or " +
                " username like ? or phone like ? or email like ? or" +
                " name like ? or iden like ? or remark like ?";
        Object[] params = {"%" + condition + "%", "%" + condition + "%", "%" + condition + "%", "%" + condition + "%",
                "%" + condition + "%","%" + condition + "%","%" + condition + "%"};
        return runner.query(sql, new BeanListHandler<User>(User.class), params);
    }

    @Override
    public boolean add(User user) throws SQLException {
        String sql = "insert into tab_user(userId, username, phone, email, activeCode, activeStatus," +
                "password, regTime, img, name, gender, iden, address, receiverAdd, logName, remark)" +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {user.getUserId(), user.getUsername(), user.getPhone(), user.getEmail(),
                           user.getActiveCode(), user.getActiveStatus(), user.getPassword(), user.getRegTime(),
                           user.getImg(), user.getName(), user.getGender(), user.getIden(),
                           user.getAddress(), user.getReceiverAdd(), user.getLogName(), user.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(User user) throws SQLException {
        String sql = "update tab_user set username = ?, phone = ?, email = ?, activeStatus = ?, " +
                " img = ?, regTime = ?, name = ?, gender = ?,  address = ?, " +
                "receiverAdd = ?, logName = ?, remark = ? where userId = ?";
        Object[] params = {user.getUsername(), user.getPhone(), user.getEmail(),
                user.getActiveStatus(),user.getImg(),user.getRegTime(),
                user.getName(), user.getGender(), user.getAddress(),
                user.getReceiverAdd(), user.getLogName(), user.getRemark(), user.getUserId()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean changeByUsername(User user) throws SQLException {
        String sql = "update tab_user set regTime = ?, img = ?, name = ?, gender = ?,  address = ?, " +
                " receiverAdd = ?, logName = ?, remark = ? where username = ?";
        Object[] params = {user.getRegTime(), user.getImg(), user.getName(), user.getGender(), user.getAddress(),
                 user.getReceiverAdd(), user.getLogName(), user.getRemark(), user.getUsername()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean changePassword(String account, String newPassword) throws SQLException {
        String sql = "update tab_user set password = ? where username = ? or phone = ? or email = ?";
        Object[] params = {newPassword, account, account, account};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean changeActiceStatus(String activeCode) throws SQLException {
        String sql = "update tab_user set activeStatus = 1 where activeCode = ?";
        return 1 == runner.update(sql, activeCode);
    }

    @Override
    public boolean deleteByUserId(String userId) throws SQLException {
        String sql = "delete from tab_user where userId = ?";
        return 1 == runner.update(sql, userId);
    }

    @Override
    public boolean deleteByUserIds(String userIds) throws SQLException {
        Object[] params = userIds.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_user where userId in (");
        for (int i = 0; i < len; i++){
            if(i != len - 1){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql, params);
    }
}
