/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dto.FeedbackDTO;
import entity.Feedback;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My Computer
 */
public class FeedbackDAO extends DBContext {

    public List<FeedbackDTO> getTop8LastFeedbacks() {
        List<FeedbackDTO> feedbacks = new ArrayList<>();
        try {
            String sql = "SELECT TOP 8 * FROM Feedback "
                    + "LEFT JOIN [Booking] b on Feedback.[feedbackId] = b.[feedback_id] "
                    + "LEFT JOIN [User] patient on b.[customer_id] = patient.userId "
                    + "ORDER BY Feedback.[feedbackId] desc";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            FeedbackDTO feedback;
            while (rs.next()) {
                feedback = new FeedbackDTO();
                feedback.setId(rs.getInt("feedbackId"));
                User patient = new User();
                feedback.setCustomerEmail(rs.getString("email"));
                feedback.setCustomerAvatar(rs.getString("avatar"));
                feedback.setContent(rs.getString("content"));
                feedbacks.add(feedback);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbacks;
    }
    
    public List<FeedbackDTO> getTop5LastFeedbacksByDoctorId(int doctorId){
        List<FeedbackDTO> feedbacks = new ArrayList<>();
        try {
            String sql = "SELECT TOP 5 f.[content] , f.[vote] , f.[create_date] , patient.[email] , patient.[avatar]  FROM [Feedback] f "
                    + "LEFT JOIN [Booking] b on f.[feedbackId] = b.[feedback_id] "
                    + "LEFT JOIN [User] patient on b.[customer_id] = patient.userId "
                    + "WHERE b.[doctor_id] = ? ORDER BY f.[create_date] desc";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, doctorId);
            ResultSet rs = statement.executeQuery();
            FeedbackDTO feedback;
            while (rs.next()) {
                feedback = new FeedbackDTO();
                feedback.setVote(rs.getInt("vote"));
                
                User patient = new User();
                feedback.setCustomerEmail(rs.getString("email"));
                feedback.setCustomerAvatar(rs.getString("avatar"));
                feedback.setCreateDate(rs.getTimestamp("create_date"));
                feedback.setContent(rs.getString("content"));
                feedbacks.add(feedback);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbacks;
    }
    
    public List<FeedbackDTO> getAll(){
        List<FeedbackDTO> feedbacks = new ArrayList<>();
        try {
            String sql = "SELECT f.[content] , f.[vote] , f.[create_date] , "
                    + "patient.[email] as patientEmail , doctor.[email] as doctorEmail FROM [Feedback] f "
                    + "LEFT JOIN [Booking] b on f.[feedbackId] = b.[feedback_id] "
                    + "LEFT JOIN [User] patient on b.[customer_id] = patient.userId "
                    + "LEFT JOIN [User] doctor on b.[doctor_id] = doctor.userId "
                    + "ORDER BY f.[create_date] desc";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            FeedbackDTO feedback;
            while (rs.next()) {
                feedback = new FeedbackDTO();
                feedback.setVote(rs.getInt("vote"));
                User patient = new User();
                feedback.setCustomerEmail(rs.getString("patientEmail"));
                feedback.setDoctorEmail(rs.getString("doctorEmail"));
                feedback.setCreateDate(rs.getTimestamp("create_date"));
                feedback.setContent(rs.getString("content"));
                feedbacks.add(feedback);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbacks;
    }

    public int insertFeedback(Feedback feedback, int bookingId) {
        try {
            String sql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([content]\n"
                    + "           ,[vote],[create_date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?,?)";
            connection = getConnection();
            statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setString(1, feedback.getContent());
            statement.setInt(2, feedback.getVote());
            statement.setTimestamp(3, new java.sql.Timestamp(new Date().getTime()));
            int result1 = statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            long generatedId = 0;
            if (rs.next()) {
                generatedId = rs.getLong(1);
            }
            String updateBookingSql = "UPDATE [dbo].[Booking]\n"
                    + "   SET [feedback_id] = ? WHERE [id] = ?";
            statement = connection.prepareStatement(updateBookingSql);
            statement.setLong(1, generatedId);
            statement.setInt(2, bookingId);
            int result2 = statement.executeUpdate();
            return result1 != 0 && result2 != 0 ? 1 : 0;
        } catch (Exception ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
