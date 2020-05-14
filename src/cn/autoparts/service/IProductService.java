package cn.autoparts.service;

import cn.autoparts.bean.Product;
import cn.autoparts.exception.ProductException;

import java.util.List;

/**
 * 产品
 */
public interface IProductService {
    /**
     * 查找所有
     * @return
     * @throws ProductException
     */
    List<Object[]> findAll() throws ProductException;

    /**
     * 根据条件查找
     * @param condition
     * @return
     * @throws ProductException
     */
    List<Object[]> findAllByCondition(String condition) throws ProductException;

    /**
     * 根据产品id查找
     * @param proId
     * @return
     * @throws ProductException
     */
    Object[] findByProId(String proId) throws ProductException;


    /**
     * 根据型号和关联id查找
     * @param typeno
     * @param cbId
     * @return
     * @throws ProductException
     */
    Object[] findByTypenoAndCbId(String typeno, String cbId) throws ProductException;

    /**
     * 根据型号查找
     * @param typeno
     * @return
     * @throws ProductException
     */
    List<Product> findByTypeno(String typeno) throws ProductException;

    /**
     * 根据型号和类别名查找
     * @param typeno
     * @param cname
     * @return
     * @throws ProductException
     */
    List<Object[]> findByTypenoAndCname(String typeno, String cname) throws ProductException;

    /**
     * 增加
     * @param product
     * @return
     * @throws ProductException
     */
    boolean add(Product product) throws ProductException;

    /**
     * 修改
     * @param product
     * @return
     * @throws ProductException
     */
    boolean change(Product product) throws ProductException;

    /**
     * 根据产品id删除
     * @param proId
     * @return
     * @throws ProductException
     */
    boolean deleteByProId(String proId) throws ProductException;

    /**
     * 根据产品id批量删除
     * @param proIds
     * @return
     * @throws ProductException
     */
    boolean deleteByProIds(String proIds) throws ProductException;
}
