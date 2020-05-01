package cn.autoparts.service;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.exception.CategoryBrandException;

import java.util.List;

public interface ICategoryBrandService {
    /**
     * 查找所有
     * @return
     * @throws CategoryBrandException
     */
    List<CategoryBrand> findAll() throws CategoryBrandException;

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws CategoryBrandException
     */
    List<CategoryBrand> findByCondition(String condition) throws CategoryBrandException;

    /**
     * 根据两个名查询
     * @param cname
     * @param bname
     * @return
     * @throws CategoryBrandException
     */
    CategoryBrand findByTwoName(String cname, String bname) throws CategoryBrandException;

    /**
     * 根据id查询
     * @param cbId
     * @return
     * @throws CategoryBrandException
     */
    CategoryBrand findByCbId(String cbId) throws CategoryBrandException;

    /**
     * 添加
     * @param categoryBrand
     * @return
     * @throws CategoryBrandException
     */
    boolean add(CategoryBrand categoryBrand) throws CategoryBrandException;

    /**
     * 修改品牌
     * @param categoryBrand
     * @return
     * @throws CategoryBrandException
     */
    boolean change(CategoryBrand categoryBrand) throws CategoryBrandException;

    /**
     * 根据cbId删除
     * @param cbId
     * @return
     * @throws CategoryBrandException
     */
    boolean deleteByCbId(String cbId) throws CategoryBrandException;

    /**
     * 根据多个cbId名拼接的字符串删除
     * @param cbIds
     * @return
     * @throws CategoryBrandException
     */
    boolean deleteByCbIds(String cbIds) throws CategoryBrandException;
}
