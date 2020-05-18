package cn.autoparts.dao.impl;

import cn.autoparts.bean.Location;
import cn.autoparts.dao.ILocationDao;
import cn.autoparts.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class LocationDaoImpl implements ILocationDao {
    private QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());

    @Override
    public int findTotalCount(String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select count(no) from tab_location";
            return ((Long) runner.query(sql, new ScalarHandler())).intValue();
        }else{
            String sql = "select count(no) from tab_location where no like ? or loca like ? or remark like ?";
            Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
            return ((Long) runner.query(sql, new ScalarHandler(), params)).intValue();
        }
    }

    @Override
    public List<Location> findByPage(int start, int pageSize, String condition) throws SQLException {
        if(null == condition || 0 == condition.length()){
            String sql = "select * from tab_location limit ?, ?";
            return runner.query(sql, new BeanListHandler<Location>(Location.class), start, pageSize);
        }else{
            String sql = "select * from tab_location where no like ? or loca like ? or remark like ? limit ?, ?";
            Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%", start, pageSize};
            return runner.query(sql, new BeanListHandler<Location>(Location.class), params);
        }
    }

    @Override
    public List<Location> findAll() throws SQLException {
        String sql = "select * from tab_location";
        return runner.query(sql, new BeanListHandler<Location>(Location.class));
    }

    @Override
    public List<Location> findAllByCondition(String condition) throws SQLException {
        String sql = "select * from tab_location where no like ? or loca like ? or remark like ?";
        Object[] params = {"%"+ condition +"%", "%"+ condition +"%", "%"+ condition +"%"};
        return runner.query(sql, new BeanListHandler<Location>(Location.class), params);
    }

    @Override
    public Location findByNo(String no) throws SQLException {
        String sql = "select * from tab_location where no = ?";
        return runner.query(sql, new BeanHandler<Location>(Location.class), no);
    }

    @Override
    public Location findByLoca(String loca) throws SQLException {
        String sql = "select * from tab_location where loca = ?";
        return runner.query(sql, new BeanHandler<Location>(Location.class), loca);
    }

    @Override
    public boolean add(Location location) throws SQLException {
        String sql = "insert into tab_location(no, loca, remark) values(?,?,?)";
        Object[] params = {location.getNo(), location.getLoca(), location.getRemark()};
        return 1 == runner.update(sql,params);
    }

    @Override
    public boolean change(Location location) throws SQLException {
        String sql = "update tab_location set loca = ?, remark = ? where no = ?";
        Object[] params = {location.getLoca(), location.getRemark(), location.getNo()};
        return 1 == runner.update(sql, params);
    }

    @Override
    public boolean deleteByNo(String no) throws SQLException {
        String sql = "delete from tab_location where no = ?";
        return 1 == runner.update(sql, no);
    }

    @Override
    public boolean deleteByNos(String nos) throws SQLException {
        Object[] params = nos.split(",");
        int len = params.length;
        StringBuilder sb = new StringBuilder();
        sb.append("delete from tab_location where no in (");
        for(int i = 0; i < len; i++){
            if(i != len - 1){
                sb.append("?,");
            }else {
                sb.append("?)");
            }
        }
        String sql = sb.toString();
        return len == runner.update(sql, params);
    }
}
