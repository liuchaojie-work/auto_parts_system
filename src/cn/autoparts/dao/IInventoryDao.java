package cn.autoparts.dao;

import cn.autoparts.bean.Inventory;

import java.sql.SQLException;
import java.util.List;

/**
 * 库存表
 */
public interface IInventoryDao {
    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Inventory> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Inventory> findAllByCondition(String condition) throws SQLException;

    /**
     * 根据产品id查找
     * @param proId
     * @return
     * @throws SQLException
     */
    Inventory findByProId(String proId) throws SQLException;

    /**
     * 增加
     * @param inventory
     * @return
     * @throws SQLException
     */
    boolean add(Inventory inventory) throws SQLException;

    /**
     * 修改
     * @param inventory
     * @return
     * @throws SQLException
     */
    boolean change(Inventory inventory) throws SQLException;

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
