/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author My Computer
 */
public class TimeConfigDTO {
    private int id;
    private String configName;
    private Date startHour;
    private Date endHour;
    private boolean isDuplicated;

    public TimeConfigDTO() {
    }

    public TimeConfigDTO(int id, String configName, Date startHour, Date endHour , boolean isDuplicated) {
        this.id = id;
        this.configName = configName;
        this.startHour = startHour;
        this.endHour = endHour;
        this.isDuplicated = isDuplicated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getConfigName() {
        return configName;
    }

    public void setConfigName(String configName) {
        this.configName = configName;
    }

    public Date getStartHour() {
        return startHour;
    }

    public void setStartHour(Date startHour) {
        this.startHour = startHour;
    }

    public Date getEndHour() {
        return endHour;
    }

    public void setEndHour(Date endHour) {
        this.endHour = endHour;
    }

    public boolean isIsDuplicated() {
        return isDuplicated;
    }

    public void setIsDuplicated(boolean isDuplicated) {
        this.isDuplicated = isDuplicated;
    }
    
    
    
}
