/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enums;

/**
 *
 * @author My Computer
 */
public class StatusEnum {
    public enum ScheduleStatus{
        PENDING(0) , CANCELED(1) , APPROVED(2);
        private final int value;

        private ScheduleStatus(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
        
    }
    
    public enum BookingStatus{
        PENDING(0) , CANCELED(1) , APPROVED(2) , DONE(3) , EXAMINING(4);
        private final int value;

        private BookingStatus(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
        
    }
}
