package cn.autoparts.service.impl;

import cn.autoparts.bean.Location;
import cn.autoparts.bean.PageBean;
import cn.autoparts.dao.ILocationDao;
import cn.autoparts.dao.impl.LocationDaoImpl;
import cn.autoparts.exception.LocationException;
import cn.autoparts.service.ILocationService;

import java.sql.SQLException;
import java.util.List;

public class LocationServiceImpl implements ILocationService {
    private ILocationDao locationDao = new LocationDaoImpl();

    @Override
    public PageBean<Location> pageQuery(int currentPage, int pageSize, String condition) throws LocationException {
        PageBean<Location> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = locationDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<Location> list = locationDao.findByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("分页查询失败！");
        }
    }

    @Override
    public List<Location> findAll() throws LocationException {
        try {
            return locationDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("查找失败！");
        }
    }

    @Override
    public List<Location> findAllByCondition(String condition) throws LocationException {
        try {
            return locationDao.findAllByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("根据条件查找失败！");
        }
    }

    @Override
    public Location findByNo(String no) throws LocationException {
        try {
            return locationDao.findByNo(no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("根据库位编号查找失败！");
        }
    }

    @Override
    public Location findByLoca(String loca) throws LocationException {
        try {
            return locationDao.findByLoca(loca);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("根据库位位置查找失败！");
        }
    }

    @Override
    public boolean add(Location location) throws LocationException {
        try {
            return locationDao.add(location);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("新增失败！");
        }
    }

    @Override
    public boolean change(Location location) throws LocationException {
        try {
            return locationDao.change(location);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("修改失败！");
        }
    }

    @Override
    public boolean deleteByNo(String no) throws LocationException {
        try {
            return locationDao.deleteByNo(no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("根据库位编号删除失败！");
        }
    }

    @Override
    public boolean deleteByNos(String nos) throws LocationException {
        try {
            return locationDao.deleteByNos(nos);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LocationException("根据库位编号删除多个失败！");
        }
    }
}
