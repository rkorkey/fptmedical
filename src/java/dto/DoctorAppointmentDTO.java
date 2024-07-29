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
public class DoctorAppointmentDTO {
    private int id;
    private String customerName;
    private int status;
    private String statusName;
    private String note;
    private Date startDate;
    private Date endDate;
    private Date createDate;
    private Feedback feedback;

    public DoctorAppointmentDTO() {
    }

    public DoctorAppointmentDTO(int id, String customerName, String statusName, String note, Date startDate, Date endDate , Date createDate , int status) {
        this.id = id;
        this.customerName = customerName;
        this.statusName = statusName;
        this.note = note;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.createDate = createDate;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }
    
    
}
