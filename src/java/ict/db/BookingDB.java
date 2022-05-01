/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import com.mysql.jdbc.Connection;
import ict.bean.CenterBookingBean;
import ict.bean.TrainerBookingBean;
import ict.bean.UserBean;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

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

    public ArrayList queryBookings() {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.centerBooking JOIN esd.center ON esd.center.id = esd.centerBooking.centerID JOIN esd.user ON esd.user.id = esd.centerBooking.customerID LEFT JOIN esd.trainerBooking ON esd.trainerBooking.id = esd.centerBooking.trainerBookingID;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = pStmnt.executeQuery();
            
            ArrayList list = new ArrayList();
            while (rs.next()) {
                TrainerBookingBean tbb = new TrainerBookingBean();
                CenterBookingBean cbb = new CenterBookingBean();
                tbb.setId(rs.getString("trainerBooking.id"));
                tbb.setTrainerID(rs.getString("trainerID"));
                String queryStatement = "select firstName, lastName from esd.user where id = ?;";
                PreparedStatement pStmntName = cnnct.prepareStatement(queryStatement);
                System.out.println(tbb.getTrainerID());
                pStmntName.setString(1, tbb.getTrainerID());
                ResultSet rsName = pStmntName.executeQuery();
                if(rsName.next()){
                    tbb.setTrainerName(rsName.getString("firstName") +" "+ rsName.getString("lastName"));
                }
                cbb.setId(rs.getString("centerBooking.id"));
                tbb.setPrice(rs.getInt("trainerBooking.price"));
                cbb.setTrainerBookingID(rs.getString("centerBooking.id"));
                cbb.setTrainerBooking(tbb);
                cbb.setCenterID(rs.getString("centerID"));
                cbb.setCenterName(rs.getString("center.name"));
                cbb.setCustomerID(rs.getString("customerID"));
                cbb.setBookingUserName(rs.getString("user.firstName") +" "+ rs.getString("user.lastName"));
                cbb.setStartDate(rs.getString("startDate"));
                cbb.setStartTime(rs.getString("startTime"));
                cbb.setPrice(rs.getInt("centerBooking.price"));
                cbb.setIsApproved(rs.getBoolean("centerBooking.isApproved"));
                cbb.setIsHandled(rs.getBoolean("centerBooking.isHandled"));
                cbb.setIsCancelled(rs.getBoolean("centerBooking.isCancelled"));
                list.add(cbb);
            }
            return list;
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (pStmnt != null) {
                try {
                    pStmnt.close();
                } catch (SQLException e) {
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException sqlEx) {
                }
            }
        }
        return null;
    }
    
    public CenterBookingBean queryBookingById(String id) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null; 
        CenterBookingBean cbb = new CenterBookingBean();
        ResultSet rs = null;
        System.out.println("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD "+id);
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.centerBooking JOIN esd.center ON esd.center.id = esd.centerBooking.centerID JOIN esd.user ON esd.user.id = esd.centerBooking.customerID LEFT JOIN esd.trainerBooking ON esd.trainerBooking.id = esd.centerBooking.trainerBookingID WHERE esd.centerBooking.id = ?;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            System.out.println("SSSSSSSSSSSSSSSSSSSSSS " + preQueryStatement);
            pStmnt.setString(1, id);
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                TrainerBookingBean tbb = new TrainerBookingBean();
                tbb.setTrainerID(rs.getString("trainerID"));
                String queryStatement = "select firstName, lastName from esd.user where id = ?;";
                PreparedStatement pStmntName = cnnct.prepareStatement(queryStatement);
                System.out.println(tbb.getTrainerID());
                pStmntName.setString(1, tbb.getTrainerID());
                ResultSet rsName = pStmntName.executeQuery();
                if(rsName.next()){
                    tbb.setTrainerName(rsName.getString("firstName") + rsName.getString("lastName"));
                }
                tbb.setIsHandled(rs.getBoolean("trainerBooking.isHandled"));
                tbb.setPrice(rs.getInt("trainerBooking.price"));
                System.out.println(tbb);
                cbb.setTrainerBooking(tbb);
                cbb.setCenterID(rs.getString("centerID"));
                cbb.setId(rs.getString("id"));
                cbb.setCenterName(rs.getString("name"));
                cbb.setCustomerID(rs.getString("customerID"));
                cbb.setStartDate(rs.getString("startDate"));
                cbb.setStartTime(rs.getString("startTime"));
                cbb.setPrice(rs.getInt("centerBooking.price"));
                cbb.setCreateDateTime(rs.getString("centerBooking.createDateTime"));
                cbb.setHandledBy(rs.getString("centerBooking.handledBy"));
                cbb.setHandledDateTime(rs.getString("centerBooking.handledDateTime"));
                cbb.setIsApproved(rs.getBoolean("centerBooking.isApproved"));
                cbb.setIsCancelled(rs.getBoolean("centerBooking.isCancelled"));
                
                System.out.println(cbb);
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
        }
        return cbb;
    }

    public boolean cancelBooking(String id) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int num = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE esd.centerBooking SET isCancelled=1 WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            //Statement s = cnnct.createStatement();
            num = pStmnt.executeUpdate();

        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (pStmnt != null) {
                try {
                    pStmnt.close();
                } catch (SQLException e) {
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException sqlEx) {
                }
            }
        }
        return (num == 1) ? true : false;
    }

}
