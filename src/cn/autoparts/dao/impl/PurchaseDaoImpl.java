package cn.autoparts.dao.impl;

import cn.autoparts.bean.Purchase;
import cn.autoparts.dao.IPurchaseDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class PurchaseDaoImpl implements IPurchaseDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(tab_purchase.purNo) from tab_purchase, tab_product, tab_cate_bra, tab_location where tab_purchase.proId = tab_product.proId and " +
                    " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.locNo = tab_location.no";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(tab_purchase.purNo) from tab_purchase, tab_product, tab_cate_bra, tab_location where (tab_purchase.proId = tab_product.proId and " +
                    " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.locNo = tab_location.no) and (tab_purchase.purNo like ? or tab_product.typeno like ? " +
                    " or tab_cate_bra.cname like ? or tab_cate_bra.bname like ? or tab_purchase.purchasePrice like ? or tab_purchase.count like ? or tab_purchase.sellPrice like ? " +
                    " or tab_purchase.time like binary ? or tab_location.loca like ? or tab_purchase.remark like ?)";
            Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%",
                    "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<Object[]> findByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select tab_purchase.purNo, tab_purchase.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname ,tab_purchase.purchasePrice, "  +
                    " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark " +
                    " from tab_purchase, tab_product, tab_cate_bra, tab_location where tab_purchase.proId = tab_product.proId and "  +
                    " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.locNo = tab_location.no limit ?, ?";
            return runner.query(sql, new ArrayListHandler(), start, pageSize);
        }else{
            String sql =  "select tab_purchase.purNo, tab_purchase.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname ,tab_purchase.purchasePrice, " +
                    " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark"+
                    " from tab_purchase, tab_product, tab_cate_bra, tab_location where (tab_purchase.proId = tab_product.proId and " +
                    " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.locNo = tab_location.no) and (tab_purchase.purNo like ? or tab_product.typeno like ? " +
                    " or tab_cate_bra.cname like ? or tab_cate_bra.bname like ? or tab_purchase.purchasePrice like ? or tab_purchase.count like ? or tab_purchase.sellPrice like ? " +
                    " or tab_purchase.time like binary ? or tab_location.loca like ? or tab_purchase.remark like ?) limit ?, ?";
            Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%",
                    "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", start, pageSize};
            return runner.query(sql, new ArrayListHandler(), params);
        }
    }

    @Override
    public List<Object[]> findAll() throws SQLException {
        String sql = "select tab_purchase.purNo, tab_purchase.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname ,tab_purchase.purchasePrice, " +
                " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark"+
                " from tab_purchase, tab_product, tab_cate_bra, tab_location where tab_purchase.proId = tab_product.proId and " +
                " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.locNo = tab_location.no";
        return runner.query(sql, new ArrayListHandler());
    }

    @Override
    public Object[] findByPrimarykey(String proId, Integer purchasePrice) throws SQLException {
        String sql = "select tab_purchase.purNo, tab_purchase.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, " +
                " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark"+
                " from tab_purchase, tab_product, tab_cate_bra, tab_location where tab_purchase.proId = ? and tab_purchase.purchasePrice = ? and" +
                " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.proId = tab_product.proId and tab_purchase.locNo = tab_location.no";
        return runner.query(sql, new ArrayHandler(), proId, purchasePrice);
    }

    @Override
    public List<Object[]> findByProId(String proId) throws SQLException {
        String sql = "select tab_purchase.purNo, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, tab_purchase.purchasePrice, " +
                " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark"+
                " from tab_purchase, tab_product, tab_cate_bra, tab_location where tab_purchase.proId = ? and " +
                " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.proId = tab_product.proId and tab_purchase.locNo = tab_location.no";
        return runner.query(sql, new ArrayListHandler(), proId);
    }


    @Override
    public Object[] findByPurNo(String purNo) throws SQLException {
        String sql = "select tab_purchase.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, tab_purchase.purchasePrice, " +
                " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark ,tab_purchase.purNo, tab_category.unit"+
                " from tab_purchase, tab_product, tab_cate_bra, tab_location, tab_category where tab_purchase.purNo = ? and" +
                " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.proId = tab_product.proId and tab_purchase.locNo = tab_location.no and tab_cate_bra.cname = tab_category.name";
        return runner.query(sql, new ArrayHandler(), purNo);
    }

    @Override
    public List<Object[]> findByCondition(String condition) throws SQLException {
        String sql =  "select tab_purchase.purNo, tab_purchase.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname ,tab_purchase.purchasePrice, " +
                " tab_purchase.count, tab_purchase.sellPrice, tab_purchase.time, tab_location.loca, tab_purchase.remark"+
                " from tab_purchase, tab_product, tab_cate_bra, tab_location where (tab_purchase.proId = tab_product.proId and " +
                " tab_product.cbId = tab_cate_bra.cbId and tab_purchase.locNo = tab_location.no) and (tab_purchase.purNo like ? or tab_product.typeno like ?" +
                " or tab_cate_bra.cname like ? or tab_cate_bra.bname like ? or tab_purchase.purchasePrice like ? or tab_purchase.count like ? or tab_purchase.sellPrice like ? " +
                " or tab_purchase.time like binary ? or tab_location.loca like ? or tab_purchase.remark like ?)";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%",
                            "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new ArrayListHandler(), params);
    }

    @Override
    public boolean add(Purchase purchase) throws SQLException {
        String sql = "insert into tab_purchase(purNo, proId, purchasePrice, count, sellPrice, time, locNo, remark)" +
                " values(?, ?, ?, ?, ?, ?, ?, ?) ";
        Object[] params = {purchase.getPurNo(), purchase.getProId(), purchase.getPurchasePrice(), purchase.getCount(),
                            purchase.getSellPrice(), purchase.getTime(), purchase.getLocNo(), purchase.getRemark()};
        return 1 == runner.update(sql , params);
    }

    @Override
    public boolean change(Purchase purchase) throws SQLException {
        String sql = "update tab_purchase set count = ?, " +
                " sellPrice = ?, time = ?, locNo = ?, remark = ? where purNo = ?";
        Object[] params = { purchase.getCount(), purchase.getSellPrice(), purchase.getTime(),
                            purchase.getLocNo(), purchase.getRemark(), purchase.getPurNo()};
        return 1 == runner.update(sql, params);
    }

    /**
     * 入库时改变库存数量和售价
     * @param purchase
     * @return
     * @throws SQLException
     */
    @Override
    public boolean changeCount(Purchase purchase) throws SQLException {
        Integer proCount = (Integer) findByPrimarykey(purchase.getProId(), purchase.getPurchasePrice())[5];
        String sql = "update tab_purchase set count ="+ proCount +" + ?, " +
                " sellPrice = ?, time = ?, locNo = ?, remark = ? where purNo = ?";
        Object[] params = { purchase.getCount(), purchase.getSellPrice(), purchase.getTime(),
                purchase.getLocNo(), purchase.getRemark(), purchase.getPurNo()};
        return 1 == runner.update(sql, params);
    }


    @Override
    public boolean deleteByPurNo(String purNo) throws SQLException {
        String sql = "delete from tab_purchase where purNo = ?";
        return 1 == runner.update(sql, purNo);
    }

    @Override
    public boolean deleteByPurNos(String purNos) throws SQLException {
        Object[] params = purNos.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_purchase where purNo in (");
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
