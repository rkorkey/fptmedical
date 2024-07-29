/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.*;
import entity.DayOfWeek;
import entity.TimeManagement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Duy
 */
public class DayOfWeekDAO extends DBContext{
    public ArrayList<DayOfWeek> getAllDayOfWeek() {
        ArrayList<DayOfWeek> dayOfWeeks = new ArrayList<>();
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from DayOfWeeks;");
            while (rs.next()) {
                
                int dayOfWeekId = rs.getInt("dayOfWeekId");
                String dayOfWeekName= rs.getString("dayOfWeekName");
                
               
                DayOfWeek dayOfWeek = new DayOfWeek(dayOfWeekId, dayOfWeekName);
                dayOfWeeks.add(dayOfWeek);
            }
            st.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return dayOfWeeks;
    }    
    
    
    public DayOfWeek getTimeManagementById(int dayOfWeekId) {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from dayOfWeeks where dayOfWeekId = ?");
            ps.setInt(1, dayOfWeekId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            dayOfWeekId = rs.getInt("dayOfWeekId");
            String dayOfWeekName = rs.getString("dayOfWeekName");
            
            DayOfWeek dayOfWeek = new DayOfWeek(dayOfWeekId, dayOfWeekName);
            ps.close();
            return dayOfWeek;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
