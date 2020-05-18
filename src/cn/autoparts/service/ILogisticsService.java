package cn.autoparts.service;

import cn.autoparts.bean.Logistics;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.LogisticsException;

import java.util.List;

public interface ILogisticsService {
    /**
     * 分页查询
     * @param currentPage
     * @param pageSize
     * @param condition
     * @return
     * @throws LogisticsException
     */
    public PageBean<Logistics> pageQuery(int currentPage, int pageSize, String condition) throws LogisticsException;

    /**
     * 查找所有
     * @return
     * @throws LogisticsException
     */
    List<Logistics> findAll() throws LogisticsException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws LogisticsException
     */
    List<Logistics> findAllByCondition(String condition) throws LogisticsException;

    /**
     * 根据物流名查找
     * @param name
     * @return
     * @throws LogisticsException
     */
    Logistics findByName(String name) throws LogisticsException;

    /**
     * 增加物流
     * @param logistics
     * @return
     * @throws LogisticsException
     */
    boolean add(Logistics logistics) throws LogisticsException;

    /**
     * 修改物流
     * @param logistics
     * @return
     * @throws LogisticsException
     */
    boolean change(Logistics logistics) throws LogisticsException;

    /**
     * 根据物流名删除
     * @param name
     * @return
     * @throws LogisticsException
     */
    boolean deleteByName(String name) throws LogisticsException;

    /**
     * 根据物流名拼接字符串批量删除
     * @param names
     * @return
     * @throws LogisticsException
     */
    boolean deleteByNames(String names) throws LogisticsException;
}
