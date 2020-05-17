package cn.autoparts.service.impl;

import cn.autoparts.bean.LoginInfo;
import cn.autoparts.dao.ILoginInfoDao;
import cn.autoparts.dao.impl.LoginInfoDaoImpl;
import cn.autoparts.exception.LoginInfoException;
import cn.autoparts.service.ILoginInfoService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class LoginInfoServiceImpl implements ILoginInfoService {
    private ILoginInfoDao loginInfoDao = new LoginInfoDaoImpl();
    @Override
    public List<Map<String, Object>> findAll() throws LoginInfoException {
        try {
            return loginInfoDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginInfoException("查找所有失败！");
        }
    }

    @Override
    public List<Map<String, Object>> findByCondition(String condition) throws LoginInfoException {
        try {
            return loginInfoDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginInfoException("根据条件查找所有失败！");
        }
    }

    @Override
    public boolean add(LoginInfo loginInfo) throws LoginInfoException {
        try {
            return loginInfoDao.add(loginInfo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginInfoException("添加失败！");
        }
    }

    @Override
    public boolean deleteByNo(String no) throws LoginInfoException {
        try {
            return loginInfoDao.deleteByNo(no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginInfoException("根据记录编号删除失败！");
        }
    }

    @Override
    public boolean deleteByNos(String nos) throws LoginInfoException {
        try {
            return loginInfoDao.deleteByNos(nos);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginInfoException("根据记录编号批量删除失败！");
        }
    }
}
