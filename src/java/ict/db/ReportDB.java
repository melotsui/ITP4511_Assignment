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
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
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
    DecimalFormat df = new DecimalFormat("0.0");

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

    public ArrayList queryAllCenterBookingRate(String date) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "select centerID, esd.center.name, Count(esd.centerBooking.id) as 'Booking' from esd.centerBooking, esd.center where esd.centerBooking.centerID = esd.center.id and YEAR(esd.centerBooking.createDateTime) = ? group by centerID order by Booking desc;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, date);
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
                cb.setCenterBookings(rs.getInt("Booking") + "/" + 43800);
                cb.setCenterBookingRate(rs.getInt("Booking") / 43800.0);
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

    public ArrayList queryAllTrainerBookingRate(String date) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "select esd.trainerBooking.trainerID, CONCAT(esd.user.firstName, ' ', esd.user.lastName) AS name , Count(esd.trainerBooking.id) as 'Booking' from esd.trainerBooking, esd.user where YEAR(esd.trainerBooking.createDateTime) = ? and esd.trainerBooking.trainerID = esd.user.id group by trainerID order by Booking desc;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, date);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            preQueryStatement = "select count(id) as countID from esd.trainerBooking;";
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
                cb.setTrainerID(rs.getString("trainerID"));
                cb.setTrainerName(rs.getString("name"));
                cb.setTrainerBookings(rs.getInt("Booking") + "/" + 43800);
                cb.setTrainerBookingRate(rs.getInt("Booking") / 43800.0);
//                System.out.println("AAAAAAAAAAAAAA " + cb.getTrainerID() + " " + cb.getTrainerName() + " " + cb.getTrainerBookingRate() + " " + cb.getTrainerBookings());
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

    public ArrayList queryAllCustomerBookingRecord(String date) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT esd.user.id as customerID, "
                    + "CONCAT(esd.user.firstName, ' ', esd.user.lastName) as name, "
                    + "sum(esd.centerBooking.price) as centerBookingPrice, "
                    + "sum(esd.trainerBooking.price) as trainerBookingPrice "
                    + "FROM esd.centerBooking JOIN esd.center ON esd.center.id = esd.centerBooking.centerID "
                    + "JOIN esd.user ON esd.user.id = esd.centerBooking.customerID LEFT JOIN esd.trainerBooking "
                    + "ON esd.trainerBooking.id = esd.centerBooking.trainerBookingID "
                    + "where YEAR(esd.trainerBooking.createDateTime) = ? group by customerID;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, date);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

//            preQueryStatement = "select count(id) as countID from esd.trainerBooking;";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            //Statement s = cnnct.createStatement();
//            ResultSet rrs = pStmnt.executeQuery();
            ArrayList list = new ArrayList();
//            double countAllBooking = 0;
//            if (rrs.next()) {
//                countAllBooking = rrs.getInt("countID");
////                System.out.println(countAllBooking);
//            }

