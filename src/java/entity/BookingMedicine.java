/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author My Computer
 */
public class BookingMedicine {
    private int id;
    private Booking booking;
    private Medicine medicine;
    private double price;
    private int quantity;
    private String note;

    public BookingMedicine() {
    }
    
    

    public BookingMedicine(int id, Booking booking, Medicine medicine, double price, int quantity, String note) {
        this.id = id;
        this.booking = booking;
        this.medicine = medicine;
        this.price = price;
        this.quantity = quantity;
        this.note = note;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Medicine getMedicine() {
        return medicine;
    }

    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
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
