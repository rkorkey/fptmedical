/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import entity.DayOfWeek;
import entity.TimeManagement;
import entity.TimeSession;
import entity.User;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Duy
 */
public class TimeManagementDAO extends DBContext{
    public static void main(String[] args) {
        TimeManagementDAO tmd = new TimeManagementDAO();
        for (TimeManagement timeManagement : tmd.getAllTimeManagement()) {
            System.out.println(timeManagement.toString());
        }
    }
    public ArrayList<TimeManagement> getAllTimeManagement() {
        ArrayList<TimeManagement> timeManagements = new ArrayList<>();
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from TimeManagement;");
            while (rs.next()) {
                
                int timeManagementId = rs.getInt("timeManagementId");
                String timeStart = rs.getString("timeStart");
                String timeEnd = rs.getString("timeEnd");
               
                TimeManagement timeManagement = new TimeManagement(timeManagementId, timeStart, timeEnd);
                timeManagements.add(timeManagement);
            }
            st.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return timeManagements;
    }
    public TimeManagement getTimeManagementById(int timeManagementId) {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from timeManagement where timeManagementId = ?");
            ps.setInt(1, timeManagementId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            timeManagementId = rs.getInt("timeManagementId");
            String timeStart = rs.getString("timeStart");
            String timeEnd = rs.getString("timeEnd");
            TimeManagement timeManagement = new TimeManagement(timeManagementId, timeStart, timeEnd);
            ps.close();
            return timeManagement;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
  
}
