/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import com.mysql.jdbc.Connection;
import ict.bean.CenterBean;
import ict.bean.ReportBean;
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
public class ReportDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public ReportDB() {
    }

    public ReportDB(String url, String username, String password) {
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

    public ArrayList queryAllCenterBookingRate() {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "select centerID, esd.center.name, Count(esd.centerBooking.id) as 'Booking' from esd.centerBooking, esd.center where esd.centerBooking.centerID = esd.center.id and YEAR(startDate) = YEAR(sysdate()) group by centerID order by Booking desc;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            preQueryStatement = "select count(id) as countID from esd.centerBooking;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rrs = pStmnt.executeQuery();
            
            ArrayList list = new ArrayList();
            double countAllBooking = 0;
            if (rrs.next()) {
                countAllBooking = rrs.getInt("countID");
//                System.out.println(countAllBooking);
            }
            
//                System.out.println(countAllBooking);
            while (rs.next()) {
//                System.out.println(rs.getInt("Booking"));
//                System.out.println(countAllBooking);
//                System.out.println(rs.getInt("Booking")/countAllBooking*100);
                ReportBean cb = new ReportBean();
                cb.setCenterID(rs.getString("centerID"));
                cb.setCenterName(rs.getString("name"));
                cb.setCenterBookings(rs.getInt("Booking")+"/"+(int)countAllBooking);
                cb.setCenterBookingRate(rs.getInt("Booking")/countAllBooking);
//                System.out.println("AAAAAAAAAAAAAA " + cb.getCenterID() + " " + cb.getCenterName() + " " + cb.getCenterBookingRate() + " " + cb.getCenterBookings());
                list.add(cb);
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
    
}
