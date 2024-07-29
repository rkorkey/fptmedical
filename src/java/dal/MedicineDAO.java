/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.Medicine;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My Computer
 */
public class MedicineDAO extends DBContext {

    public List<Medicine> getAll() {
        List<Medicine> medicines = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Medicine";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            Medicine medicine;
            while(resultSet.next()){
                int medicineId = resultSet.getInt("medicineId");
                String description = resultSet.getNString("description");
                String medicineName = resultSet.getNString("medicineName");
                int quantity = resultSet.getInt("quantity");
                int price = resultSet.getInt("price");
                medicine = new Medicine(medicineId, medicineName, description, quantity, price);
                medicines.add(medicine);
            }
        } catch (Exception ex) {
            Logger.getLogger(MedicineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return medicines;
    }
    
    public int updateMedicinesQuantity(List<Medicine> medicines){
        try {
            String sql = "UPDATE Medicine SET quantity = ? WHERE medicineId = ?";
            connection = getConnection();
            for(Medicine medicine : medicines){
                statement = connection.prepareStatement(sql);
                statement.setInt(1, medicine.getQuantity());
                statement.setInt(2, medicine.getMedicineId());
                statement.executeUpdate();
            }
            return 1;
        } catch (Exception ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(MedicineDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(MedicineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MedicineDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
}
