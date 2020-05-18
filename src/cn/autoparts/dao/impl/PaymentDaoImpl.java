package cn.autoparts.dao.impl;

import cn.autoparts.bean.Payment;
import cn.autoparts.dao.IPaymentDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class PaymentDaoImpl implements IPaymentDao {

    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(payWay) from tab_payment";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(payWay) from tab_payment where payWay like ? or payStatus like ? or remark like ?";
            Object[] params = { "%"+ condition +"%",  "%"+ condition +"%", "%"+ condition +"%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<Payment> findByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_payment limit ?, ?";
            return runner.query(sql, new BeanListHandler<Payment>(Payment.class), start, pageSize);
        }else{
            String sql = "select * from tab_payment where payWay like ? or payStatus like ? or remark like ? limit ?, ?";
            Object[] params = { "%"+ condition +"%",  "%"+ condition +"%", "%"+ condition +"%", start, pageSize};
            return runner.query(sql, new BeanListHandler<Payment>(Payment.class), params);
        }
    }

    @Override
    public List<Payment> findAll() throws SQLException{
        String sql = "select * from tab_payment";
        return runner.query(sql, new BeanListHandler<Payment>(Payment.class));
    }

    @Override
    public List<Payment> findAllByCondition(String condition) throws SQLException {
        String sql = "select * from tab_payment where payWay like ? or payStatus like ? or remark like ?";
        Object[] params = { "%"+ condition +"%",  "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new BeanListHandler<Payment>(Payment.class), params);
    }

    @Override
    public Payment findByPayWay(String payWay) throws SQLException {
        String sql = "select * from tab_payment where payWay = ?";
        return runner.query(sql, new BeanHandler<Payment>(Payment.class), payWay);
    }

    @Override
    public boolean add(Payment payment) throws SQLException {
        String sql = "insert into tab_payment(payWay, payStatus, remark) values(?,?,?)";
        Object[] params = {payment.getPayWay(), payment.getPayStatus(), payment.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean change(Payment payment) throws SQLException {
        String sql = "update tab_payment set payStatus = ?, remark = ? where payWay = ?";
        Object[] params = {payment.getPayStatus(), payment.getRemark(), payment.getPayWay()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByPayWay(String payWay) throws SQLException {
        String sql = "delete from tab_payment where payWay = ?";
        return 1 == runner.update(sql, payWay);
    }

    @Override
    public boolean deleteByPayWays(String payWays) throws SQLException {
        Object[] params = payWays.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_payment where payWay in (");
        for(int i = 0; i < len ; i++){
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
