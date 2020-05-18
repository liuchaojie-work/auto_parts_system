package cn.autoparts.dao;

import cn.autoparts.bean.Purchase;

import java.sql.SQLException;
import java.util.List;

/**
 * 进货
 */
public interface IPurchaseDao {
    int findTotalCount(String condition) throws SQLException;

    List<Object[]> findByPage(int start, int pageSize, String condition) throws SQLException;

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Object[]> findAll() throws SQLException;

    /**
     * 根据主键查询
     * @param proId
     * @param purchasePrice
     * @return
     * @throws SQLException
     */
    Object[] findByPrimarykey(String proId, Integer purchasePrice) throws SQLException;

    /**
     *根据产品id查询
     * @param proId
     * @return
     * @throws SQLException
     */
    List<Object[]> findByProId(String proId) throws SQLException;

    /**
     * 根据进货编号查找
     * @param purNo
     * @return
     * @throws SQLException
     */
    Object[] findByPurNo(String purNo) throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Object[]> findByCondition(String condition) throws SQLException;

    /**
     * 入库
     * @param purchase
     * @return
     * @throws SQLException
     */
    boolean add(Purchase purchase) throws SQLException;

    /**
     * 修改库存信息
     * @param purchase
     * @return
     * @throws SQLException
     */
    boolean change(Purchase purchase) throws SQLException;

    /**
     * 入库时若该进货编号存在，则修改产品库存数量
     * @param purchase
     * @return
     * @throws SQLException
     */
    boolean changeCount(Purchase purchase) throws SQLException;

    /**
     * 根据进货编号删除
     * @param purNo
     * @return
     * @throws SQLException
     */
    boolean deleteByPurNo(String purNo) throws SQLException;
    /**
     * 根据进货编号批量删除
     * @param purNos
     * @return
     * @throws SQLException
     */
    boolean deleteByPurNos(String purNos) throws SQLException;
}