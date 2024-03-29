package cn.autoparts.dao;

import cn.autoparts.bean.CategoryBrand;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryBrandDao {
    int findTotalCount(String condition) throws SQLException;

    List<CategoryBrand> findByPage(int start, int pageSize, String condition) throws SQLException;

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    List<CategoryBrand> findAll() throws SQLException;

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws SQLException
     */
    List<CategoryBrand> findByCondition(String condition) throws SQLException;

    /**
     * 根据两个名查询
     * @param cname
     * @param bname
     * @return
     * @throws SQLException
     */
    CategoryBrand findByTwoName(String cname, String bname) throws SQLException;

    /**
     * 根据类别名查询
     * @param cname
     * @return
     * @throws SQLException
     */
    List<CategoryBrand> findByCname(String cname) throws SQLException;

    /**
     * 根据品牌名查询
     * @param bname
     * @return
     * @throws SQLException
     */
    List<CategoryBrand> findByBname(String bname) throws SQLException;

    /**
     * 根据id查询
     * @param cbId
     * @return
     * @throws SQLException
     */
    CategoryBrand findByCbId(String cbId) throws SQLException;

    /**
     * 添加
     * @param categoryBrand
     * @return
     * @throws SQLException
     */
    boolean add(CategoryBrand categoryBrand) throws SQLException;

    /**
     * 修改品牌
     * @param categoryBrand
     * @return
     * @throws SQLException
     */
    boolean change(CategoryBrand categoryBrand) throws SQLException;

    /**
     * 根据cbId删除
     * @param cbId
     * @return
     * @throws SQLException
     */
    boolean deleteByCbId(String cbId) throws SQLException;

    /**
     * 根据多个cbId名拼接的字符串删除
     * @param cbIds
     * @return
     * @throws SQLException
     */
    boolean deleteByCbIds(String cbIds) throws SQLException;
}
