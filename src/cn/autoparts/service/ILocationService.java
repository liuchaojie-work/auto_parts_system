package cn.autoparts.service;

import cn.autoparts.bean.Location;
import cn.autoparts.exception.LocationException;

import java.util.List;

/**
 * 库位
 */
public interface ILocationService {
    /**
     * 查找所有
     * @return
     * @throws LocationException
     */
    List<Location> findAll() throws LocationException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws LocationException
     */
    List<Location> findAllByCondition(String condition) throws LocationException;

    /**
     * 根据库位编号查询
     * @param no
     * @return
     * @throws LocationException
     */
    Location findByNo(String no) throws LocationException;


    /**
     * 根据库位位置查询
     * @param loca
     * @return
     * @throws LocationException
     */
    Location findByLoca(String loca) throws LocationException;

    /**
     * 增加库位
     * @param location
     * @return
     * @throws LocationException
     */
    boolean add(Location location) throws LocationException;

    /**
     * 修改库位信息
     * @param location
     * @return
     * @throws LocationException
     */
    boolean change(Location location) throws LocationException;

    /**
     * 删除库位
     * @param no
     * @return
     * @throws LocationException
     */
    boolean deleteByNo(String no) throws LocationException;

    /**
     * 删除多个库位
     * @param nos
     * @return
     * @throws LocationException
     */
    boolean deleteByNos(String nos) throws LocationException;
}
