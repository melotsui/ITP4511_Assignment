/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.UserBean;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.*;
import java.util.*;
/**
 *
 * @author temp
 */
public class UserDB {

    private String url = "";
    private String username = "";
    private String password = "";
    
    public UserDB(String url, String username, String password) {
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

    public boolean register(String firstName, String lastName, String email, String password) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO esd.user (id, firstName, lastName, email, password, role) VALUES ((SELECT max(id)+1 FROM esd.user subquery), ?, ?, ?, ?, \"customer\")";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, firstName);
            pStmnt.setString(2, lastName);
            pStmnt.setString(3, email);
            pStmnt.setString(4, password);
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
    
    public boolean isValidUser(String email, String pwd) {
        java.sql.Connection cnnct = null;
        PreparedStatement preQueryStatement = null;
        ResultSet rs = null;
        boolean isValid = false;
        try {
            cnnct = getConnection();

            String sql = "SELECT * FROM esd.user WHERE email=? and password=?";
            preQueryStatement = cnnct.prepareStatement(sql);
            preQueryStatement.setString(1, email);
            preQueryStatement.setString(2, pwd);

            preQueryStatement.execute();
            rs = preQueryStatement.getResultSet();

            if (rs.next()) {
                isValid = true;
            }

        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return isValid;
    }
    
        public ArrayList queryCust() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.user";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ArrayList list = new ArrayList();

            while (rs.next()) {
                UserBean cb = new UserBean();
                cb.setId(rs.getString(1));
                cb.setEmail(rs.getString(2));
                cb.setPassword(rs.getString(3));
                cb.setFirstName(rs.getString(4));
                cb.setLastName(rs.getString(5));
                cb.setGender(rs.getString(6));
                cb.setAddress(rs.getString(7));
                cb.setCreateDateTime(rs.getString(8));
                cb.setPhone(rs.getInt(9));
                cb.setRole(rs.getString(10));
                cb.setBirthday(rs.getString(11));
                cb.setIsActive(rs.getBoolean(12));
                cb.setImage(rs.getString(13));
                cb.setCenterID(rs.getString(14));
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

    public UserBean getUserInfoByEmail(String email) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        UserBean cb = null;
        try {
            //1.  get Connection
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM esd.user WHERE email=?";
            //2.  get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3. update the placehoder with id
            pStmnt.setString(1, email);
            ResultSet rs = null;
            //4. execute the query and assign to the result 
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                // set the record detail to the customer bean
                cb = new UserBean();
                cb.setId(rs.getString(1));
                cb.setEmail(rs.getString(2));
                cb.setPassword(rs.getString(3));
                cb.setFirstName(rs.getString(4));
                cb.setLastName(rs.getString(5));
                cb.setGender(rs.getString(6));
                cb.setAddress(rs.getString(7));
                cb.setCreateDateTime(rs.getString(8));
                cb.setPhone(rs.getInt(9));
                cb.setRole(rs.getString(10));
                cb.setBirthday(rs.getString(11));
                cb.setIsActive(rs.getBoolean(12));
                cb.setImage(rs.getString(13));
                cb.setCenterID(rs.getString(14));
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
        return cb;
    }
    
    public boolean changePassword(String id, String oldPw, String newPw) {
        java.sql.Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int num=0;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE esd.user SET password=? WHERE id=? AND password=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, newPw);
            pStmnt.setString(2, id);
            pStmnt.setString(3, oldPw);
            //Statement s = cnnct.createStatement();
            num= pStmnt.executeUpdate();
          
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
    
//    public ArrayList queryUser() {
//
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "SELECT * FROM USER";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            ResultSet rs = pStmnt.executeQuery();
//            
//            ArrayList list = new ArrayList();
//            while (rs.next()) {
//                UserBean cb = new UserBean();
//                cb.setId(rs.getString(1));
//                cb.setUsername(rs.getString(2));
//                cb.setPassword(rs.getString(3));
//                cb.setName(rs.getString(4));
//                cb.setGender(rs.getString(5));
//                cb.setRole(rs.getString(6));
//                cb.setPhone(rs.getString(7));
//                list.add(cb);
//            }
//            return list;
//        } catch (SQLException ex) {
//            while (ex != null) {
//                ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
    
//    public UserBean queryUserByID(String id) {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//
//        UserBean cb = null;
//        try {
//            //1.  get Connection
//            cnnct = getConnection();
//            String preQueryStatement = "SELECT * FROM USER WHERE ID=?";
//            //2.  get the prepare Statement
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            //3. update the placehoder with id
//            pStmnt.setString(1, id);
//            ResultSet rs = null;
//            //4. execute the query and assign to the result 
//            rs = pStmnt.executeQuery();
//            if (rs.next()) {
//                cb = new UserBean();
//                // set the record detail to the customer bean
//                cb = new UserBean();
//                cb.setId(rs.getString(1));
//                cb.setUsername(rs.getString(2));
//                cb.setPassword(rs.getString(3));
//                cb.setName(rs.getString(4));
//                cb.setGender(rs.getString(5));
//                cb.setRole(rs.getString(6));
//                cb.setPhone(rs.getString(7));
//            }
//
//            pStmnt.close();
//            cnnct.close();
//        } catch (SQLException ex) {
//            while (ex != null) {
//                ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
//        return cb;
//    }
    
//    public ArrayList queryUserByName(String username) {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "SELECT * FROM USER WHERE NAME LIKE ?";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, "%" + username + "%");
//            //Statement s = cnnct.createStatement();
//            ResultSet rs = pStmnt.executeQuery();
//
//            ArrayList list = new ArrayList();
//
//            while (rs.next()) {
//                UserBean cb = new UserBean();
//                cb.setId(rs.getString(1));
//                cb.setUsername(rs.getString(2));
//                cb.setPassword(rs.getString(3));
//                cb.setName(rs.getString(4));
//                cb.setGender(rs.getString(5));
//                cb.setRole(rs.getString(6));
//                cb.setPhone(rs.getString(7));
//            }
//            return list;
//        } catch (SQLException ex) {
//            while (ex != null) {
//                ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        } finally {
//            if (pStmnt != null) {
//                try {
//                    pStmnt.close();
//                } catch (SQLException e) {
//                }
//            }
//            if (cnnct != null) {
//                try {
//                    cnnct.close();
//                } catch (SQLException sqlEx) {
//                }
//            }
//        }
//        return null;
//    }
    
//    public int editRecord(UserBean cb) {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "UPDATE USER SET USERNAME=? ,NAME=? ,GENDER=?, ROLE=?, PHONE=? WHERE ID=?";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, cb.getUsername());
//            pStmnt.setString(2, cb.getName());
//            pStmnt.setString(3, cb.getGender());
//            pStmnt.setString(4, cb.getRole());
//            pStmnt.setString(5, cb.getPhone());
//            pStmnt.setString(6, cb.getId());
//            //Statement s = cnnct.createStatement();
//            int rs = pStmnt.executeUpdate();
//            return rs;
//        } catch (SQLException ex) {
//            while (ex != null) {
//                ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        } finally {
//            if (pStmnt != null) {
//                try {
//                    pStmnt.close();
//                } catch (SQLException e) {
//                }
//            }
//            if (cnnct != null) {
//                try {
//                    cnnct.close();
//                } catch (SQLException sqlEx) {
//                }
//            }
//        }
//        return 0;
//    }
    
//   public int delRecord(String id) {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "DELETE FROM USER WHERE ID=?";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, id);
//
//            int rs = pStmnt.executeUpdate();
//            return rs;
//        } catch (SQLException ex) {
//            while (ex != null) {
//                ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        } finally {
//            if (pStmnt != null) {
//                try {
//                    pStmnt.close();
//                } catch (SQLException e) {
//                }
//            }
//            if (cnnct != null) {
//                try {
//                    cnnct.close();
//                } catch (SQLException sqlEx) {
//                }
//            }
//        }
//        return 0;
//    }
}
