package cn.autoparts.service.impl;

import cn.autoparts.bean.ClientPrice;
import cn.autoparts.bean.PageBean;
import cn.autoparts.dao.IClientPriceDao;
import cn.autoparts.dao.impl.ClientPriceDaoImpl;
import cn.autoparts.exception.ClientPriceException;
import cn.autoparts.service.IClientPriceService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ClientPriceServiceImpl implements IClientPriceService {
    private IClientPriceDao clientPriceDao = new ClientPriceDaoImpl();

    @Override
    public PageBean<Map<String, Object>> pageQuery(int currentPage, int pageSize, String condition) throws ClientPriceException {
        PageBean<Map<String, Object>> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = clientPriceDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<Map<String, Object>> list = clientPriceDao.findByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("分页查询失败！");
        }
    }

    @Override
    public List<Map<String, Object>> findAll() throws ClientPriceException {
        try {
            return clientPriceDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("查找所有失败!");
        }
    }

    @Override
    public Map<String, Object> findByUserIdAndProId(String userId, String proId) throws ClientPriceException {
        try {
            return clientPriceDao.findByUserIdAndProId(userId, proId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("根据用户和产品id查找失败!");
        }
    }

    @Override
    public List<Map<String, Object>> findByCondition(String condition) throws ClientPriceException {
        try {
            return clientPriceDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("根据条件查找失败!");
        }
    }

    @Override
    public Map<String, Object> findByCpNo(String cpNo) throws ClientPriceException {
        try {
            return clientPriceDao.findByCpNo(cpNo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("根据价格编号查找失败!");
        }
    }

    @Override
    public boolean add(ClientPrice clientPrice) throws ClientPriceException {
        try {
            return clientPriceDao.add(clientPrice);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("添加失败!");
        }
    }

    @Override
    public boolean change(ClientPrice clientPrice) throws ClientPriceException {
        try {
            return clientPriceDao.change(clientPrice);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("修改失败!");
        }
    }

    @Override
    public boolean deleteByCpNo(String cpNo) throws ClientPriceException {
        try {
            return clientPriceDao.deleteByCpNo(cpNo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("根据价格编号删除失败!");
        }
    }

    @Override
    public boolean deleteByCpNos(String cpNos) throws ClientPriceException {
        try {
            return clientPriceDao.deleteByCpNos(cpNos);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ClientPriceException("根据价格编号批量删除失败!");
        }
    }
}
