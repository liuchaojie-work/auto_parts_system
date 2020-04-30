package cn.autoparts.dao;

import cn.autoparts.bean.Brand;

import java.sql.SQLException;
import java.util.List;

public interface IBrandDao {

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Brand> findAll() throws SQLException;

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Brand> findByCondition(String condition) throws SQLException;
    /**
     * 根据品牌名查询品牌
     * @param name
     * @return
     * @throws SQLException
     */
    Brand findByName(String name) throws SQLException;
    /**
     * 添加品牌
     * @param brand
     * @return
     * @throws SQLException
     */
    boolean add(Brand brand) throws SQLException;

    /**
     * 修改品牌
     * @param brand
     * @return
     * @throws SQLException
     */
    boolean change(Brand brand) throws SQLException;

    /**
     * 根据品牌名删除
     * @param name
     * @return
     * @throws SQLException
     */
    boolean deleteByName(String name) throws SQLException;

    /**
     * 根据多个品牌名拼接的字符串删除品牌
     * @param names
     * @return
     * @throws SQLException
     */
    boolean deleteByNames(String names) throws SQLException;
}
