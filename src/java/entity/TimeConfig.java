/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalTime;

/**
 *
 * @author My Computer
 */
public class TimeConfig {
    private int id;
    private String configName;
    private LocalTime startHour;
    private LocalTime endHour;

    public TimeConfig() {
    }
    
    

    public TimeConfig(int id, String configName, LocalTime startHour, LocalTime endHour) {
        this.id = id;
        this.configName = configName;
        this.startHour = startHour;
        this.endHour = endHour;
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

    public LocalTime getStartHour() {
        return startHour;
    }

    public void setStartHour(LocalTime startHour) {
        this.startHour = startHour;
    }

    public LocalTime getEndHour() {
        return endHour;
    }

    public void setEndHour(LocalTime endHour) {
        this.endHour = endHour;
    }
    
    
}
