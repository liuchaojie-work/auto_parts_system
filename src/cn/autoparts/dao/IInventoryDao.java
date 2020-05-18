package cn.autoparts.dao;

import cn.autoparts.bean.Inventory;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 库存表
 */
public interface IInventoryDao {
    int findTotalCount(String condition) throws SQLException;

    List<Map<String, Object>> findByPage(int start, int pageSize, String condition) throws SQLException;

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Map<String , Object>> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Map<String , Object>> findAllByCondition(String condition) throws SQLException;

    /**
     * 根据产品id查找
     * @param proId
     * @return
     * @throws SQLException
     */
    Map<String , Object> findByProId(String proId) throws SQLException;

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
