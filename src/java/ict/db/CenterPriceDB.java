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
import java.io.IOException;
import java.sql.*;
import java.util.*;

/**
 *
 * @author temp
 */
public class CenterPriceDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public CenterPriceDB(String url, String username, String password) {
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

    public boolean addCenterPrice(int year, String price) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "insert into esd.centerHourlyRate (id, centerID, year, price) values ((select count(id)+1 from esd.centerHourlyRate subquery), (select count(id) from esd.center), ?, ?);";
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

    public ArrayList<CenterPriceBean> queryCenterPriceByID(String id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        System.out.println("IIIIIIDDDDDDDDDDDDDDDDDDDDDDDDDDDd ");
        try {
            //1.  get Connection
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.centerHourlyRate JOIN esd.center ON esd.center.id = esd.centerHourlyRate.centerID WHERE esd.center.id=?";
            //2.  get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3. update the placehoder with id
            pStmnt.setString(1, id);
            ResultSet rs = null;
            //4. execute the query and assign to the result 
            rs = pStmnt.executeQuery();

            ArrayList<CenterPriceBean> list = new ArrayList<CenterPriceBean>();
            while (rs.next()) {
                // set the record detail to the customer bean
                CenterPriceBean cb = new CenterPriceBean();
                cb.setId(rs.getString(1));
                cb.setCenterID(rs.getString(2));
                cb.setYear(rs.getInt(3));
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
