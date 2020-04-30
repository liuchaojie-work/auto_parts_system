package cn.autoparts.service.impl;

import cn.autoparts.bean.Brand;
import cn.autoparts.dao.IBrandDao;
import cn.autoparts.dao.impl.BrandDaoImpl;
import cn.autoparts.exception.BrandException;
import cn.autoparts.service.IBrandService;

import java.sql.SQLException;
import java.util.List;

public class BrandServiceImpl implements IBrandService {
    private IBrandDao brandDao = new BrandDaoImpl();
    /**
     * 查找所有
     * @return
     * @throws BrandException
     */
    @Override
    public List<Brand> findAll() throws BrandException {
        try {
            return brandDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service查找所有品牌失败！");
        }
    }

    /**
     * 根据任意条件查询
     * @param condition
     * @return
     * @throws BrandException
     */
    @Override
    public List<Brand> findByCondition(String condition) throws BrandException {
        try {
            return brandDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service根据任意条件查找所有品牌失败！");
        }
    }

    /**
     * 根据品牌名查找
     * @param name
     * @return
     * @throws BrandException
     */
    @Override
    public Brand findByName(String name) throws BrandException {
        try {
            return brandDao.findByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service根据品牌名查找所有品牌失败！");
        }
    }

    /**
     * 新增
     * @param brand
     * @return
     * @throws BrandException
     */
    @Override
    public boolean add(Brand brand) throws BrandException {
        try {
            return brandDao.add(brand);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service新增品牌失败！");
        }
    }

    /**
     * 修改
     * @param brand
     * @return
     * @throws BrandException
     */
    @Override
    public boolean change(Brand brand) throws BrandException {
        try {
            return brandDao.change(brand);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service修改品牌失败！");
        }
    }

    /**
     * 根据品牌名删除
     * @param name
     * @return
     * @throws BrandException
     */
    @Override
    public boolean deleteByName(String name) throws BrandException {
        try {
            return brandDao.deleteByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service根据品牌名删除品牌失败！");
        }
    }

    /**
     * 根据多个品牌名拼接成的字符串删除多个品牌
     * @param names
     * @return
     * @throws BrandException
     */
    @Override
    public boolean deleteByNames(String names) throws BrandException {
        try {
            return brandDao.deleteByNames(names);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BrandException("Service根据多个品牌名拼接成的字符串删除多个品牌失败！");
        }
    }
}
