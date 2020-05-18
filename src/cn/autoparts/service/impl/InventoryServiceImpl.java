package cn.autoparts.service.impl;

import cn.autoparts.bean.Inventory;
import cn.autoparts.bean.PageBean;
import cn.autoparts.dao.IInventoryDao;
import cn.autoparts.dao.impl.InventoryDaoImpl;
import cn.autoparts.exception.InventoryException;
import cn.autoparts.service.IInventoryService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 库存
 */
public class InventoryServiceImpl implements IInventoryService {
    private IInventoryDao inventoryDao = new InventoryDaoImpl();

    @Override
    public PageBean<Map<String, Object>> pageQuery(int currentPage, int pageSize, String condition) throws InventoryException {
        PageBean<Map<String, Object>> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = inventoryDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<Map<String, Object>> list = inventoryDao.findByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("分页查询失败！");
        }
    }

    @Override
    public List<Map<String, Object>> findAll() throws InventoryException {
        try {
            return inventoryDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("查找所有失败！");
        }
    }

    @Override
    public List<Map<String, Object>> findAllByCondition(String condition) throws InventoryException {
        try {
            return inventoryDao.findAllByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("根据条件查询失败！");
        }
    }

    @Override
    public Map<String, Object> findByProId(String proId) throws InventoryException {
        try {
            return inventoryDao.findByProId(proId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("根据产品id查找失败！");
        }
    }

    @Override
    public boolean add(Inventory inventory) throws InventoryException {
        try {
            return inventoryDao.add(inventory);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("增加失败！");
        }
    }

    @Override
    public boolean change(Inventory inventory) throws InventoryException {
        try {
            return inventoryDao.change(inventory);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("修改失败！");
        }
    }

    @Override
    public boolean deleteByProId(String proId) throws InventoryException {
        try {
            return inventoryDao.deleteByProId(proId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("根据产品id删除失败！");
        }
    }

    @Override
    public boolean deleteByProIds(String proIds) throws InventoryException {
        try {
            return inventoryDao.deleteByProIds(proIds);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new InventoryException("根据产品id批量删除失败！");
        }
    }
}
