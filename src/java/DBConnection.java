import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        try {
            // Load JDBC driver (for MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database URL
            String url = "jdbc:mysql://localhost:3306/porfolio";
            String username = "root";
            String password = "root";
            
            return DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
            throw new SQLException("Unable to connect to database");
        }
    }
}
