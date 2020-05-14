package cn.autoparts.dao;

import cn.autoparts.bean.ClientPrice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 部分客户价格表
 */
public interface IClientPriceDao {

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<Map<String, Object>> findAll() throws SQLException;

    /**
     * 根据客户id和产品id查找
     * @param userId
     * @param proId
     * @return
     * @throws SQLException
     */
    Map<String, Object> findByUserIdAndProId(String userId, String proId) throws SQLException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws SQLException
     */
    List<Map<String, Object>> findByCondition(String condition) throws SQLException;

    /**
     * 根据价格编号查找
     * @param cpNo
     * @return
     * @throws SQLException
     */
    Map<String, Object> findByCpNo(String cpNo) throws SQLException;
    /**
     * 添加
     * @param clientPrice
     * @return
     * @throws SQLException
     */
    boolean add(ClientPrice clientPrice) throws SQLException;

    /**
     * 修改
     * @param clientPrice
     * @return
     * @throws SQLException
     */
    boolean change(ClientPrice clientPrice) throws SQLException;

    /**
     *根据编号删除
     * @param cpNo
     * @return
     * @throws SQLException
     */
    boolean deleteByCpNo(String cpNo) throws SQLException;

    /**
     * 根据编号批量删除
     * @param cpNos
     * @return
     * @throws SQLException
     */
    boolean deleteByCpNos(String cpNos) throws SQLException;
}
