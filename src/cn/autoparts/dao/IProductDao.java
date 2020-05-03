package cn.autoparts.dao;

import cn.autoparts.bean.Product;

import java.sql.SQLException;
import java.util.List;

/**
 * 产品
 */
public interface IProductDao {
    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Object[]> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Object[]> findAllByCondition(String condition) throws SQLException;

    /**
     * 根据产品id查找
     * @param proId
     * @return
     * @throws SQLException
     */
    Object[] findByProId(String proId) throws SQLException;

    /**
     * 根据型号和关联id查找
     * @param typeno
     * @param cbId
     * @return
     * @throws SQLException
     */
    Object[] findByTypenoAndCbId(String typeno, String cbId) throws SQLException;

    /**
     * 增加
     * @param product
     * @return
     * @throws SQLException
     */
    boolean add(Product product) throws SQLException;

    /**
     * 修改
     * @param product
     * @return
     * @throws SQLException
     */
    boolean change(Product product) throws SQLException;

    /**
     * 根据产品id删除
     * @param proId
     * @return
     * @throws SQLException
     */
    boolean deleteByProId(String proId) throws SQLException;

    /**
     * 根据产品id批量删除
     * @param proIds
     * @return
     * @throws SQLException
     */
    boolean deleteByProIds(String proIds) throws SQLException;
}
