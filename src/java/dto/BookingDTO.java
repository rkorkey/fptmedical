/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import entity.Feedback;
import java.util.Date;

/**
 *
 * @author My Computer
 */
public class BookingDTO {
    private int id;
    private int doctorId;
    private int customerId;
    private String doctorName;
    private String customerName;
    private int status;
    private String statusName;
    private String note;
    private Date startDate;
    private Date endDate;
    private Date createDate;
    private Date realStartDate;
    private Date realEndDate;
    private Feedback feedback;
    private double totalPrice;

    public BookingDTO() {
    }

    public BookingDTO(int id, int doctorId, int customerId, int status, String note, Date startDate, Date endDate , Date realStartDate , Date realEndDate) {
        this.id = id;
        this.doctorId = doctorId;
        this.customerId = customerId;
        this.status = status;
        this.note = note;
        this.startDate = startDate;
        this.endDate = endDate;
        this.realEndDate = realEndDate;
        this.realStartDate = realStartDate;
    }

    public BookingDTO(int id, String customerName, int status, Date startDate, Date endDate , Date createDate , String note) {
        this.id = id;
        this.customerName = customerName;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createDate = createDate;
        this.note = note;
    }
    
    public BookingDTO(int id, String customerName, int status, Date startDate, Date endDate , Date createDate , String note , int doctorId , int customerId) {
        this.id = id;
        this.customerName = customerName;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createDate = createDate;
        this.note = note;
        this.doctorId = doctorId;
        this.customerId = customerId;
    }
    
    public BookingDTO(int id, String customerName, int status, Date startDate, Date endDate , Date createDate , String note , int doctorId , int customerId , Date realStartDate) {
        this.id = id;
        this.customerName = customerName;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createDate = createDate;
        this.note = note;
        this.doctorId = doctorId;
        this.customerId = customerId;
        this.realStartDate = realStartDate;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }
    

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getRealStartDate() {
        return realStartDate;
    }

    public void setRealStartDate(Date realStartDate) {
        this.realStartDate = realStartDate;
    }

    public Date getRealEndDate() {
        return realEndDate;
    }

    public void setRealEndDate(Date realEndDate) {
        this.realEndDate = realEndDate;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }
    
    
    
    
}
