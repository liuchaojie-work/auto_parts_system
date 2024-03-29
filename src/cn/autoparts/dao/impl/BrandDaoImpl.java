package cn.autoparts.dao.impl;

import cn.autoparts.bean.Brand;
import cn.autoparts.dao.IBrandDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class BrandDaoImpl implements IBrandDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(name) from tab_brand";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(name) from tab_brand where name like ? or factory like ? or place like ? or remark like ?";
            Object[] params = {"%"+condition+"%", "%"+condition+"%", "%"+condition+"%", "%"+condition+"%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<Brand> findByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_brand limit ?, ?";
            return runner.query(sql, new BeanListHandler<Brand>(Brand.class), start, pageSize);
        }else{
            String sql = "select * from tab_brand where name like ? or factory like ? or place like ? or remark like ? limit ?, ?";
            Object[] params = {"%"+condition+"%", "%"+condition+"%", "%"+condition+"%", "%"+condition+"%" , start, pageSize};
            return runner.query(sql, new BeanListHandler<Brand>(Brand.class), params);
        }
    }

    /**
     * 查询所有
     * @return
     * @throws SQLException
     */
    @Override
    public List<Brand> findAll() throws SQLException {
        String sql = "select * from tab_brand";
        return runner.query(sql, new BeanListHandler<Brand>(Brand.class));
    }

    /**
     * 根据某个条件查询
     * @param condition
     * @return
     * @throws SQLException
     */
    @Override
    public List<Brand> findByCondition(String condition) throws SQLException {
        String sql = "select * from tab_brand where name like ? or factory like ? or place like ? or remark like ?";
        Object[] params = {"%"+condition+"%", "%"+condition+"%", "%"+condition+"%", "%"+condition+"%"};
        return runner.query(sql, new BeanListHandler<Brand>(Brand.class),params);
    }

    /**
     * 根据品牌名查找
     * @param name
     * @return
     * @throws SQLException
     */
    @Override
    public Brand findByName(String name) throws SQLException {
        String sql = "select * from tab_brand where name = ?";
        return runner.query(sql, new BeanHandler<Brand>(Brand.class), name);
    }

    /**
     * 新增品牌
     * @param brand
     * @return
     * @throws SQLException
     */
    @Override
    public boolean add(Brand brand) throws SQLException {
        String sql = "insert into tab_brand(name, factory, place, remark) values(?,?,?,?)";
        Object[] params = {brand.getName(), brand.getFactory(), brand.getPlace(), brand.getRemark()};
        return 1 == runner.update(sql, params);
    }

    /**
     * 修改品牌
     * @param brand
     * @return
     * @throws SQLException
     */
    @Override
    public boolean change(Brand brand) throws SQLException {
        String sql = "update tab_brand set factory = ?, place = ?, remark = ? where name = ? ";
        Object[] params = {brand.getFactory(), brand.getPlace(), brand.getRemark(), brand.getName()};
        return 1 == runner.update(sql, params);
    }

    /**
     * 根据品牌名删除
     * @param name
     * @return
     * @throws SQLException
     */
    @Override
    public boolean deleteByName(String name) throws SQLException {
        String sql = "delete from tab_brand where name = ?";
        return 1 == runner.update(sql, name);
    }

    /**
     * 根据多个品牌名拼接而成的字符串删除
     * @param names
     * @return
     * @throws SQLException
     */
    @Override
    public boolean deleteByNames(String names) throws SQLException {
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_brand where name in (");
        Object[] params = names.split(",");
        int len = params.length;
        for(int i = 0; i < len; i++){
            if(i != len-1){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql,params);
    }
}