//                System.out.println(countAllBooking);
            while (rs.next()) {
//                System.out.println(rs.getInt("Booking"));
//                System.out.println(countAllBooking);
//                System.out.println(rs.getInt("Booking")/countAllBooking*100);
                ReportBean cb = new ReportBean();
                cb.setCustomerID(rs.getString("customerID"));
                cb.setCustomerName(rs.getString("name"));
                cb.setCustomerBookingPrice(rs.getInt("centerBookingPrice") + rs.getInt("trainerBookingPrice"));
//                cb.setTrainerBookingRate(rs.getInt("Booking")/countAllBooking*100);
                System.out.println("AAAAAAAAAAAAAA " + cb.getCustomerID() + " " + cb.getCustomerName() + " " + cb.getCustomerBookingPrice());
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

    public ArrayList queryTrainerIncome(String date) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "select esd.user.id, CONCAT(esd.user.firstName, ' ', esd.user.lastName) AS name , SUM(esd.trainerBooking.price) as 'income' from esd.trainerBooking, esd.user where esd.trainerBooking.trainerID = esd.user.id and YEAR(esd.trainerBooking.createDateTime) = ? group by trainerID order by income desc;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, date);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ArrayList list = new ArrayList();
            while (rs.next()) {
//                System.out.println(rs.getInt("Booking"));
//                System.out.println(countAllBooking);
//                System.out.println(rs.getInt("Booking")/countAllBooking*100);
                ReportBean cb = new ReportBean();
                cb.setTrainerID(rs.getString("id"));
                cb.setTrainerName(rs.getString("name"));
                cb.setTrainerIncome(rs.getInt("income"));
//                System.out.println("AAAAAAAAAAAAAA " + cb.getTrainerID() + " " + cb.getTrainerName() + " " + cb.getTrainerIncome());
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

    public ArrayList queryCenterIncome(String date) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "select esd.center.id, esd.center.name, SUM(esd.centerBooking.price) as 'income' from esd.centerBooking, esd.center where esd.centerBooking.centerID = esd.center.id and YEAR(esd.centerBooking.createDateTime) = ? group by centerID order by income desc;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, date);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();
            ArrayList list = new ArrayList();
            while (rs.next()) {
//                System.out.println(rs.getInt("Booking"));
//                System.out.println(countAllBooking);
//                System.out.println(rs.getInt("Booking")/countAllBooking*100);
                ReportBean cb = new ReportBean();
                cb.setCenterID(rs.getString("id"));
                cb.setCenterName(rs.getString("name"));
                cb.setCenterIncome(rs.getInt("income"));
                System.out.println("AAAAAAAAAAAAAA " + cb.getCenterID() + " " + cb.getCenterIncome());
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

    public File bookingRateCsv(String year, String yearMonth, String centerID, String trainerID) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        System.out.println("year " + year + "yearMonth " + yearMonth);
        if(year.equalsIgnoreCase("") && yearMonth.equalsIgnoreCase("-01")){
            year = "2022";
        }
        try {
            String fileName = "booking-report.csv";
            File file = new File(fileName);
            // 创建文件
            file.createNewFile();
            FileWriter fw = new FileWriter(fileName);
            cnnct = getConnection();
            fw.append("Center Booking ID, Center ID, Center Name, Center Price, CustomerID, Customer First Name, Customer Last Name, Trainer ID, Trainer Price,"
                    + " Center Booking Start Date, Center Booking Start Time, Is Handled?, HandledBy, Handled Date Time, Trainer Booking ID, Is Approved?, Create Date TIme, Is Cancelled?, \n");
            if (!year.equals("")) {
                String preQueryStatement = "SELECT * FROM esd.centerBooking JOIN esd.center ON esd.center.id = esd.centerBooking.centerID JOIN esd.user ON esd.user.id = esd.centerBooking.customerID LEFT JOIN esd.trainerBooking ON esd.trainerBooking.id = esd.centerBooking.trainerBookingID where YEAR(esd.centerBooking.createDateTime) = ? ";
                if (!centerID.equals("")){
                    preQueryStatement += " and center.id = " + centerID;
                }
                if(!trainerID.equals("")){
                    preQueryStatement += " and trainerID = " + trainerID;
                }
                pStmnt = cnnct.prepareStatement(preQueryStatement);
                pStmnt.setString(1, year);
            } else {
                String preQueryStatement = "SELECT * FROM esd.centerBooking JOIN esd.center ON esd.center.id = esd.centerBooking.centerID JOIN esd.user ON esd.user.id = esd.centerBooking.customerID LEFT JOIN esd.trainerBooking ON esd.trainerBooking.id = esd.centerBooking.trainerBookingID where month(esd.centerBooking.createDateTime) = month(?)  and year(esd.centerBooking.createDateTime) = ?";
                if (!centerID.equals("")){
                    preQueryStatement += " and center.id = " + centerID;
                }
                if(!trainerID.equals("")){
                    preQueryStatement += " and trainerID = " + trainerID;
                }
                pStmnt = cnnct.prepareStatement(preQueryStatement);
                pStmnt.setString(1, yearMonth);
                pStmnt.setString(2, yearMonth);
            }
            ResultSet rs = pStmnt.executeQuery();

            while (rs.next()) {
                String content = "";
                ReportBean cb = new ReportBean();
                content += rs.getString("centerBooking.id");
                content += ',';
                content += rs.getString("center.id");
                content += ',';
                content += rs.getString("center.name");
                content += ',';
                content += rs.getString("centerBooking.price");
                content += ',';
                content += rs.getString("user.id");
                content += ',';
                content += rs.getString("user.firstName");
                content += ',';
                content += rs.getString("user.lastName");
                content += ',';
                content += rs.getString("trainerBooking.trainerID");
                content += ',';
                content += rs.getString("trainerBooking.price");
                content += ',';
                content += rs.getString("startDate");
                content += ',';
                content += rs.getString("startTime");
                content += ',';
                content += rs.getString("centerBooking.price");
                content += ',';
                content += rs.getString("centerBooking.isHandled");
                content += ',';
                content += rs.getString("centerBooking.handledDateTime");
                content += ',';
                content += rs.getString("trainerBookingID");
                content += ',';
                content += rs.getString("centerBooking.isApproved");
                content += ',';
                content += rs.getString("centerBooking.createDateTime");
                content += ',';
                content += rs.getString("centerBooking.isCancelled");
                content += ',';
                System.out.println("SSSSSSSSSSSSSS " + content);
                fw.append(content + '\n');
            }
            fw.flush();
            fw.close();

            FileReader fr = new FileReader(file);
            BufferedReader bufferedReader = new BufferedReader(fr);
            String temp = null;
            while ((temp = bufferedReader.readLine()) != null) {
                System.out.println(temp);
            }
            fr.close();
            cnnct.close();
            return file;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public File incomeRateCsv() {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        try {
            String fileName = "income-report.csv";
            File file = new File(fileName);
            // 创建文件
            file.createNewFile();
            FileWriter fw = new FileWriter(fileName);
            cnnct = getConnection();
            fw.append("Center ID, Center Name, Booking Rate\n");
            String preQueryStatement = "select centerID, esd.center.name, Count(esd.centerBooking.id) as 'Booking' from esd.centerBooking, esd.center where esd.centerBooking.centerID = esd.center.id and YEAR(esd.centerBooking.createDateTime) = 2022 group by centerID order by Booking desc;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = pStmnt.executeQuery();

            preQueryStatement = "select count(id) as countID from esd.centerBooking;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rrs = pStmnt.executeQuery();

//            ArrayList list = new ArrayList();
            double countAllBooking = 0;
            if (rrs.next()) {
                countAllBooking = rrs.getInt("countID");
//                System.out.println(countAllBooking);
            }
//                ReportBean cb = new ReportBean();
//                cb.setCenterID(rs.getString("centerID"));
//                cb.setCenterName(rs.getString("name"));
//                cb.setCenterBookings(rs.getInt("Booking")+"/"+(int)countAllBooking);
//                cb.setCenterBookingRate(rs.getInt("Booking")/countAllBooking*100);
            while (rs.next()) {
                String content = "";
                ReportBean cb = new ReportBean();
                content += rs.getString("centerID");
                content += ',';
                content += rs.getString("name");
                content += ',';
                content += rs.getInt("Booking") + "/" + (int) countAllBooking + " (" + df.format(rs.getInt("Booking") / countAllBooking * 100) + "%)";
                content += ',';
                System.out.println("SSSSSSSSSSSSSS " + content);
                fw.append(content + '\n');
            }
            fw.flush();
            fw.close();

            FileReader fr = new FileReader(file);
            BufferedReader bufferedReader = new BufferedReader(fr);
            String temp = null;
            while ((temp = bufferedReader.readLine()) != null) {
                System.out.println(temp);
            }
            fr.close();
            cnnct.close();
            return file;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
