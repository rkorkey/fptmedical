/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Duy
 */
public class TimeSession {
     private int timeSessionId;
    private TimeManagement timeManagement;
    private User user;
    private DayOfWeek day;
    
      public TimeSession( TimeManagement timeManagement, User user, DayOfWeek day) {
       
        this.timeManagement = timeManagement;
        this.user = user;
        this.day = day;
    }
    public TimeSession(int timeSessionId, TimeManagement timeManagement, User user, DayOfWeek day) {
        this.timeSessionId = timeSessionId;
        this.timeManagement = timeManagement;
        this.user = user;
        this.day = day;
    }

    public TimeSession() {
    }

    public int getTimeSessionId() {
        return timeSessionId;
    }

    public void setTimeSessionId(int timeSessionId) {
        this.timeSessionId = timeSessionId;
    }

    public TimeManagement getTimeManagement() {
        return timeManagement;
    }

    public void setTimeManagement(TimeManagement timeManagement) {
        this.timeManagement = timeManagement;
    }

    
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public DayOfWeek getDay() {
        return day;
    }

    public void setDay(DayOfWeek day) {
        this.day = day;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("TimeSession{");
        sb.append("timeSessionId=").append(timeSessionId);
        sb.append(", timeManagement=").append(timeManagement);
        sb.append(", user=").append(user);
        sb.append(", day=").append(day);
        sb.append('}');
        return sb.toString();
    }

   
}
