/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author My Computer
 */
public class BookingMedicineDTO {
    private int bookingId;
    private int medicineId;
    private String medicineName;
    private String description;
    private double price;
    private int quantity;
    private String note;

    public BookingMedicineDTO() {
    }
    
    

    public BookingMedicineDTO(int bookingId , int medicineId, String medicineName, String description, double price, int quantity, String note) {
        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.note = note;
        this.bookingId = bookingId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    
    

    public int getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}
