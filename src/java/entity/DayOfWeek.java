/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *a
 * @author Duy
 */
public class DayOfWeek {
      private int dayOfWeekId;
      private String dayOfWeekName;

    public DayOfWeek(int dayOfWeekId,String dayOfWeekName) {
        this.dayOfWeekId = dayOfWeekId;
        this.dayOfWeekName = dayOfWeekName;
    }

    public DayOfWeek() {
    }

    public int getDayOfWeekId() {
        return dayOfWeekId;
    }

    public void setDayOfWeekId(int dayOfWeekId) {
        this.dayOfWeekId = dayOfWeekId;
    }

    public String getDayOfWeekName() {
        return dayOfWeekName;
    }

    public void setDayOfWeekName(String dayOfWeekName) {
        this.dayOfWeekName = dayOfWeekName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DayOfWeek{");
        sb.append("dayOfWeekId=").append(dayOfWeekId);
        sb.append(", dayOfWeekName=").append(dayOfWeekName);
        sb.append('}');
        return sb.toString();
    }

  
    
    
}
