package cn.autoparts.dao.impl;

import cn.autoparts.bean.Inventory;
import cn.autoparts.dao.IInventoryDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class InventoryDaoImpl implements IInventoryDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    @Override
    public List<Inventory> findAll() throws SQLException {
        String sql = "select * from tab_inventory";
        return runner.query(sql, new BeanListHandler<Inventory>(Inventory.class));
    }

    @Override
    public List<Inventory> findAllByCondition(String condition) throws SQLException {
        String sql = "select * from tab_inventory where proId like ? or count like ? or remark like ?";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new BeanListHandler<Inventory>(Inventory.class), params);
    }

    @Override
    public Inventory findByProId(String proId) throws SQLException {
        String sql = "select * from tab_inventory where proId = ?";
        return runner.query(sql, new BeanHandler<Inventory>(Inventory.class), proId);
    }

    @Override
    public boolean add(Inventory inventory) throws SQLException {
        String sql = "insert into tab_inventory(proId, count, remark) values(?,?,?)";
        Object[] params = {inventory.getProId(), inventory.getCount(), inventory.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(Inventory inventory) throws SQLException {
        String sql = "update tab_inventory set count = ?, remark = ? where proId = ?";
        Object[] params = {inventory.getCount(), inventory.getRemark(), inventory.getProId()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByProId(String proId) throws SQLException {
        String sql = "delete from tab_inventory where proId = ?";
        return 1 == runner.update(sql, proId);
    }

    @Override
    public boolean deleteByProIds(String proIds) throws SQLException {
        Object[] params = proIds.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_inventory where proId in (");
        for(int i = 0; i < len; i++){
            if(i != len - 1){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql,params);
    }
}
