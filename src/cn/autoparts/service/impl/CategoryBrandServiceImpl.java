package cn.autoparts.service.impl;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.bean.PageBean;
import cn.autoparts.dao.ICategoryBrandDao;
import cn.autoparts.dao.impl.CategoryBrandDaoImpl;
import cn.autoparts.exception.CategoryBrandException;
import cn.autoparts.service.ICategoryBrandService;

import java.sql.SQLException;
import java.util.List;

public class CategoryBrandServiceImpl implements ICategoryBrandService {
    ICategoryBrandDao categoryBrandDao = new CategoryBrandDaoImpl();

    @Override
    public PageBean<CategoryBrand> pageQuery(int currentPage, int pageSize, String condition) throws CategoryBrandException {
        PageBean<CategoryBrand> pb = new PageBean<>();
        //当前页码
        pb.setCurrentPage(currentPage);
        //每页显示条数
        pb.setPageSize(pageSize);
        try {
            //总记录数
            int totalCount = categoryBrandDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //开始的记录数
            int start = (currentPage - 1) * pageSize;
            List<CategoryBrand> list = categoryBrandDao.findByPage(start, pageSize, condition);
            pb.setList(list);
            //总页数 = 总记录数/每页显示条数
            int totalPage = 0 == totalCount % pageSize ? totalCount / pageSize : (totalCount / pageSize + 1);
            pb.setTotalPage(totalPage);
            return pb;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("分页查询失败！");
        }
    }

    @Override
    public List<CategoryBrand> findAll() throws CategoryBrandException {
        try {
            return categoryBrandDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public List<CategoryBrand> findByCondition(String condition) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByCondition(condition);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public CategoryBrand findByTwoName(String cname, String bname) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByTwoName(cname, bname);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public List<CategoryBrand> findByCname(String cname) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByCname(cname);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("根据类别名查找所有失败！");
        }
    }

    @Override
    public List<CategoryBrand> findByBname(String bname) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByBname(bname);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("根据品牌名查找所有失败！");
        }
    }

    @Override
    public CategoryBrand findByCbId(String cbId) throws CategoryBrandException {
        try {
            return categoryBrandDao.findByCbId(cbId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean add(CategoryBrand categoryBrand) throws CategoryBrandException {
        try {
            return categoryBrandDao.add(categoryBrand);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean change(CategoryBrand categoryBrand) throws CategoryBrandException {
        try {
            return categoryBrandDao.change(categoryBrand);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean deleteByCbId(String cbId) throws CategoryBrandException {
        try {
            return categoryBrandDao.deleteByCbId(cbId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }

    @Override
    public boolean deleteByCbIds(String cbIds) throws CategoryBrandException {
        try {
            return categoryBrandDao.deleteByCbIds(cbIds);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new CategoryBrandException("查找所有失败！");
        }
    }
}
