/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author Melo
 */
public class CenterPriceBean implements Serializable {

    private String id;
    private String centerID;
    private int year;
    private int price;

    public CenterPriceBean() {
    }

    public String getId() {
        if (id == null) {
            return "";
        } else {
            return id;
        }
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCenterID() {
        if (centerID == null) {
            return "";
        } else {
            return centerID;
        }
    }

    public void setCenterID(String centerID) {
        this.centerID = centerID;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
