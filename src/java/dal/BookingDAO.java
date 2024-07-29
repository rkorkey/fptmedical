/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Enums.StatusEnum;
import dto.BookingDTO;
import dto.DoctorAppointmentDTO;
import dto.MyAppointmentDTO;
import entity.Booking;
import entity.Feedback;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My Computer
 */
public class BookingDAO extends DBContext {

    public List<Booking> getDoctorAndPatientBooking(int doctorId, int patientId, Date date) {
        List<Booking> bookings = new ArrayList<>();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        try {
            String sql = "SELECT s.id , s.[start_date] , s.[end_date] FROM Booking s WHERE s.doctor_id = ? "
                    + "and DATEPART(year , s.start_date) = ? AND DATEPART(month , s.start_date) = ? AND "
                    + "DATEPART(day , s.start_date) = ? AND s.status != ? ";
            String patientSql = " SELECT s.id , s.[start_date] , s.[end_date] FROM Booking s WHERE s.customer_id = ? "
                    + "and DATEPART(year , s.start_date) = ? AND DATEPART(month , s.start_date) = ? AND "
                    + "DATEPART(day , s.start_date) = ? AND s.status != ? ";
            String union = " UNION ALL ";
            String finalSql = sql + union + patientSql;
            int year = localDate.getYear();
            int month = localDate.getMonthValue();
            int day = localDate.getDayOfMonth();
            connection = getConnection();
            statement = connection.prepareStatement(finalSql);
            statement.setInt(1, doctorId);
            statement.setInt(2, year);
            statement.setInt(3, month);
            statement.setInt(4, day);
            statement.setInt(5, StatusEnum.BookingStatus.CANCELED.getValue());
            statement.setInt(6, patientId);
            statement.setInt(7, year);
            statement.setInt(8, month);
            statement.setInt(9, day);
            statement.setInt(10, StatusEnum.BookingStatus.CANCELED.getValue());
            ResultSet resultSet = statement.executeQuery();
            Booking booking;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                booking = new Booking();
                booking.setId(id);
                booking.setStartDate(startDate);
                booking.setEndDate(endDate);
                bookings.add(booking);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookings;
    }

    public List<BookingDTO> getAll() {
        List<BookingDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT s.id , s.start_date , s.end_date , s.create_date , s.note , s.status , "
                    + " s.real_start_date , s.real_end_date , s.total_price , doctor.name as doctorName , customer.name as customerName FROM Booking s "
                    + "LEFT JOIN [User] doctor ON s.doctor_id = doctor.[userId] "
                    + "LEFT JOIN [User] customer ON s.customer_id = customer.[userId] ";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            BookingDTO booking;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                Date createDate = resultSet.getTimestamp("create_date");
                Date realStartDate = resultSet.getTimestamp("real_start_date");
                Date realEndDate = resultSet.getTimestamp("real_end_date");
                double totalPrice = resultSet.getDouble("total_price");
                String customerName = resultSet.getString("customerName");
                String doctorName = resultSet.getString("doctorName");
                String note = resultSet.getString("note");
                int status = resultSet.getInt("status");
                String statusName = "";
                for (StatusEnum.BookingStatus s : StatusEnum.BookingStatus.values()) {
                    if (status == s.getValue()) {
                        statusName = s.name();
                        break;
                    }
                }
                booking = new BookingDTO(id, customerName, status, startDate, endDate, createDate, note);
                booking.setStatusName(statusName);
                booking.setTotalPrice(totalPrice);
                booking.setRealStartDate(realStartDate);
                booking.setRealEndDate(realEndDate);
                booking.setDoctorName(doctorName);
                list.add(booking);
            }
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<MyAppointmentDTO> getPatientAppointment(int customerId) {
        List<MyAppointmentDTO> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking s "
                    + "LEFT JOIN [User] doctor ON s.doctor_id = doctor.[userId] "
                    + "LEFT JOIN [Feedback] f ON s.feedback_id = f.[feedbackId] "
                    + "  WHERE s.customer_id = ? AND s.[status] != ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            statement.setInt(2, StatusEnum.BookingStatus.CANCELED.getValue());
            ResultSet resultSet = statement.executeQuery();
            MyAppointmentDTO booking;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                Date createDate = resultSet.getTimestamp("create_date");
                String doctorName = resultSet.getString("name");
                String note = resultSet.getString("note");
                int status = resultSet.getInt("status");
                String statusName = "";
                for (StatusEnum.BookingStatus s : StatusEnum.BookingStatus.values()) {
                    if (status == s.getValue()) {
                        statusName = s.name();
                        break;
                    }
                }
                Feedback feedback = new Feedback();
                feedback.setContent(resultSet.getString("content"));
                feedback.setId(resultSet.getInt("feedbackId"));
                feedback.setVote(resultSet.getInt("vote"));
                booking = new MyAppointmentDTO(id, doctorName, statusName, note, startDate, endDate, createDate);
                booking.setFeedback(feedback);
                bookings.add(booking);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookings;
    }

    public List<DoctorAppointmentDTO> getDoctorAppointment(int doctorId) {
        List<DoctorAppointmentDTO> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking s "
                    + "LEFT JOIN [User] customer ON s.customer_id = customer.[userId] "
                    + "LEFT JOIN [Feedback] f ON s.feedback_id = f.[feedbackId] "
                    + "  WHERE s.doctor_id = ? AND s.[status] != ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, doctorId);
            statement.setInt(2, StatusEnum.BookingStatus.CANCELED.getValue());
            ResultSet resultSet = statement.executeQuery();
            DoctorAppointmentDTO booking;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                Date createDate = resultSet.getTimestamp("create_date");
                String customerName = resultSet.getString("name");
                String note = resultSet.getString("note");
                int status = resultSet.getInt("status");
                String statusName = "";
                for (StatusEnum.BookingStatus s : StatusEnum.BookingStatus.values()) {
                    if (status == s.getValue()) {
                        statusName = s.name();
                        break;
                    }
                }
                Feedback feedback = new Feedback();
                feedback.setContent(resultSet.getString("content"));
                feedback.setId(resultSet.getInt("feedbackId"));
                feedback.setVote(resultSet.getInt("vote"));
                booking = new DoctorAppointmentDTO(id, customerName, statusName, note, startDate, endDate, createDate, status);
                booking.setFeedback(feedback);
                bookings.add(booking);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookings;
    }

    public BookingDTO getBookingById(int id) {
        try {
            String sql = "SELECT s.[start_date] , s.[end_date] , s.[create_date] , f.[content] , f.[feedbackId] , f.[vote],  "
                    + " customer.name , s.[real_start_date] ,  customer.[userId] as customerId , s.note , s.status , doctor.[userId] as doctorId FROM Booking s "
                    + "LEFT JOIN [User] customer ON s.customer_id = customer.[userId] "
                    + "LEFT JOIN [User] doctor ON s.doctor_id = doctor.[userId] "
                    + "LEFT JOIN [Feedback] f ON s.feedback_id = f.[feedbackId] "
                    + "  WHERE s.id = ? ";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            BookingDTO booking;
            if (resultSet.next()) {
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                Date createDate = resultSet.getTimestamp("create_date");
                Date realStartDate = resultSet.getTimestamp("real_start_date");
                String customerName = resultSet.getString("name");
                String note = resultSet.getString("note");
                int status = resultSet.getInt("status");
                int doctorId = resultSet.getInt("doctorId");
                int customerId = resultSet.getInt("customerId");
                String statusName = "";
                for (StatusEnum.BookingStatus s : StatusEnum.BookingStatus.values()) {
                    if (status == s.getValue()) {
                        statusName = s.name();
                        break;
                    }
                }
                Feedback feedback = new Feedback();
                feedback.setContent(resultSet.getString("content"));
                feedback.setId(resultSet.getInt("feedbackId"));
                feedback.setVote(resultSet.getInt("vote"));
                booking = new BookingDTO(id, customerName, status, startDate, endDate, createDate, note, doctorId, customerId , realStartDate); 
                booking.setFeedback(feedback);
                return booking;
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int insertBooking(BookingDTO bookingDTO) {
        try {
            String sql = "INSERT INTO [dbo].[Booking]\n"
                    + "           ([doctor_id]\n"
                    + "           ,[customer_id]\n"
                    + "           ,[status]\n"
                    + "           ,[note]\n"
                    + "           ,[start_date]\n"
                    + "           ,[end_date]\n"
                    + "           ,[create_date])\n"
                    + "     VALUES\n"
                    + "           (? , ? , ? , ? , ? , ? , ?)";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, bookingDTO.getDoctorId());
            statement.setInt(2, bookingDTO.getCustomerId());
            statement.setInt(3, StatusEnum.BookingStatus.PENDING.getValue());
            statement.setString(4, bookingDTO.getNote());
            statement.setTimestamp(5, new java.sql.Timestamp(bookingDTO.getStartDate().getTime()));
            statement.setTimestamp(6, new java.sql.Timestamp(bookingDTO.getEndDate().getTime()));
            statement.setTimestamp(7, new java.sql.Timestamp(new Date().getTime()));
            return statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateBookingStartExamining(BookingDTO bookingDTO) {
        try {
            String sql = "UPDATE [dbo].[Booking] SET [status] = ? , [real_start_date] = ? WHERE id = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, StatusEnum.BookingStatus.EXAMINING.getValue());
            statement.setTimestamp(2, new java.sql.Timestamp(new Date().getTime()));
            statement.setInt(3, bookingDTO.getId());
            return statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateBookingStatus(int bookingId, int status) {
        try {
            String sql = "UPDATE [dbo].[Booking] SET [status] = ?  WHERE id = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, bookingId);
            return statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateBookingEndExamining(BookingDTO bookingDTO) {
        try {
            String sql = "UPDATE [dbo].[Booking] SET [status] = ? , [real_end_date] = ? , [total_price] = ? WHERE id = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, StatusEnum.BookingStatus.DONE.getValue());
            statement.setTimestamp(2, new java.sql.Timestamp(new Date().getTime()));
            statement.setDouble(3, bookingDTO.getTotalPrice());
            statement.setInt(4, bookingDTO.getId());
            return statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public HashMap<Integer , Long> getRevenueByYear(int year) {
        HashMap<Integer , Long> map = new HashMap<>();
        try {
            String sql = "select DATEPART(MONTH , b.create_date) as month , SUM(b.total_price) as totalRevenue from Booking b \n"
                    + "WHERE DATEPART(year , b.create_date) = ?\n"
                    + "GROUP BY DATEPART(MONTH , b.create_date)\n"
                    + "ORDER BY DATEPART(MONTH , b.create_date)";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                long totalRevenue = rs.getInt("totalRevenue");
                int month = rs.getInt("month");
                map.put(month , totalRevenue);
            }
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return map;
    }
    
    public HashMap<Integer , HashMap<Integer , Integer>> getNumberOfBookingRequestByStatusAndYear(int year) {
        HashMap<Integer , HashMap<Integer , Integer>> result = new HashMap<>();
        try {
            String sql = "select DATEPART(MONTH , b.create_date) as month ,  b.[status] , COUNT(b.id) as numberOfBooking from Booking b \n"
                    + "WHERE DATEPART(year , b.create_date) = ?\n"
                    + "GROUP BY DATEPART(MONTH , b.create_date) , b.[status]\n"
                    + "ORDER BY DATEPART(MONTH , b.create_date) , b.[status]";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            HashMap<Integer , Integer> map = null;
            while(rs.next()){
                int monthValue = rs.getInt("month");
                boolean isContainInHash = result.containsKey(monthValue);
                if(!isContainInHash){
                    map = new HashMap<>();
                    result.put(monthValue, map);
                }
                int status = rs.getInt("status");
                int numberOfBooking = rs.getInt("numberOfBooking");
                map.put(status , numberOfBooking);
            }
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    
}
