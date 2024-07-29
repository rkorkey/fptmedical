/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Duy
 */
public class TimeManagement {
    private int timeManagementId;
    private String timeStart;
    private String timeEnd;

    public TimeManagement(int timeManagementId, String timeStart, String timeEnd) {
        this.timeManagementId = timeManagementId;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public int getTimeManagementId() {
        return timeManagementId;
    }

    public void setTimeManagementId(int timeManagementId) {
        this.timeManagementId = timeManagementId;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("TimeManagement{");
        sb.append("timeManagementId=").append(timeManagementId);
        sb.append(", timeStart=").append(timeStart);
        sb.append(", timeEnd=").append(timeEnd);
        sb.append('}');
        return sb.toString();
    }
    
}
