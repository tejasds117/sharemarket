import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;

class connection {
    public static void main(String[] args) throws SQLException {

        String url ="jdbc:postgresql://localhost:5434/Stock";
        String username = "postgres";
        String password = "0000";
        String value = "1";
        String sql1 = "select stock_name from stock_name where stock_id = 1";
        String sql2 = "select stock_name from stock_name where stock_id = 2";
        Connection con = DriverManager.getConnection(url,username,password);
        Statement st = con.createStatement();
       

        ResultSet rs = st.executeQuery(sql1);
        rs.next();
        String name = rs.getString(1);
        System.out.println(name);

//        ResultSet rs = st.executeQuery(sql2);
//        rs.next();
//        String name = rs.getString(1);
//        System.out.println(name);
//        PreparedStatement statement = connection.prepareStatement(sql1);
//        String value = "1"; // Replace with user input
//        statement.setString(1, value); // Set parameter at index 1
//

    }



}
