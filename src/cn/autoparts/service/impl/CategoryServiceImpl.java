package cn.autoparts.service.impl;

import cn.autoparts.bean.Category;
import cn.autoparts.dao.ICategoryDao;
import cn.autoparts.dao.impl.CategoryDaoImpl;
import cn.autoparts.exception.CategoryException;
import cn.autoparts.service.ICategoryService;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    private ICategoryDao categoryDao = new CategoryDaoImpl();

    /**
     * 查找所有类别
     * @return
     * @throws CategoryException
     */
    @Override
    public List<Category> findAll() throws CategoryException {
        try {
            return categoryDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service查找所有类别失败！");
        }
    }

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws CategoryException
     */
    @Override
    public List<Category> findByCondition(String condition) throws CategoryException {
        try {
            return categoryDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service根据某个条件查询类别失败！");
        }
    }

    /**
     * 根据某个类别名查询
     * @param name
     * @return
     * @throws CategoryException
     */
    @Override
    public Category findByName(String name) throws CategoryException {
        try {
            return categoryDao.findByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service根据某个类别名查询类别失败！");
        }
    }

    /**
     * 新增
     * @param category
     * @return
     * @throws CategoryException
     */
    @Override
    public boolean add(Category category) throws CategoryException {
        try {
            return categoryDao.add(category);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service新增类别名失败！");
        }
    }

    /**
     * 修改
     * @param category
     * @return
     * @throws CategoryException
     */
    @Override
    public boolean change(Category category) throws CategoryException {
        try {
            return categoryDao.change(category);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service修改失败！");
        }
    }

    /**
     * 删除单个
     * @param name
     * @return
     * @throws CategoryException
     */
    @Override
    public boolean deleteByName(String name) throws CategoryException {
        try {
            return categoryDao.deleteByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service删除单个失败！");
        }
    }

    /**
     * 批量删除
     * @param names
     * @return
     * @throws CategoryException
     */
    @Override
    public boolean deleteByNames(String names) throws CategoryException {
        try {
            return categoryDao.deleteByNames(names);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryException("Service批量删除失败！");
        }
    }
}
