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
public class CenterBookingBean implements Serializable {
    private String id;
    private String centerID;
    private String customerID;
    private String startDate;
    private String startTime;
    private double price;
    private boolean isHandled;
    private String handledBy;
    private String handledDateTime;
    private String trainerBookingID;
    private boolean isApproved;
    private String createDateTime;
    private TrainerBookingBean trainerBooking;

    public TrainerBookingBean getTrainerBooking() {
        return trainerBooking;
    }

    public void setTrainerBooking(TrainerBookingBean trainerBooking) {
        this.trainerBooking = trainerBooking;
    }

    public CenterBookingBean() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCenterID() {
        return centerID;
    }

    public void setCenterID(String centerID) {
        this.centerID = centerID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isIsHandled() {
        return isHandled;
    }

    public void setIsHandled(boolean isHandled) {
        this.isHandled = isHandled;
    }

    public String getHandledBy() {
        return handledBy;
    }

    public void setHandledBy(String handledBy) {
        this.handledBy = handledBy;
    }

    public String getHandledDateTime() {
        return handledDateTime;
    }

    public void setHandledDateTime(String handledDateTime) {
        this.handledDateTime = handledDateTime;
    }

    public String getTrainerBookingID() {
        return trainerBookingID;
    }

    public void setTrainerBookingID(String trainerBookingID) {
        this.trainerBookingID = trainerBookingID;
    }

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public String getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(String createDateTime) {
        this.createDateTime = createDateTime;
    }
    
    
    
    
    
    
}
