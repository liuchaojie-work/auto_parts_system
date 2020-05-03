package cn.autoparts.service;

import cn.autoparts.bean.Inventory;
import cn.autoparts.exception.InventoryException;

import java.util.List;

/**
 * 库存
 */
public interface IInventoryService {
    /**
     * 查找所有
     * @return
     * @throws InventoryException
     */
    List<Inventory> findAll() throws InventoryException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws InventoryException
     */
    List<Inventory> findAllByCondition(String condition) throws InventoryException;

    /**
     * 根据产品id查找
     * @param proId
     * @return
     * @throws InventoryException
     */
    Inventory findByProId(String proId) throws InventoryException;

    /**
     * 增加
     * @param inventory
     * @return
     * @throws InventoryException
     */
    boolean add(Inventory inventory) throws InventoryException;

    /**
     * 修改
     * @param inventory
     * @return
     * @throws InventoryException
     */
    boolean change(Inventory inventory) throws InventoryException;

    /**
     * 根据产品id删除
     * @param proId
     * @return
     * @throws InventoryException
     */
    boolean deleteByProId(String proId) throws InventoryException;

    /**
     * 根据产品id批量删除
     * @param proIds
     * @return
     * @throws InventoryException
     */
    boolean deleteByProIds(String proIds) throws InventoryException;
}
