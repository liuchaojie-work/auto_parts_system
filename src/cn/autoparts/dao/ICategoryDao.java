package cn.autoparts.dao;

import cn.autoparts.bean.Category;
import cn.autoparts.exception.CategoryException;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryDao {
    int findTotalCount(String condition) throws SQLException;

    List<Category> findByPage(int start, int pageSize, String condition) throws SQLException;

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Category> findAll() throws SQLException, CategoryException;

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Category> findByCondition(String condition) throws SQLException, CategoryException;
    /**
     * 根据品牌名查询品牌
     * @param name
     * @return
     * @throws SQLException
     */
    Category findByName(String name) throws SQLException, CategoryException;
    /**
     * 添加品牌
     * @param category
     * @return
     * @throws SQLException
     */
    boolean add(Category category) throws SQLException, CategoryException;

    /**
     * 修改类别
     * @param category
     * @return
     * @throws SQLException
     */
    boolean change(Category category) throws SQLException, CategoryException;

    /**
     * 根据类别名删除
     * @param name
     * @return
     * @throws SQLException
     */
    boolean deleteByName(String name) throws SQLException, CategoryException;

    /**
     * 根据多个类别名拼接的字符串删除品牌
     * @param names
     * @return
     * @throws SQLException
     */
    boolean deleteByNames(String names) throws SQLException, CategoryException;
}
