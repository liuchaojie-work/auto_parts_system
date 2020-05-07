package cn.autoparts.service;

import cn.autoparts.bean.Purchase;
import cn.autoparts.exception.PurchaseException;

import java.util.List;

public interface IPurchaseService {
    /**
     * 查找所有
     * @return
     * @throws PurchaseException
     */
    List<Object[]> findAll() throws PurchaseException;

    /**
     * 根据主键查询
     * @param proId
     * @param purchasePrice
     * @return
     * @throws PurchaseException
     */
    Object[] findByPrimarykey(String proId, Integer purchasePrice) throws PurchaseException;

    /**
     *根据产品id查询
     * @param proId
     * @return
     * @throws PurchaseException
     */
    List<Object[]> findByProId(String proId) throws PurchaseException;

    /**
     * 根据进货编号查找
     * @param purNo
     * @return
     * @throws PurchaseException
     */
    Object[] findByPurNo(String purNo) throws PurchaseException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws PurchaseException
     */
    List<Object[]> findByCondition(String condition) throws PurchaseException;

    /**
     * 入库
     * @param purchase
     * @return
     * @throws PurchaseException
     */
    boolean add(Purchase purchase) throws PurchaseException;

    /**
     * 修改库存
     * @param purchase
     * @return
     * @throws PurchaseException
     */
    boolean change(Purchase purchase) throws PurchaseException;

    /**
     * 根据进货编号删除
     * @param purNo
     * @return
     * @throws PurchaseException
     */
    boolean deleteByPurNo(String purNo) throws PurchaseException;
    /**
     * 根据进货编号批量删除
     * @param purNos
     * @return
     * @throws PurchaseException
     */
    boolean deleteByPurNos(String purNos) throws PurchaseException;
}
