/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Duy
 */

import entity.DayOfWeek;
import entity.TimeManagement;
import entity.TimeSession;
import entity.User;
import java.util.ArrayList;
import java.sql.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author codevn
 */
public class TimeSessionDAO extends DBContext {

    UserDAO userDao = new UserDAO();
    TimeManagementDAO timeManagementDAO = new TimeManagementDAO();
    DayOfWeekDAO dayOfWeekDAO = new DayOfWeekDAO();
    public static void main(String[] args) {
        UserDAO userDao = new UserDAO();
    TimeManagementDAO timeManagementDAO = new TimeManagementDAO();
    DayOfWeekDAO dayOfWeekDAO = new DayOfWeekDAO();
        TimeSessionDAO tsd = new TimeSessionDAO();
        
       
        tsd.addTimeSession(new TimeSession(timeManagementDAO.getTimeManagementById(2), userDao.getUserById(1), dayOfWeekDAO.getTimeManagementById(1)));
        System.out.println(new TimeSession(timeManagementDAO.getTimeManagementById(2), userDao.getUserById(1), dayOfWeekDAO.getTimeManagementById(1)).toString());
    }

    public ArrayList<TimeSession> getAllTimeSession() {
        ArrayList<TimeSession> timeSessions = new ArrayList<>();
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from TimeSession;");
            while (rs.next()) {
                int timeSessionId = rs.getInt("timeSessionId");
                int timeManagementId = rs.getInt("timeManagementSessionId");
                TimeManagement timeManagement = timeManagementDAO.getTimeManagementById(timeManagementId);
                int userId = rs.getInt("userId");
                User user = userDao.getUserById(userId);
                int dayOfWeekId = rs.getInt("dayOfWeekId");
                DayOfWeek dayOfWeek = dayOfWeekDAO.getTimeManagementById(dayOfWeekId);
                TimeSession timeSession = new TimeSession(timeSessionId, timeManagement, user, dayOfWeek);
                timeSessions.add(timeSession);
            }
            st.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return timeSessions;
    }

    public TimeSession getTimeSessionById(int timeSessionId) {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from timeSession where timeSessionId = ?");
            ps.setInt(1, timeSessionId);
            ResultSet rs = ps.executeQuery();
            rs.next();
              timeSessionId = rs.getInt("timeSessionId");
                int timeManagementId = rs.getInt("timeManagementSessionId");
                TimeManagement timeManagement = timeManagementDAO.getTimeManagementById(timeManagementId);
                int userId = rs.getInt("userId");
                User user = userDao.getUserById(userId);
                int dayOfWeekId = rs.getInt("dayOfWeekId");
                DayOfWeek dayOfWeek = dayOfWeekDAO.getTimeManagementById(dayOfWeekId);
                TimeSession timeSession = new TimeSession(timeSessionId, timeManagement, user, dayOfWeek);
           
            ps.close();
            return timeSession;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void addTimeSession(TimeSession timeSession) {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into timesession(timeManagementSessionId, userId, dayOfWeekId) values (?, ?, ?)");
            ps.setInt(1, timeSession.getTimeManagement().getTimeManagementId());
            ps.setInt(2, timeSession.getUser().getUserId());
            ps.setInt(3, timeSession.getDay().getDayOfWeekId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateTimeSession(TimeSession timeSession) {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("update TimeSession set timeManagementSessionId = ?, userId = ?, dayOfWeekId = ? where timeSessionId = ?");
            ps.setInt(1, timeSession.getTimeManagement().getTimeManagementId());
            ps.setInt(2, timeSession.getUser().getUserId());
            ps.setInt(3, timeSession.getDay().getDayOfWeekId());
            ps.setInt(4, timeSession.getTimeSessionId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteTimeSession(int timeSessionId){
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("delete from timeSession where timeSessionId = ?");
            ps.setInt(1, timeSessionId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

