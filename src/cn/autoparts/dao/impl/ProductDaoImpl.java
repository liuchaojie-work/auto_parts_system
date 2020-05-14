package cn.autoparts.dao.impl;

import cn.autoparts.bean.Product;
import cn.autoparts.dao.IProductDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImpl implements IProductDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    @Override
    public List<Object[]> findAll() throws SQLException {
        String sql = "select tab_product.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname," +
                " tab_product.img, tab_product.descr, tab_product.remark " +
                "from tab_product, tab_cate_bra " +
                "where tab_product.cbId = tab_cate_bra.cbId";
        return runner.query(sql, new ArrayListHandler());
    }

    @Override
    public List<Object[]> findAllByCondition(String condition) throws SQLException {
        String sql = "select tab_product.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname, " +
                "tab_product.img, tab_product.descr, tab_product.remark " +
                "from tab_product, tab_cate_bra " +
                "where tab_product.cbId = tab_cate_bra.cbId and " +
                "(tab_product.proId like ? or tab_product.typeno like ? or tab_cate_bra.cname like ? or tab_cate_bra.bname like ? or" +
                " tab_product.img like ? or tab_product.descr like ? or tab_product.remark like ?)";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new ArrayListHandler(), params);
    }

    @Override
    public Object[] findByProId(String proId) throws SQLException {
        String sql = "select tab_product.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname," +
                " tab_product.img, tab_product.descr, tab_product.remark " +
                "from tab_product, tab_cate_bra " +
                "where tab_product.cbId = tab_cate_bra.cbid and tab_product.proId = ?";
        return runner.query(sql, new ArrayHandler(), proId);
    }

    @Override
    public Object[] findByTypenoAndCbId(String typeno, String cbId) throws SQLException {
        String sql = "select tab_product.proId, tab_product.typeno, tab_cate_bra.cname, tab_cate_bra.bname," +
                " tab_product.img, tab_product.descr, tab_product.remark " +
                "from tab_product, tab_cate_bra " +
                "where tab_product.cbId = tab_cate_bra.cbId and tab_product.typeno = ? and tab_product.cbId = ?";
        return runner.query(sql, new ArrayHandler(), typeno, cbId);
    }

    @Override
    public List<Product> findByTypeno(String typeno) throws SQLException {
        String sql = "select * from tab_product where typeno = ?";
        return runner.query(sql , new BeanListHandler<Product>(Product.class), typeno);
    }

    @Override
    public List<Object[]> findByTypenoAndCname(String typeno, String cname) throws SQLException {
        String sql = "select tab_product.proId, tab_cate_bra.bname," +
                " tab_product.img, tab_product.descr, tab_product.remark " +
                "from tab_product, tab_cate_bra " +
                "where tab_product.cbId = tab_cate_bra.cbId and tab_product.typeno = ? and tab_cate_bra.cname = ?";
        return runner.query(sql, new ArrayListHandler(), typeno, cname);
    }

    @Override
    public boolean add(Product product) throws SQLException {
        String sql = "insert into tab_product(proId, typeno, cbId, img, descr, remark) values(?,?,?,?,?,?)";
        Object[] params = {product.getProId(), product.getTypeno(), product.getCbId(), product.getImg(), product.getDescr(),product.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(Product product) throws SQLException {
        String sql = "update tab_product set typeno = ?, cbId = ?, img = ?, descr = ?, remark = ? where proId = ?";
        Object[] params = {product.getTypeno(), product.getCbId(), product.getImg(), product.getDescr(), product.getRemark(), product.getProId()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByProId(String proId) throws SQLException {
        String sql = "delete from tab_product where proId = ?";
        return 1 == runner.update(sql, proId);
    }

    @Override
    public boolean deleteByProIds(String proIds) throws SQLException {
        Object[] params = proIds.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_product where proId in (");
        for(int i = 0; i < len; i++){
            if(i != len -1){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql, params);
    }
}
