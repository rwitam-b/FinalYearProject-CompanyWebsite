package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Database {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private String DB_URL;
    private String USER;
    private String PASS;
    private Connection C;
    private Statement S;
    private PreparedStatement PS;

    public Database(String address, String db, String user, String password) {
        try {
            this.USER = user;
            this.PASS = password;
            this.DB_URL = "jdbc:mysql://" + address + "/" + db;
            Class.forName(JDBC_DRIVER);
            C = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Database Connectivity Established !");
        } catch (Exception e) {
            System.out.println("Database Connection Error !");
        }
    }

    public String getName(String guid) {
        String name = "";
        try {
            PS = C.prepareStatement("SELECT name FROM login WHERE guid=?");
            PS.setString(1, guid);
            ResultSet RS = PS.executeQuery();
            if (!RS.isBeforeFirst()) {
                System.out.println("User " + guid + " is not registered !");
            } else {
                RS.next();
                name = RS.getString("name");
            }
        } catch (Exception e) {
            System.out.println("Error While Attempting To Sign-In For " + guid);
        }
        return name;
    }

    public String getCompanyEmail() {
        String name = "";
        try {
            S = C.createStatement();
            ResultSet RS = S.executeQuery("SELECT email from details");
            RS.next();
            name = RS.getString("email");
        } catch (Exception e) {
            System.out.println("Error While Attempting To Retreive Company Email");
        }
        return name;
    }

    public boolean checkLogin(String guid, String password) {
        boolean out = false;
        try {
            PS = C.prepareStatement("SELECT password FROM login WHERE guid=?");
            PS.setString(1, guid);
            ResultSet RS = PS.executeQuery();
            if (!RS.isBeforeFirst()) {
                System.out.println("User " + guid + " is not registered !");
            } else {
                RS.next();
                String dbPass = RS.getString("password");
                if (dbPass.equals(password)) {
                    out = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error While Attempting To Sign-In For " + guid);
        }
        return out;
    }

    public void destroy() {
        try {
            C.close();
            System.out.println("Database Connection Closed Successfully !");
        } catch (Exception e) {
            System.out.println("Error Closing Database Connection !");
        }
    }
}
