package cn.autoparts.service.impl;

import cn.autoparts.bean.Logistics;
import cn.autoparts.dao.ILogisticsDao;
import cn.autoparts.dao.impl.LogisticsDaoImpl;
import cn.autoparts.exception.LogisticsException;
import cn.autoparts.service.ILogisticsService;

import java.sql.SQLException;
import java.util.List;

public class LogisticsServiceImpl implements ILogisticsService {
    private ILogisticsDao logisticsDao = new LogisticsDaoImpl();
    @Override
    public List<Logistics> findAll() throws LogisticsException {
        try {
            return logisticsDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("查找全部失败！");
        }
    }

    @Override
    public List<Logistics> findAllByCondition(String condition) throws LogisticsException {
        try {
            return logisticsDao.findAllByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("根据条件查找失败！");
        }
    }

    @Override
    public Logistics findByName(String name) throws LogisticsException {
        try {
            return logisticsDao.findByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("根据物流名查找失败！");
        }
    }

    @Override
    public boolean add(Logistics logistics) throws LogisticsException {
        try {
            return logisticsDao.add(logistics);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("添加物流失败！");
        }
    }

    @Override
    public boolean change(Logistics logistics) throws LogisticsException {
        try {
            return logisticsDao.change(logistics);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("修改物流失败！");
        }
    }

    @Override
    public boolean deleteByName(String name) throws LogisticsException {
        try {
            return logisticsDao.deleteByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("根据物流名删除失败！");
        }
    }

    @Override
    public boolean deleteByNames(String names) throws LogisticsException {
        try {
            return logisticsDao.deleteByNames(names);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LogisticsException("根据物流名删除失败！");
        }
    }
}
