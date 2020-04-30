package cn.autoparts.service;

import cn.autoparts.bean.Brand;
import cn.autoparts.exception.BrandException;

import java.util.List;

public interface IBrandService {
    /**
     * 查找所有
     * @return
     * @throws BrandException
     */
    List<Brand> findAll() throws BrandException;

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws BrandException
     */
    List<Brand> findByCondition(String condition) throws BrandException;
    /**
     * 根据品牌名查询品牌
     * @param name
     * @return
     * @throws BrandException
     */
    Brand findByName(String name) throws BrandException;
    /**
     * 添加品牌
     * @param brand
     * @return
     * @throws BrandException
     */
    boolean add(Brand brand) throws BrandException;

    /**
     * 修改品牌
     * @param brand
     * @return
     * @throws BrandException
     */
    boolean change(Brand brand) throws BrandException;

    /**
     * 根据品牌名删除
     * @param name
     * @return
     * @throws BrandException
     */
    boolean deleteByName(String name) throws BrandException;

    /**
     * 根据多个品牌名拼接的字符串删除品牌
     * @param names
     * @return
     * @throws BrandException
     */
    boolean deleteByNames(String names) throws BrandException;
}
