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
    private String centerName;
    private String bookingUserName;
    private String status;

    public String getStatus() {
        if(isCancelled){
            return "Cancelled";
        } else {
            if(!isHandled){
                return "Waiting";
            } else {
                if(isApproved){
                    return "Approved";
                } else {
                    return "Rejected";
                }
            }
        }
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBookingUserName() {
        return bookingUserName;
    }

    public void setBookingUserName(String bookingUserName) {
        this.bookingUserName = bookingUserName;
    }

    public String getCenterName() {
        return centerName;
    }

    public void setCenterName(String centerName) {
        this.centerName = centerName;
    }
    private String customerID;
    private String startDate;
    private String startTime;
    private double price;
    private boolean isHandled;
    private boolean isCancelled;

    public boolean isIsCancelled() {
        return isCancelled;
    }

    public void setIsCancelled(boolean isCancelled) {
        this.isCancelled = isCancelled;
    }
    private String handledBy;
    private String handledDateTime;
    private String trainerBookingID;
    private boolean isApproved;
    private boolean isDeleted;

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
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
        if(handledBy==null){
            return "";
        }
        return handledBy;
    }

    public void setHandledBy(String handledBy) {
        this.handledBy = handledBy;
    }

    public String getHandledDateTime() {
        if(handledDateTime==null){
            return "";
        }
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
