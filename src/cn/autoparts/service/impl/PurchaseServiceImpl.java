package cn.autoparts.service.impl;

import cn.autoparts.bean.Purchase;
import cn.autoparts.dao.IPurchaseDao;
import cn.autoparts.dao.impl.PurchaseDaoImpl;
import cn.autoparts.exception.PurchaseException;
import cn.autoparts.service.IPurchaseService;

import java.sql.SQLException;
import java.util.List;

public class PurchaseServiceImpl implements IPurchaseService {
    IPurchaseDao purchaseDao = new PurchaseDaoImpl();
    @Override
    public List<Object[]> findAll() throws PurchaseException {
        try {
            return purchaseDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("查找所有失败!");
        }
    }

    @Override
    public Object[] findByPrimarykey(String proId, Integer purchasePrice) throws PurchaseException {
        try {
            return purchaseDao.findByPrimarykey(proId, purchasePrice);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("根据产品id和进价查找失败!");
        }
    }



    @Override
    public List<Object[]> findByProId(String proId) throws PurchaseException {
        try {
            return purchaseDao.findByProId(proId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("根据产品id查找失败!");
        }
    }

    @Override
    public Object[] findByPurNo(String purNo) throws PurchaseException {
        try {
            return purchaseDao.findByPurNo(purNo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("根据进货编号查找失败!");
        }
    }

    @Override
    public List<Object[]> findByCondition(String condition) throws PurchaseException {
        try {
            return purchaseDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("根据条件查找失败!");
        }
    }

    @Override
    public boolean add(Purchase purchase) throws PurchaseException {
        try {
            return purchaseDao.add(purchase);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("添加失败!");
        }
    }

    @Override
    public boolean change(Purchase purchase) throws PurchaseException {
        try {
            return purchaseDao.change(purchase);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("修改失败!");
        }
    }

    @Override
    public boolean changeCount(Purchase purchase) throws PurchaseException {
        try {
            return purchaseDao.changeCount(purchase);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("入库时修改失败!");
        }
    }

    @Override
    public boolean deleteByPurNo(String purNo) throws PurchaseException {
        try {
            return purchaseDao.deleteByPurNo(purNo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("根据进货编号删除失败!");
        }
    }

    @Override
    public boolean deleteByPurNos(String purNos) throws PurchaseException {
        try {
            return purchaseDao.deleteByPurNos(purNos);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new PurchaseException("根据进货编号批量删除失败!");
        }
    }
}
