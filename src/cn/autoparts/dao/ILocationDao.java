package cn.autoparts.dao;

import cn.autoparts.bean.Location;

import java.sql.SQLException;
import java.util.List;

/**
 * 库位
 */
public interface ILocationDao {
    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Location> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Location> findAllByCondition(String condition) throws SQLException;

    /**
     * 根据库位编号查询
     * @param no
     * @return
     * @throws SQLException
     */
    Location findByNo(String no) throws SQLException;

    /**
     * 根据库位位置查询
     * @param loca
     * @return
     * @throws SQLException
     */
    Location findByLoca(String loca) throws SQLException;

    /**
     * 增加库位
     * @param location
     * @return
     * @throws SQLException
     */
    boolean add(Location location) throws SQLException;

    /**
     * 修改库位信息
     * @param location
     * @return
     * @throws SQLException
     */
    boolean change(Location location) throws SQLException;

    /**
     * 删除库位
     * @param no
     * @return
     * @throws SQLException
     */
    boolean deleteByNo(String no) throws SQLException;

    /**
     * 删除多个库位
     * @param nos
     * @return
     * @throws SQLException
     */
    boolean deleteByNos(String nos) throws SQLException;

}
