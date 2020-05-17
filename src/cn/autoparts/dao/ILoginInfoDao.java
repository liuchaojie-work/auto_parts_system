package cn.autoparts.dao;

import cn.autoparts.bean.LoginInfo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 登录记录
 */
public interface ILoginInfoDao {
    /**
     * 查找所有记录
     * @return
     * @throws SQLException
     */
    List<Map<String, Object>> findAll() throws SQLException;

    /**
     * 根据条件查找
     * @return
     * @throws SQLException
     */
    List<Map<String, Object>> findByCondition(String condition) throws SQLException;

    /**
     * 增加
     * @param loginInfo
     * @return
     * @throws SQLException
     */
    boolean add(LoginInfo loginInfo) throws SQLException;

    /**
     * 根据编号删除
     * @param no
     * @return
     * @throws SQLException
     */
    boolean deleteByNo(String no) throws SQLException;

    /**
     * 根据编号批量删除
     * @param nos
     * @return
     * @throws SQLException
     */
    boolean deleteByNos(String nos) throws SQLException;
}
