package cn.autoparts.service;

import cn.autoparts.bean.ClientPrice;
import cn.autoparts.exception.ClientPriceException;

import java.util.List;
import java.util.Map;

public interface IClientPriceService {
    /**
     * 查找所有
     * @return
     * @throws ClientPriceException
     */
    List<Map<String, Object>> findAll() throws ClientPriceException;

    /**
     * 根据客户id和产品id查找
     * @param userId
     * @param proId
     * @return
     * @throws ClientPriceException
     */
    Map<String, Object> findByUserIdAndProId(String userId, String proId) throws ClientPriceException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws ClientPriceException
     */
    List<Map<String, Object>> findByCondition(String condition) throws ClientPriceException;

    /**
     * 根据价格编号查找
     * @param cpNo
     * @return
     * @throws ClientPriceException
     */
    Map<String, Object> findByCpNo(String cpNo) throws ClientPriceException;

    /**
     * 添加
     * @param clientPrice
     * @return
     * @throws ClientPriceException
     */
    boolean add(ClientPrice clientPrice) throws ClientPriceException;

    /**
     * 修改
     * @param clientPrice
     * @return
     * @throws ClientPriceException
     */
    boolean change(ClientPrice clientPrice) throws ClientPriceException;

    /**
     *根据编号删除
     * @param cpNo
     * @return
     * @throws ClientPriceException
     */
    boolean deleteByCpNo(String cpNo) throws ClientPriceException;

    /**
     * 根据编号批量删除
     * @param cpNos
     * @return
     * @throws ClientPriceException
     */
    boolean deleteByCpNos(String cpNos) throws ClientPriceException;
}
