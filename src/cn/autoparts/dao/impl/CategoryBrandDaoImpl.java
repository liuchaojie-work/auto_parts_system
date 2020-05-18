package cn.autoparts.dao.impl;

import cn.autoparts.bean.CategoryBrand;
import cn.autoparts.dao.ICategoryBrandDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class CategoryBrandDaoImpl implements ICategoryBrandDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(cbId) from tab_cate_bra";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(cbId) from tab_cate_bra where cbId like ? or cname like ? or bname like ? or remark like ?";
            Object[] params = {"%"+condition+"%", "%"+condition+"%", "%"+condition+"%", "%"+condition+"%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<CategoryBrand> findByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_cate_bra limit ?, ?";
            return runner.query(sql, new BeanListHandler<CategoryBrand>(CategoryBrand.class), start, pageSize);
        }else{
            String sql = "select * from tab_cate_bra where cbId like ? or cname like ? or bname like ? or remark like ? limit ?, ?";
            Object[] params = {"%"+condition+"%", "%"+condition+"%", "%"+condition+"%", "%"+condition+"%", start, pageSize};
            return runner.query(sql, new BeanListHandler<CategoryBrand>(CategoryBrand.class), params);
        }
    }

    @Override
    public List<CategoryBrand> findAll() throws SQLException {
        String sql = "select * from tab_cate_bra";
        return runner.query(sql, new BeanListHandler<CategoryBrand>(CategoryBrand.class));
    }

    @Override
    public List<CategoryBrand> findByCondition(String condition) throws SQLException {
        String sql = "select * from tab_cate_bra where cbId like ? or cname like ? or bname like ? or remark like ?";
        Object[] params = {"%"+condition+"%", "%"+condition+"%", "%"+condition+"%", "%"+condition+"%"};
        return runner.query(sql, new BeanListHandler<CategoryBrand>(CategoryBrand.class), params);
    }

    @Override
    public CategoryBrand findByTwoName(String cname, String bname) throws SQLException {
        String sql = "select * from tab_cate_bra where cname = ? and bname = ?";
        return runner.query(sql, new BeanHandler<CategoryBrand>(CategoryBrand.class),cname, bname);
    }

    @Override
    public List<CategoryBrand> findByCname(String cname) throws SQLException {
        String sql = "select * from tab_cate_bra where cname = ?";
        return runner.query(sql, new BeanListHandler<CategoryBrand>(CategoryBrand.class),cname);
    }

    @Override
    public List<CategoryBrand> findByBname(String bname) throws SQLException {
        String sql = "select * from tab_cate_bra where bname = ?";
        return runner.query(sql, new BeanListHandler<CategoryBrand>(CategoryBrand.class),bname);
    }

    @Override
    public CategoryBrand findByCbId(String cbId) throws SQLException {
        String sql = "select * from tab_cate_bra where cbId = ?";
        return runner.query(sql, new BeanHandler<CategoryBrand>(CategoryBrand.class), cbId);
    }

    @Override
    public boolean add(CategoryBrand categoryBrand) throws SQLException {
        String sql = "insert into tab_cate_bra(cbId, cname, bname, remark) values(?,?,?,?)";
        Object[] params = {categoryBrand.getCbId(), categoryBrand.getCname(), categoryBrand.getBname(), categoryBrand.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(CategoryBrand categoryBrand) throws SQLException {
        String sql = "update tab_cate_bra set cname = ?, bname = ?, remark = ? where cbId = ?";
        Object[] params = {categoryBrand.getCname(), categoryBrand.getBname(), categoryBrand.getRemark(), categoryBrand.getCbId()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByCbId(String cbId) throws SQLException {
        String sql = "delete from tab_cate_bra where cbId = ?";
        return 1 == runner.update(sql, cbId);
    }

    @Override
    public boolean deleteByCbIds(String cbIds) throws SQLException {
        Object[] params = cbIds.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_cate_bra where cbId in (");
        for(int i = 0; i < len; i++){
            if(i != len - 1){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql, params);
    }
}
