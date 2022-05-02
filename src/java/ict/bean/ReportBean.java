/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author hhch0
 */
public class ReportBean implements Serializable {
    private String trainerID;
    private String trainerName;
    private String centerID;
    private String centerName;
    private String period;
    private int trainerIncome;
    private int centerIncome;
    private double trainerBookingRate;
    private double centerBookingRate;
    private String trainerBookings;
    private String centerBookings;
    private String customerID;
    private String customerName;
    private double customerBookingPrice;

    public ReportBean() {
    }

    public String getTrainerBookings() {
        return trainerBookings;
    }

    public void setTrainerBookings(String trainerBookings) {
        this.trainerBookings = trainerBookings;
    }

    public String getCenterBookings() {
        return centerBookings;
    }

    public void setCenterBookings(String centerBookings) {
        this.centerBookings = centerBookings;
    }

    public String getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(String trainerID) {
        this.trainerID = trainerID;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getCenterID() {
        return centerID;
    }

    public void setCenterID(String centerID) {
        this.centerID = centerID;
    }

    public String getCenterName() {
        return centerName;
    }

    public void setCenterName(String centerName) {
        this.centerName = centerName;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public int getTrainerIncome() {
        return trainerIncome;
    }

    public void setTrainerIncome(int trainerIncome) {
        this.trainerIncome = trainerIncome;
    }

    public int getCenterIncome() {
        return centerIncome;
    }

    public void setCenterIncome(int centerIncome) {
        this.centerIncome = centerIncome;
    }

    public double getTrainerBookingRate() {
        return trainerBookingRate;
    }

    public void setTrainerBookingRate(double trainerBookingRate) {
        this.trainerBookingRate = trainerBookingRate;
    }

    public double getCenterBookingRate() {
        return centerBookingRate;
    }

    public void setCenterBookingRate(double centerBookingRate) {
        this.centerBookingRate = centerBookingRate;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getCustomerBookingPrice() {
        return customerBookingPrice;
    }

    public void setCustomerBookingPrice(double customerBookingPrice) {
        this.customerBookingPrice = customerBookingPrice;
    }
    
    public String genYearlyBookingCSV(){
        return "";
    }
}
