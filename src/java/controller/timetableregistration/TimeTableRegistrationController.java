/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.timetableregistration;

import com.google.gson.Gson;
import dal.DoctorScheduleDAO;
import dal.NotificationDAO;
import dal.TimeConfigDAO;
import dal.UserDAO;
import dto.NotificationDTO;
import dto.TimeConfigDTO;
import entity.DoctorSchedule;
import entity.TimeConfig;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Const;

/**
 *
 * @author My Computer
 */
@WebServlet(name = "TimeTableRegistrationController", urlPatterns = {"/timeTableRegistration"})
public class TimeTableRegistrationController extends HttpServlet {

    private final TimeConfigDAO timeConfigDAO;
    private final DoctorScheduleDAO doctorScheduleDAO;
    private final Gson gson;
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private final UserDAO userDAO;
    private final NotificationDAO notificationDAO;

    public TimeTableRegistrationController() {
        timeConfigDAO = new TimeConfigDAO();
        doctorScheduleDAO = new DoctorScheduleDAO();
        gson = new Gson();
        userDAO = new UserDAO();
        notificationDAO = new NotificationDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dateRaw = request.getParameter("date");
        Date date = new Date();
        try {
            if (dateRaw != null) {
                date = dateFormat.parse(dateRaw);
            }
        } catch (ParseException ex) {
            Logger.getLogger(TimeTableRegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = request.getSession();
        User doctor = (User) session.getAttribute("user");

        List<TimeConfig> timeConfigs = timeConfigDAO.getTimeConfigOrderByStartTimeAsc();
        List<TimeConfigDTO> dtos = new ArrayList<>();
        List<DoctorSchedule> schedulesByDate = doctorScheduleDAO.getDoctorScheduleIsNotCanceled(doctor.getUserId(), date);
        List<DoctorSchedule> schedules = doctorScheduleDAO.getDoctorSchedule(doctor.getUserId());
        for (TimeConfig timeConfig : timeConfigs) {
            Calendar startDate = Calendar.getInstance();
            startDate.setTime(date);
            startDate.set(Calendar.HOUR_OF_DAY, timeConfig.getStartHour().getHour());
            startDate.set(Calendar.MINUTE, timeConfig.getStartHour().getMinute());
            Calendar endDate = Calendar.getInstance();
            endDate.setTime(date);
            endDate.set(Calendar.HOUR_OF_DAY, timeConfig.getEndHour().getHour());
            endDate.set(Calendar.MINUTE, timeConfig.getEndHour().getMinute());
            boolean isDuplicated = isDuplicateSchedule(schedulesByDate, startDate.getTime(), endDate.getTime()) || startDate.getTime().compareTo(new Date()) <= 0;
            TimeConfigDTO dto = new TimeConfigDTO(timeConfig.getId(), timeConfig.getConfigName(), startDate.getTime(), endDate.getTime(), isDuplicated);
            dtos.add(dto);
        }
        request.setAttribute("slots", dtos);
        String formattedDate = dateFormat.format(date);
        String minDate = dateFormat.format(new Date());
        request.setAttribute("minDate", minDate);
        request.setAttribute("doctorSchedules", gson.toJson(schedules));
        request.setAttribute("date", formattedDate);

        request.getRequestDispatcher("Main Template/time-table-registration.jsp").forward(request, response);
    }

    boolean isDuplicateSchedule(List<DoctorSchedule> schedules, Date startDate, Date endDate) {
        if (schedules == null || schedules.isEmpty()) {
            return false;
        }
        for (DoctorSchedule doctorSchedule : schedules) {
            if (startDate.compareTo(doctorSchedule.getEndDate()) < 0
                    && endDate.compareTo(doctorSchedule.getStartDate()) > 0) {
                return true;
            }
        }
        return false;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Define the format pattern
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy");

        String startDateRaw = request.getParameter("startDate");
        String endDateRaw = request.getParameter("endDate");
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        if (startDateRaw != null && endDateRaw != null) {
                ZonedDateTime startDateZone = ZonedDateTime.parse(startDateRaw, formatter);
                startDate = startDateZone.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
                ZonedDateTime endDateZone = ZonedDateTime.parse(endDateRaw, formatter);
                endDate = endDateZone.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
        }
        if (startDate != null && endDate != null) {
            HttpSession session = request.getSession();
            User doctor = (User) session.getAttribute("user");
            DoctorSchedule schedule = new DoctorSchedule();
            schedule.setStartDate(Date.from(startDate.atZone(ZoneId.systemDefault()).toInstant()));
            schedule.setEndDate(Date.from(endDate.atZone(ZoneId.systemDefault()).toInstant()));
            schedule.setDoctor(doctor);
            int result = doctorScheduleDAO.insertDoctorSchedule(schedule);
            if (result != 0) {
                List<User> admins = userDAO.findAdmins();
                NotificationDTO notificationDTO = new NotificationDTO();
                notificationDTO.setContent(Const.NEW_DOCTOR_SCHEDULE_REQUEST_MESSAGE);
                notificationDTO.setLink(Const.ADMIN_VIEW_DOCTOR_SCHEDULE_URL);
                for (User admin : admins) {
                    notificationDTO.setToUserId(admin.getUserId());
                    notificationDAO.insertNotification(notificationDTO);
                }
            }
            response.getWriter().print(result);
            return;
        }
        response.getWriter().print(0);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
