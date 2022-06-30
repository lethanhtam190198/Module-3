package reponsitory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseReponsitory {
    private String jdbcURL = "jdbc:mysql://localhost:3306/baitapss12";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    private static Connection connection;

    public BaseReponsitory() {

    }

    public Connection getConnection() {
        connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
}
