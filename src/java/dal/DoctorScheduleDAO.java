/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Enums.StatusEnum;
import entity.DoctorSchedule;
import entity.User;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My Computer
 */
public class DoctorScheduleDAO extends DBContext {

    public List<DoctorSchedule> getDoctorSchedule(int doctorId, Date date, int statusValue) {
        List<DoctorSchedule> schedules = new ArrayList<>();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        try {
            String sql = "SELECT * FROM DoctorSchedule s WHERE s.doctor_id = ? "
                    + "and DATEPART(year , s.start_date) = ? AND DATEPART(month , s.start_date) = ? AND "
                    + "DATEPART(day , s.start_date) = ? AND s.status = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, doctorId);
            int year = localDate.getYear();
            int month = localDate.getMonthValue();
            int day = localDate.getDayOfMonth();
            statement.setInt(2, year);
            statement.setInt(3, month);
            statement.setInt(4, day);
            statement.setInt(5, statusValue);
            ResultSet resultSet = statement.executeQuery();
            DoctorSchedule doctorSchedule;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                doctorSchedule = new DoctorSchedule();
                doctorSchedule.setId(id);
                doctorSchedule.setStartDate(startDate);
                doctorSchedule.setEndDate(endDate);
                schedules.add(doctorSchedule);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
    }

    public List<DoctorSchedule> getAllDoctorSchedule() {
        List<DoctorSchedule> schedules = new ArrayList<>();
        try {
            String sql = "SELECT d.id , d.start_date , d.end_date , d.[status] , u.name FROM DoctorSchedule d LEFT JOIN [User] u on d.doctor_id = u.userId";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            DoctorSchedule doctorSchedule;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                int status = resultSet.getInt("status");
                User doctor = new User();
                doctor.setName(resultSet.getString("name"));
                doctorSchedule = new DoctorSchedule();
                doctorSchedule.setId(id);
                doctorSchedule.setStartDate(startDate);
                doctorSchedule.setEndDate(endDate);
                doctorSchedule.setStatus(status);
                doctorSchedule.setDoctor(doctor);
                schedules.add(doctorSchedule);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
    }

    public int updateScheduleStatus(int scheduleId, int status , int approverId) {
        try {
            String sql = "UPDATE [dbo].[DoctorSchedule]\n"
                    + "   SET [status] = ? , [approver_id] = ? WHERE [id] = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, approverId);
            statement.setInt(3, scheduleId);
            return statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<DoctorSchedule> getDoctorScheduleIsNotCanceled(int doctorId, Date date) {
        List<DoctorSchedule> schedules = new ArrayList<>();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        try {
            String sql = "SELECT * FROM DoctorSchedule s WHERE s.doctor_id = ? "
                    + "and DATEPART(year , s.start_date) = ? AND DATEPART(month , s.start_date) = ? AND "
                    + "DATEPART(day , s.start_date) = ? AND s.status != ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, doctorId);
            int year = localDate.getYear();
            int month = localDate.getMonthValue();
            int day = localDate.getDayOfMonth();
            statement.setInt(2, year);
            statement.setInt(3, month);
            statement.setInt(4, day);
            statement.setInt(5, StatusEnum.ScheduleStatus.CANCELED.getValue());
            ResultSet resultSet = statement.executeQuery();
            DoctorSchedule doctorSchedule;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                doctorSchedule = new DoctorSchedule();
                doctorSchedule.setId(id);
                doctorSchedule.setStartDate(startDate);
                doctorSchedule.setEndDate(endDate);
                schedules.add(doctorSchedule);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
    }

    public List<DoctorSchedule> getDoctorSchedule(int doctorId) {
        List<DoctorSchedule> schedules = new ArrayList<>();
        try {
            String sql = "SELECT * FROM DoctorSchedule s WHERE s.doctor_id = ? AND s.[status] != ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, doctorId);
            statement.setInt(2, StatusEnum.ScheduleStatus.CANCELED.getValue());
            ResultSet resultSet = statement.executeQuery();
            DoctorSchedule doctorSchedule;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                doctorSchedule = new DoctorSchedule();
                doctorSchedule.setId(id);
                doctorSchedule.setStartDate(startDate);
                doctorSchedule.setEndDate(endDate);
                doctorSchedule.setStatus(resultSet.getInt("status"));
                schedules.add(doctorSchedule);
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
    }
    
    public DoctorSchedule getDoctorScheduleById(int id) {
        try {
            String sql = "SELECT * FROM DoctorSchedule s WHERE s.id = ?";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            DoctorSchedule doctorSchedule;
            while (resultSet.next()) {
                Date startDate = resultSet.getTimestamp("start_date");
                Date endDate = resultSet.getTimestamp("end_date");
                User doctor = new User();
                doctor.setUserId(resultSet.getInt("doctor_id"));
                doctorSchedule = new DoctorSchedule();
                doctorSchedule.setId(id);
                doctorSchedule.setStartDate(startDate);
                doctorSchedule.setEndDate(endDate);
                doctorSchedule.setStatus(resultSet.getInt("status"));
                doctorSchedule.setDoctor(doctor);
                return doctorSchedule;
            }
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int insertDoctorSchedule(DoctorSchedule schedule) {
        try {
            String sql = "INSERT INTO [dbo].[DoctorSchedule]\n"
                    + "           ([start_date]\n"
                    + "           ,[end_date]\n"
                    + "           ,[doctor_id]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (? , ? , ? , ?)";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setTimestamp(1, new java.sql.Timestamp(schedule.getStartDate().getTime()));
            statement.setTimestamp(2, new java.sql.Timestamp(schedule.getEndDate().getTime()));
            statement.setInt(3, schedule.getDoctor().getUserId());
            statement.setInt(4, StatusEnum.ScheduleStatus.PENDING.getValue());
            return statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DoctorScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
