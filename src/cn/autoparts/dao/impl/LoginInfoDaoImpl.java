package cn.autoparts.dao.impl;

import cn.autoparts.bean.LoginInfo;
import cn.autoparts.dao.ILoginInfoDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class LoginInfoDaoImpl implements ILoginInfoDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    @Override
    public List<Map<String, Object>> findAll() throws SQLException {
        String sql = "select tab_login_info.no, tab_login_info.userId, tab_user.name, tab_user.phone, " +
                " tab_user.gender, tab_user.iden, tab_login_info.time, tab_login_info.remark from tab_user, tab_login_info" +
                " where tab_login_info.userId = tab_user.userId";
        return runner.query(sql, new MapListHandler());
    }

    @Override
    public List<Map<String, Object>> findByCondition(String condition) throws SQLException {
        String sql = "select tab_login_info.no, tab_login_info.userId, tab_user.name, tab_user.phone, " +
                " tab_user.gender, tab_user.iden, tab_login_info.time, tab_login_info.remark from tab_user, tab_login_info" +
                " where tab_login_info.userId = tab_user.userId and (tab_login_info.no like ? or tab_login_info.userId like ? or tab_user.name like ? " +
                " or tab_user.phone like ? or tab_user.gender like ? or tab_user.iden like ? or tab_login_info.time like binary ? or tab_login_info.remark like ? )";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%",
                "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new MapListHandler(), params);
    }

    @Override
    public boolean add(LoginInfo loginInfo) throws SQLException {
        String sql = " insert into tab_login_info(no, userId, time, remark) values(?,?,?,?)";
        Object[] params = {loginInfo.getNo(), loginInfo.getUserId(), loginInfo.getTime(), loginInfo.getRemark()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByNo(String no) throws SQLException {
        String sql = "delete from tab_login_info where no = ?";
        return 1 == runner.update(sql, no);
    }

    @Override
    public boolean deleteByNos(String nos) throws SQLException {
        Object[] params = nos.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append(" delete from tab_login_info where no in (");
        for( int i = 0; i < len; i++){
            if(i != len - 1 ){
                sb.append("?,");
            }else{
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql, params);
    }
}
