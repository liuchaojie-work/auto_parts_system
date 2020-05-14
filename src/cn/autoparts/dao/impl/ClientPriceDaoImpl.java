package cn.autoparts.dao.impl;

import cn.autoparts.bean.ClientPrice;
import cn.autoparts.dao.IClientPriceDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ClientPriceDaoImpl implements IClientPriceDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    @Override
    public List<Map<String, Object>> findAll() throws SQLException {
        String sql = "select tab_client_price.cpNo, tab_user.username, tab_user.name, tab_user.phone, tab_product.typeno, tab_cate_bra.cname, " +
                " tab_cate_bra.bname, tab_client_price.price, tab_client_price.time, tab_client_price.remark " +
                " from  tab_user, tab_product, tab_cate_bra, tab_client_price where tab_client_price.userId = tab_user.userId and" +
                " tab_client_price.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId ";
        return runner.query(sql, new MapListHandler());
    }

    @Override
    public Map<String, Object> findByUserIdAndProId(String userId, String proId) throws SQLException {
        String sql = "select tab_client_price.cpNo, tab_user.username, tab_user.name, tab_user.phone, tab_product.typeno, tab_cate_bra.cname, " +
                " tab_cate_bra.bname, tab_client_price.price, tab_client_price.time, tab_client_price.remark " +
                " from  tab_user, tab_product, tab_cate_bra, tab_client_price where tab_client_price.userId = tab_user.userId and" +
                " tab_client_price.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId and " +
                " tab_client_price.userId = ? and tab_client_price.proId = ? ";
        return runner.query(sql, new MapHandler(),userId, proId);
    }

    @Override
    public List<Map<String, Object>> findByCondition(String condition) throws SQLException {
        String sql = "select tab_client_price.cpNo, tab_user.username, tab_user.name, tab_user.phone, tab_product.typeno, tab_cate_bra.cname, " +
                " tab_cate_bra.bname, tab_client_price.price, tab_client_price.time, tab_client_price.remark " +
                " from  tab_user, tab_product, tab_cate_bra, tab_client_price where tab_client_price.userId = tab_user.userId and" +
                " tab_client_price.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId and ( " +
                " tab_user.username like ? or tab_user.name like ? or tab_user.phone like ? or tab_product.typeno like ? or" +
                " tab_cate_bra.cname like ? or tab_cate_bra.bname like ? or tab_client_price.price like ? or tab_client_price.time like binary ? " +
                " or tab_client_price.remark like ? )";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%",
                        "%"+ condition +"%","%"+ condition +"%","%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new MapListHandler(),params);
    }

    @Override
    public Map<String, Object> findByCpNo(String cpNo) throws SQLException {
        String sql = "select tab_user.username, tab_user.name, tab_user.phone, tab_product.typeno, tab_cate_bra.cname, " +
                " tab_cate_bra.bname, tab_client_price.price, tab_client_price.time, tab_client_price.remark " +
                " from  tab_user, tab_product, tab_cate_bra, tab_client_price where tab_client_price.userId = tab_user.userId and" +
                " tab_client_price.proId = tab_product.proId and tab_product.cbId = tab_cate_bra.cbId and  tab_client_price.cpNo = ?";
        return runner.query(sql, new MapHandler(), cpNo);
    }

    @Override
    public boolean add(ClientPrice clientPrice) throws SQLException {
        String sql = "insert into tab_client_price(cpNo, userId, proId, price, time, remark) values(?,?,?,?,?,?)";
        Object[] params = {clientPrice.getCpNo(), clientPrice.getUserId(), clientPrice.getProId(), clientPrice.getPrice(),
                            clientPrice.getTime(), clientPrice.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(ClientPrice clientPrice) throws SQLException {
        String sql = "update tab_client_price set price = ?, time = ?, remark = ? " +
                " where cpNo = ? ";
        Object[] params = {clientPrice.getPrice(), clientPrice.getTime(), clientPrice.getRemark(), clientPrice.getCpNo()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByCpNo(String cpNo) throws SQLException {
        String sql = "delete from tab_client_price where cpNo = ?";
        return 1 == runner.update(sql, cpNo);
    }

    @Override
    public boolean deleteByCpNos(String cpNos) throws SQLException {
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_client_price where cpNo in (");
        Object[] params = cpNos.split(",");
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
