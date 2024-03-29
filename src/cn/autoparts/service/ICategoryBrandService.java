package cn.autoparts.service;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.PageBean;
import cn.autoparts.exception.CategoryBrandException;

import java.util.List;

public interface ICategoryBrandService {
    /**
     * 分页查询
     * @param currentPage
     * @param pageSize
     * @param condition
     * @return
     * @throws CategoryBrandException
     */
    public PageBean<CategoryBrand> pageQuery(int currentPage, int pageSize, String condition) throws CategoryBrandException;

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
     * 根据类别名查询
     * @param cname
     * @return
     * @throws CategoryBrandException
     */
    List<CategoryBrand> findByCname(String cname) throws CategoryBrandException;

    /**
     * 根据品牌名查询
     * @param bname
     * @return
     * @throws CategoryBrandException
     */
    List<CategoryBrand> findByBname(String bname) throws CategoryBrandException;
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
