package cn.autoparts.dao.impl;

import cn.autoparts.bean.Logistics;
import cn.autoparts.dao.ILogisticsDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * 物流
 */
public class LogisticsDaoImpl implements ILogisticsDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    @Override
    public List<Logistics> findAll() throws SQLException {
        String sql = "select * from tab_logistics";
        return runner.query(sql, new BeanListHandler<Logistics>(Logistics.class));
    }

    @Override
    public List<Logistics> findAllByCondition(String condition) throws SQLException {
        String sql = "select * from tab_logistics where name like ? or phone like = ? or address like = ? or remark like = ?";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new BeanListHandler<Logistics>(Logistics.class), params);
    }

    @Override
    public Logistics findByName(String name) throws SQLException {
        String sql = "select * from tab_logistics where name = ?";
        return runner.query(sql, new BeanHandler<Logistics>(Logistics.class), name);
    }

    @Override
    public boolean add(Logistics logistics) throws SQLException {
        String sql = " insert into tab_logistics(name, phone, address, remark) values (?, ?, ?, ?)";
        Object[] params = {logistics.getName(), logistics.getPhone(), logistics.getAddress(), logistics.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(Logistics logistics) throws SQLException {
        String sql = " update tab_logistics set phone = ?, address = ?, remark = ? where name = ?";
        Object[] params = {logistics.getPhone(), logistics.getAddress(), logistics.getRemark(), logistics.getName()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByName(String name) throws SQLException {
        String sql = " delete from tab_logistics where name = ?";
        return 1 == runner.update(sql, name);
    }

    @Override
    public boolean deleteByNames(String names) throws SQLException {
        Object[] params = names.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from where name in (");
        for(int i = 0; i < len; i++){
            if(i != len-1){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql, params);
    }
}
