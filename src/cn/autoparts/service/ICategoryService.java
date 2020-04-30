package cn.autoparts.service;

import cn.autoparts.bean.Category;
import cn.autoparts.exception.CategoryException;

import java.util.List;

public interface ICategoryService {
    /**
     * 查找所有
     * @return
     * @throws CategoryException
     */
    List<Category> findAll() throws CategoryException;

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws CategoryException
     */
    List<Category> findByCondition(String condition) throws CategoryException;
    /**
     * 根据品牌名查询品牌
     * @param name
     * @return
     * @throws CategoryException
     */
    Category findByName(String name) throws CategoryException;
    /**
     * 添加品牌
     * @param category
     * @return
     * @throws CategoryException
     */
    boolean add(Category category) throws CategoryException;

    /**
     * 修改类别
     * @param category
     * @return
     * @throws CategoryException
     */
    boolean change(Category category) throws CategoryException;

    /**
     * 根据类别名删除
     * @param name
     * @return
     * @throws CategoryException
     */
    boolean deleteByName(String name) throws CategoryException;

    /**
     * 根据多个类别名拼接的字符串删除品牌
     * @param names
     * @return
     * @throws CategoryException
     */
    boolean deleteByNames(String names) throws CategoryException;
}
