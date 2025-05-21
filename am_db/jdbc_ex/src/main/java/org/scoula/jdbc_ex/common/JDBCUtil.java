package org.scoula.jdbc_ex.common;

import java.sql.Connection;
import java.util.Properties;

public class JDBCUtil {
    //1. 드라이버 설정. 2/ db연결 이용해서 연결하는 것까지
    //-> connection con; <-- con을 리턴!
    static Connection con = null;
    public static Connection getConnection() {
        if (con == null) return con;
        try{
            Properties prop = new Properties();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
