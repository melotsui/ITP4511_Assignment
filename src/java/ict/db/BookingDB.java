/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import com.mysql.jdbc.Connection;
import ict.bean.CenterBookingBean;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author hhch0
 */
public class BookingDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public BookingDB() {
    }

    public BookingDB(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return (Connection) DriverManager.getConnection(url, username, password);
    }

    public boolean addBooking(CenterBookingBean bean, String customerID) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        String insertedBookingID = null;
        try {
            cnnct = getConnection();
            if (bean.getTrainerBooking() != null) {
                cnnct = getConnection();

                PreparedStatement preQueryStatement = null;
                ResultSet rs = null;
                String sql = "SELECT price FROM trainerHourlyRate WHERE trainerID = ? AND year = CURRENT_DATE()";
                preQueryStatement = cnnct.prepareStatement(sql);
                preQueryStatement.setString(1, bean.getTrainerBooking().getTrainerID());

                preQueryStatement.execute();
                rs = preQueryStatement.getResultSet();

                if (rs.next()) {
                    String insertTrainerBooking = "INSERT INTO trainerBooking (id, trainerID, price) VALUES ((SELECT count(id)+1 FROM esd.trainerBooking subquery), ?, ?)";
                    PreparedStatement insertTrainerBookingStmnt = cnnct.prepareStatement(insertTrainerBooking, Statement.RETURN_GENERATED_KEYS);

                    insertTrainerBookingStmnt.setString(1, bean.getTrainerBooking().getTrainerID());
                    insertTrainerBookingStmnt.setString(2, rs.getString(1));
                    insertTrainerBookingStmnt.executeUpdate();

                    ResultSet rs1 = insertTrainerBookingStmnt.getGeneratedKeys();
                        System.out.println(rs1.toString());
                    if (rs1.next()) {
                        long id = rs1.getLong(1);
                        insertedBookingID = String.valueOf(id);
                    }
                }

            }

            String insertCenter = "INSERT INTO centerBooking (id, centerID, customerID, startDate, startTime, price, trainerBookingID) VALUES ((SELECT count(id)+1 FROM esd.centerBooking subquery), ?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(insertCenter);
            pStmnt.setString(1, bean.getCenterID());
            pStmnt.setString(2, customerID);
            pStmnt.setString(3, bean.getStartDate());
            pStmnt.setString(4, bean.getStartTime());
            pStmnt.setDouble(5, bean.getPrice());
            pStmnt.setString(6, insertedBookingID);

            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

}
