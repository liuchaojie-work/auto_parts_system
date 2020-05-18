package cn.autoparts.dao;

import cn.autoparts.bean.Logistics;

import java.sql.SQLException;
import java.util.List;

/**
 * 物流
 */
public interface ILogisticsDao {
    int findTotalCount(String condition) throws SQLException;

    List<Logistics> findByPage(int start, int pageSize, String condition) throws SQLException;

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Logistics> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Logistics> findAllByCondition(String condition) throws SQLException;

    /**
     * 根据物流名查找
     * @param name
     * @return
     * @throws SQLException
     */
    Logistics findByName(String name) throws SQLException;

    /**
     * 增加物流
     * @param logistics
     * @return
     * @throws SQLException
     */
    boolean add(Logistics logistics) throws SQLException;

    /**
     * 修改物流
     * @param logistics
     * @return
     * @throws SQLException
     */
    boolean change(Logistics logistics) throws SQLException;

    /**
     * 根据物流名删除
     * @param name
     * @return
     * @throws SQLException
     */
    boolean deleteByName(String name) throws SQLException;

    /**
     * 根据物流名拼接字符串批量删除
     * @param names
     * @return
     * @throws SQLException
     */
    boolean deleteByNames(String names) throws SQLException;
}
