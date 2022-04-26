/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.CenterBean;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.*;
import java.util.*;
/**
 *
 * @author temp
 */
public class CenterDB {

    private String url = "";
    private String username = "";
    private String password = "";
    
    public CenterDB(String url, String username, String password) {
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

    public ArrayList queryActiveCenter() {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.center WHERE isActive=1";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ArrayList list = new ArrayList();

            while (rs.next()) {
                CenterBean cb = new CenterBean();
                cb.setId(rs.getString(1));
                cb.setName(rs.getString(2));
                cb.setAddress(rs.getString(3));
                cb.setPhone(rs.getInt(4));
                cb.setFee(rs.getInt(5));
                cb.setCreateDateTime(rs.getString(6));
                cb.setIsActive(rs.getBoolean(7));
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
