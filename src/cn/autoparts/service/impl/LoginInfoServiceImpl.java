package cn.autoparts.service.impl;

import cn.autoparts.bean.LoginInfo;
import cn.autoparts.bean.PageBean;
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
    public PageBean<Map<String, Object>> pageQuery(int currentPage, int pageSize, String condition) throws LoginInfoException {
        PageBean<Map<String, Object>> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = loginInfoDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<Map<String, Object>> list = loginInfoDao.findByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginInfoException("分页查询失败！");
        }

    }

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
