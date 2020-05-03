package cn.autoparts.service.impl;

import cn.autoparts.bean.Product;
import cn.autoparts.dao.IProductDao;
import cn.autoparts.dao.impl.ProductDaoImpl;
import cn.autoparts.exception.ProductException;
import cn.autoparts.service.IProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements IProductService {
    private IProductDao productDao = new ProductDaoImpl();
    @Override
    public List<Object[]> findAll() throws ProductException {
        try {
            return productDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("查找失败！");
        }
    }

    @Override
    public List<Object[]> findAllByCondition(String condition) throws ProductException {
        try {
            return productDao.findAllByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("根据条件查找失败！");
        }
    }

    @Override
    public Object[] findByProId(String proId) throws ProductException {
        try {
            return productDao.findByProId(proId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("根据产品id查找失败！");
        }
    }

    @Override
    public Object[] findByTypenoAndCbId(String typeno, String cbId) throws ProductException {
        try {
            return productDao.findByTypenoAndCbId(typeno, cbId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("根据型号和关联id查找失败！");
        }
    }

    @Override
    public boolean add(Product product) throws ProductException {
        try {
            return productDao.add(product);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("添加失败！");
        }
    }

    @Override
    public boolean change(Product product) throws ProductException {
        try {
            return productDao.change(product);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("修改失败！");
        }
    }

    @Override
    public boolean deleteByProId(String proId) throws ProductException {
        try {
            return productDao.deleteByProId(proId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("根据产品id删除失败！");
        }
    }

    @Override
    public boolean deleteByProIds(String proIds) throws ProductException {
        try {
            return productDao.deleteByProIds(proIds);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ProductException("根据产品id批量删除失败！");
        }
    }
}
