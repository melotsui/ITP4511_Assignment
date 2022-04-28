/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.InputStream;
import java.io.Serializable;

/**
 *
 * @author Melo
 */
public class UserBean implements Serializable {

    private String id;
    private String email;
    private String password;

    @Override
    public String toString() {
        return "UserBean{" + "id=" + id + ", email=" + email + ", password=" + password + ", firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender + ", address=" + address + ", createDateTime=" + createDateTime + ", phone=" + phone + ", role=" + role + ", birthday=" + birthday + ", isActive=" + isActive + ", image=" + image + ", centerID=" + centerID + ", price=" + price + '}';
    }
    
    private String firstName;
    private String lastName;
    private String gender;
    private String address;
    private String createDateTime;
    private int phone;
    private String role;
    private String birthday;
    private boolean isActive;
    private String image;
    private String centerID;
    private int price;

    public UserBean() {
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        if (address == null) {
            return "";
        } else {
            return address;
        }

    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(String createDateTime) {
        this.createDateTime = createDateTime;
    }

    public int getPhone() {
        if (phone == 0) {
            return 0;
        } else {
            return phone;
        }
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getBirthday() {
        if (birthday == null) {
            return "";
        } else {
            return birthday;
        }
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getImage() {
        if (image == null) {
            return "";
        } else {
            return image;
        }
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCenterID() {
        return centerID;
    }

    public void setCenterID(String centerID) {
        this.centerID = centerID;
    }

}
