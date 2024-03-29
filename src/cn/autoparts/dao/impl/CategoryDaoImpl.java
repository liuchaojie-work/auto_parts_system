package cn.autoparts.dao.impl;

import cn.autoparts.bean.Category;
import cn.autoparts.dao.ICategoryDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class CategoryDaoImpl implements ICategoryDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(name) from tab_category";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(name) from tab_category where name like ? or unit like ? or remark like ?";
            Object[] params = {"%"+ condition +"%","%"+ condition +"%","%"+ condition +"%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<Category> findByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_category limit ?, ?";
            return runner.query(sql, new BeanListHandler<Category>(Category.class), start, pageSize);
        }else{
            String sql = "select * from tab_category where name like ? or unit like ? or remark like ? limit ?, ?";
            Object[] params = {"%"+ condition +"%","%"+ condition +"%","%"+ condition +"%", start, pageSize};
            return runner.query(sql, new BeanListHandler<Category>(Category.class), params);
        }
    }

    /**
     * 查找所有
     * @return
     * @throws SQLException
     */
    @Override
    public List<Category> findAll() throws SQLException {
        String sql = "select * from tab_category";
        return runner.query(sql, new BeanListHandler<Category>(Category.class));
    }

    /**
     * 根据条件查询
     * @param condition
     * @return
     * @throws SQLException
     */
    @Override
    public List<Category> findByCondition(String condition) throws SQLException {
        String sql = "select * from tab_category where name like ? or unit like ? or remark like ?";
        Object[] params = {"%"+ condition +"%","%"+ condition +"%","%"+ condition +"%"};
        return runner.query(sql, new BeanListHandler<Category>(Category.class), params);
    }

    /**
     * 根据类别名查询
     * @param name
     * @return
     * @throws SQLException
     */
    @Override
    public Category findByName(String name) throws SQLException {
        String sql = "select * from tab_category where name = ?";
        return runner.query(sql, new BeanHandler<Category>(Category.class), name);
    }

    /**
     * 添加
     * @param category
     * @return
     * @throws SQLException
     */
    @Override
    public boolean add(Category category) throws SQLException {
        String sql = "insert into tab_category(name, unit, remark) values(?,?,?)";
        Object[] params = {category.getName(), category.getUnit(), category.getRemark()};
        return 1 == runner.update(sql, params);
    }

    /**
     * 修改
     * @param category
     * @return
     * @throws SQLException
     */
    @Override
    public boolean change(Category category) throws SQLException {
        String sql = "update tab_category set unit = ?, remark = ? where name = ?";
        Object[] params = {category.getUnit(), category.getRemark(), category.getName()};
        return 1 == runner.update(sql, params);
    }

    /**
     * 根据类别名删除
     * @param name
     * @return
     * @throws SQLException
     */
    @Override
    public boolean deleteByName(String name) throws SQLException {
        String sql = "delete from tab_category where name = ?";
        return 1 == runner.update(sql,name);
    }

    /**
     * 根据类别名批量删除
     * @param names
     * @return
     * @throws SQLException
     */
    @Override
    public boolean deleteByNames(String names) throws SQLException {
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_category where name in (");
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
