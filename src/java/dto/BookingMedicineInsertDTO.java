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
public class BookingMedicineInsertDTO {
    private int bookingId;
    private int medicineId;
    private double price;
    private int quantity;
    private String note;

    public BookingMedicineInsertDTO() {
    }

    public BookingMedicineInsertDTO(int booking_id, int medicine_id, double price, int quantity, String note) {
        this.bookingId = booking_id;
        this.medicineId = medicine_id;
        this.price = price;
        this.quantity = quantity;
        this.note = note;
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
