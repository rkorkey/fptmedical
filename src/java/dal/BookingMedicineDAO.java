/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dto.BookingMedicineDTO;
import dto.BookingMedicineInsertDTO;
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
public class BookingMedicineDAO extends DBContext {

    public int insertBookingMedicines(List<BookingMedicineInsertDTO> insertDTOs) {
        try {
            String preSql = "DELETE FROM [dbo].[Booking_Medicine] WHERE booking_id = ?";
            String sql = "INSERT INTO [dbo].[Booking_Medicine]\n"
                    + "           ([booking_id]\n"
                    + "           ,[medicine_id]\n"
                    + "           ,[price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[note])\n"
                    + "     VALUES(? , ? , ? , ? , ?)";
            connection = getConnection();
            statement = connection.prepareStatement(preSql);
            statement.setInt(1, insertDTOs.get(0).getBookingId());
            statement.executeUpdate();
            for (BookingMedicineInsertDTO insertDTO : insertDTOs) {
                statement = connection.prepareStatement(sql);
                statement.setInt(1, insertDTO.getBookingId());
                statement.setInt(2, insertDTO.getMedicineId());
                statement.setDouble(3, insertDTO.getPrice());
                statement.setInt(4, insertDTO.getQuantity());
                statement.setString(5, insertDTO.getNote());
                statement.executeUpdate();
            }
            return 1;
        } catch (Exception ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(BookingMedicineDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(BookingMedicineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<BookingMedicineDTO> getMedicineByBookingId(int bookingId) {
        List<BookingMedicineDTO> bookingMedicines = new ArrayList<>();
        try {
            String sql = "SELECT m.medicineId , m.description , m.medicineName , bm.quantity , bm.price , bm.note "
                    + " FROM Booking_Medicine bm LEFT JOIN Medicine m on bm.medicine_id = m.medicineId "
                    + " WHERE bm.booking_id = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, bookingId);
            ResultSet resultSet = statement.executeQuery();
            BookingMedicineDTO medicine;
            while(resultSet.next()){
                int medicineId = resultSet.getInt("medicineId");
                String description = resultSet.getNString("description");
                String medicineName = resultSet.getNString("medicineName");
                String note = resultSet.getNString("note");
                int quantity = resultSet.getInt("quantity");
                int price = resultSet.getInt("price");
                medicine = new BookingMedicineDTO(bookingId , medicineId, medicineName, description, price, quantity, note);
                bookingMedicines.add(medicine);
            }
        } catch (Exception ex) {
            Logger.getLogger(BookingMedicineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookingMedicines;
    }
}
