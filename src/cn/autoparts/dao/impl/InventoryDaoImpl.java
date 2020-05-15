package cn.autoparts.dao.impl;

import cn.autoparts.bean.Inventory;
import cn.autoparts.dao.IInventoryDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class InventoryDaoImpl implements IInventoryDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    @Override
    public List<Map<String , Object>> findAll() throws SQLException {
        String sql = "select tab_inventory.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, tab_inventory.count, tab_category.unit, tab_inventory.remark" +
                " from tab_inventory, tab_cate_bra, tab_category, tab_product where tab_inventory.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId and " +
                " tab_category.name = tab_cate_bra.cname";
        return runner.query(sql, new MapListHandler());
    }

    @Override
    public List<Map<String , Object>> findAllByCondition(String condition) throws SQLException {
        String sql = "select tab_inventory.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, tab_inventory.count, tab_category.unit, tab_inventory.remark" +
                " from tab_inventory, tab_cate_bra, tab_category, tab_product where tab_inventory.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId and " +
                " tab_category.name = tab_cate_bra.cname and (tab_inventory.typeno like ? or tab_cate_bra.cname like ? or tab_cate_bra.bname like ? or tab_inventory.count like ?" +
                " or tab_category.unit like ? or tab_inventory.remark like ? )";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new MapListHandler(), params);
    }

    @Override
    public Map<String , Object> findByProId(String proId) throws SQLException {
        String sql = "select tab_inventory.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, tab_inventory.count, tab_category.unit, tab_inventory.remark" +
                " from tab_inventory, tab_cate_bra, tab_category, tab_product where tab_inventory.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId and " +
                " tab_category.name = tab_cate_bra.cname and tab_inventory.proId = ?";
        return runner.query(sql, new MapHandler(), proId);
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
