package cn.autoparts.service.impl;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.dao.ICategoryBrandDao;
import cn.autoparts.dao.impl.CategoryBrandDaoImpl;
import cn.autoparts.exception.CategoryBrandException;
import cn.autoparts.service.ICategoryBrandService;

import java.sql.SQLException;
import java.util.List;

public class CategoryBrandServiceImpl implements ICategoryBrandService {
    ICategoryBrandDao categoryBrandDao = new CategoryBrandDaoImpl();
    @Override
    public List<CategoryBrand> findAll() throws CategoryBrandException {
        try {
            return categoryBrandDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public List<CategoryBrand> findByCondition(String condition) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public CategoryBrand findByTwoName(String cname, String bname) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByTwoName(cname, bname);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public CategoryBrand findByCbId(String cbId) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByCbId(cbId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean add(CategoryBrand categoryBrand) throws CategoryBrandException {
        try {
            return categoryBrandDao.add(categoryBrand);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean change(CategoryBrand categoryBrand) throws CategoryBrandException {
        try {
            return categoryBrandDao.change(categoryBrand);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean deleteByCbId(String cbId) throws CategoryBrandException {
        try {
            return categoryBrandDao.deleteByCbId(cbId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean deleteByCbIds(String cbIds) throws CategoryBrandException {
        try {
            return categoryBrandDao.deleteByCbIds(cbIds);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }
}
