/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import Enums.UserRoleEnum;
import java.util.HashMap;

/**
 *
 * @author My Computer
 */
public class Const {
    /* ADMIN URL */
    public static final String ADMIN_CREATE_DOCTOR_URL = "/createDoctor";
    public static final String ADMIN_VIEW_ALL_APPOINTMENT_URL = "/viewAppointment";
    public static final String ADMIN_VIEW_DOCTOR_SCHEDULE_URL = "/viewDoctorSchedule";
    public static final String ADMIN_DASHBOARD = "/dashboard";
    public static final String ADMIN_BLOG_URL = "/BlogServlet";
    public static final String ADMIN_SHOW_BLOG_URL = "/showBlog";
    public static final String ADMIN_UPDATE_BLOG = "/update-blog";
    public static final String ADMIN_VIEW_LIST_FEEDBACK_URL = "/viewFeedback";
    /* DOCTOR URL */
    public static final String DOCTOR_VIEW_APPOINTMENT_URL = "/doctorAppointment";
    public static final String DOCTOR_TIME_TABLE_REGISTRATION_URL = "/timeTableRegistration";
    public static final String DOCTOR_START_EXAMINING_URL = "/startExamining";
    public static final String DOCTOR_END_EXAMINING_URL = "/endExamining";
    /* CUSTOMER URL */
    public static final String BOOKING_URL = "/appointment";
    public static final String CUSTOMER_VIEW_APPOINTMENT = "/myAppointment";
    public static final String GIVE_FEEDBACK_URL = "/giveFeedback";
    
    /* PUBLIC URL */
    public static final String LOGIN_URL = "/LoginServlet";
    public static final String CONTACT_URL = "/contact";
    public static final String BLOG_LIST_URL = "/blogList";
    public static final String BLOG_DETAIL_URL = "/blogDetail";
            
    public static final String BOOKING_DETAIL = "/bookingDetail";
    public static final String UPDATE_BOOKING_STATUS_URL = "/updateBookingStatus";
    public static final String UPDATE_DOCTOR_SCHEDULE_STATUS_URL = "/updateDoctorScheduleStatus";
    
    /* NOTIFICATION MESSAGE */
    public static final String NEW_BOOKING_REQUEST_MESSAGE = "New pending booking request was send";
    public static final String NEW_DOCTOR_SCHEDULE_REQUEST_MESSAGE = "New doctor schedule request was send";
    public static final String UPDATE_BOOKING_REQUEST_MESSAGE = "There's new update on booking request at ";
    public static final String UPDATE_DOCTOR_SCHEDULE_REQUEST_MESSAGE = "There's new update on schedule at ";
    public static final String NEW_CONTACT_MESSAGE = "New contact from ";
    
    public static final String[] ADMIN_URL = new String[]{ADMIN_CREATE_DOCTOR_URL , ADMIN_VIEW_ALL_APPOINTMENT_URL , BOOKING_DETAIL ,
        UPDATE_BOOKING_STATUS_URL , UPDATE_DOCTOR_SCHEDULE_STATUS_URL , ADMIN_UPDATE_BLOG , ADMIN_VIEW_LIST_FEEDBACK_URL ,
        ADMIN_VIEW_DOCTOR_SCHEDULE_URL , ADMIN_DASHBOARD , ADMIN_BLOG_URL , ADMIN_SHOW_BLOG_URL};
    public static final String[] DOCTOR_URL = new String[]{DOCTOR_VIEW_APPOINTMENT_URL , DOCTOR_TIME_TABLE_REGISTRATION_URL ,
    DOCTOR_START_EXAMINING_URL , DOCTOR_END_EXAMINING_URL , BOOKING_DETAIL};
    public static final String[] CUSTOMER_URL = new String[]{BOOKING_URL , CUSTOMER_VIEW_APPOINTMENT , BOOKING_DETAIL , UPDATE_BOOKING_STATUS_URL , GIVE_FEEDBACK_URL};
    public static final HashMap<String , String[]> URL ;
    static {
        URL = new HashMap<>();
        // Initialize the map with desired key-value pairs
        URL.put(UserRoleEnum.UserRole.Admin.toString(), ADMIN_URL);
        URL.put(UserRoleEnum.UserRole.Customer.toString(), CUSTOMER_URL);
        URL.put(UserRoleEnum.UserRole.Professor.toString(), DOCTOR_URL);
    }
    
    public static final int TOP_FEEDBACK = 8;
}
