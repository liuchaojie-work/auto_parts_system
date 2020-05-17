package cn.autoparts.service;

import cn.autoparts.bean.LoginInfo;
import cn.autoparts.exception.LoginInfoException;

import java.util.List;
import java.util.Map;

public interface ILoginInfoService {
    /**
     * 查找所有记录
     * @return
     * @throws LoginInfoException
     */
    List<Map<String, Object>> findAll() throws LoginInfoException;

    /**
     * 根据条件查找
     * @return
     * @throws LoginInfoException
     */
    List<Map<String, Object>> findByCondition(String condition) throws LoginInfoException;

    /**
     * 增加
     * @param loginInfo
     * @return
     * @throws LoginInfoException
     */
    boolean add(LoginInfo loginInfo) throws LoginInfoException;

    /**
     * 根据编号删除
     * @param no
     * @return
     * @throws LoginInfoException
     */
    boolean deleteByNo(String no) throws LoginInfoException;

    /**
     * 根据编号批量删除
     * @param nos
     * @return
     * @throws LoginInfoException
     */
    boolean deleteByNos(String nos) throws LoginInfoException;
}
