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
public class Medicine {
    private int medicineId;
    private String medicineName;
    private String description;
    private int quantity;
    private int price;

    public Medicine() {
    }

    public Medicine(int medicineId, String medicineName, String description, int quantity, int price) {
        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
