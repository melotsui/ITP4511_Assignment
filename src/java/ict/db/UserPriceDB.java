/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.CenterPriceBean;
import com.mysql.jdbc.Connection;
import ict.bean.CenterBean;
import ict.bean.UserBean;
import ict.bean.UserPriceBean;
import java.io.IOException;
import java.sql.*;
import java.util.*;

/**
 *
 * @author temp
 */
public class UserPriceDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public UserPriceDB(String url, String username, String password) {
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

    public boolean addUserPrice(int year, String price) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "insert into esd.trainerHourlyRate (id, trainerID, year, price) values ((select count(id)+1 from esd.trainerHourlyRate subquery), (select count(id) from esd.user), ?, ?);";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, year + "");
            pStmnt.setString(2, price);
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
        }
        return isSuccess;
    }

    public ArrayList<UserPriceBean> queryUserPriceByID(String id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            //1.  get Connection
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.trainerHourlyRate where trainerID = ?";
            //2.  get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3. update the placehoder with id
            pStmnt.setString(1, id);
            ResultSet rs = null;
            //4. execute the query and assign to the result 
            rs = pStmnt.executeQuery();

            ArrayList<UserPriceBean> list = new ArrayList<UserPriceBean>();
            while (rs.next()) {
                // set the record detail to the customer bean
                UserPriceBean cb = new UserPriceBean();
                cb.setId(rs.getString(1));
                cb.setTrainerID(rs.getString(2));
                cb.setYear(rs.getString(3));
                cb.setPrice(rs.getInt(4));
                list.add(cb);
            }
            System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSS " + list.size());

            pStmnt.close();
            cnnct.close();
            return list;
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean editCenterPrice(int price, String centerID, String year) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int num = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE esd.centerHourlyRate SET price=? WHERE centerID=? and year=?;";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, price);
            pStmnt.setString(2, centerID);
            pStmnt.setString(3, year);
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
