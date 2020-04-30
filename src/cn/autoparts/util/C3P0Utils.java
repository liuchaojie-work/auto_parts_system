package cn.autoparts.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 使用C3P0连接池得到数据库的连接对象
 */
public class C3P0Utils {
    /**
     * 构造函数私有
     */
    private C3P0Utils(){

    }
    /**
     *得到数据源
     */
    private static DataSource dataSource = new ComboPooledDataSource();

    /**
     * 返回数据源对象
     * @return
     */
    public static DataSource getDataSource(){
        return dataSource;
    }

    /**
     * 得到数据库的连接对象
     * @return
     */
    public static Connection getConnection(){
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("创建数据库连接失败！");
        }
    }

    public static void close(AutoCloseable... autoCloseables){
        if(null == autoCloseables || 0 == autoCloseables.length){
            return;
        }
        for(AutoCloseable autoCloseable : autoCloseables){
            if(null == autoCloseable){
                continue;
            }
            if(autoCloseable.getClass() != Connection.class){
                try {
                    autoCloseable.close();
                } catch (Exception e) {
                    System.err.println("关闭数据库资源失败："+ autoCloseable);
                    autoCloseable = null;
                }
            }
        }
    }
}
