import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class test {
    public static void main(String[] args) throws SQLException {

        String url = "jdbc:postgresql://localhost:5434/Stock";
        String username = "postgres";
        String password = "0000";

        String sql = "select stock_name from stock_name where stock_id = ?";


    }
}