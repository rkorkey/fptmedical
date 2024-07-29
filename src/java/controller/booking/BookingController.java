/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.booking;

import Enums.ConfigEnum;
import Enums.StatusEnum;
import com.google.gson.Gson;
import dal.BookingDAO;
import dal.ConfigDAO;
import dal.DoctorScheduleDAO;
import dal.MajorDAO;
import dal.NotificationDAO;
import dal.TimeConfigDAO;
import dal.UserDAO;
import dto.BookingDTO;
import dto.DoctorCardDto;
import dto.NotificationDTO;
import dto.SlotDTO;
import entity.Booking;
import entity.DoctorSchedule;
import entity.Major;
import entity.TimeConfig;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "BookingController", urlPatterns = {"/appointment"})
public class BookingController extends HttpServlet {

    private final ConfigDAO configDAO;
    private final TimeConfigDAO timeConfigDAO;
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private final BookingDAO bookingDAO;
    private final DoctorScheduleDAO doctorScheduleDAO;
    private final Gson gson;
    private final MajorDAO majorDAO;
    private final UserDAO userDAO;
    private final NotificationDAO notificationDAO;

    public BookingController() {
        this.configDAO = new ConfigDAO();
        this.timeConfigDAO = new TimeConfigDAO();
        bookingDAO = new BookingDAO();
        doctorScheduleDAO = new DoctorScheduleDAO();
        gson = new Gson();
        majorDAO = new MajorDAO();
        userDAO = new UserDAO();
        notificationDAO = new NotificationDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String majorIdRaw = request.getParameter("majorId");
        String doctorIdRaw = request.getParameter("doctorId");
        String dateRaw = request.getParameter("date");
        Date date = new Date();
        if (dateRaw != null) {
            try {
                date = dateFormat.parse(dateRaw);
            } catch (ParseException ex) {
                Logger.getLogger(BookingController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        Integer doctorId = doctorIdRaw == null || doctorIdRaw.length() == 0 ? null : Integer.parseInt(doctorIdRaw);
        Integer majorId = majorIdRaw == null || majorIdRaw.length() == 0 ? null : Integer.parseInt(majorIdRaw);

        List<Major> majors = majorDAO.getAll();
        List<DoctorCardDto> doctors = null;
        if (majorId != null) {
            doctors = userDAO.findDoctorsByMajor(majorId);
        }
        if (doctorId != null) {
            HttpSession session = request.getSession();
            User patient = (User) session.getAttribute("user");
            User doctor = userDAO.getUserById(doctorId);
            double durationConfig = configDAO.getConfigValue(ConfigEnum.Config.TIME_DURATION.name());
            List<TimeConfig> timeConfigs = timeConfigDAO.getTimeConfigOrderByStartTimeAsc();
            LocalTime startTime = null;
            LocalTime endTime = null;
            if (timeConfigs != null && !timeConfigs.isEmpty()) {
                startTime = timeConfigs.get(0).getStartHour();
                endTime = timeConfigs.get(timeConfigs.size() - 1).getEndHour();
            }
            List<SlotDTO> slots = generateListSlot(startTime, endTime, date, durationConfig);
            List<Booking> bookings = bookingDAO.getDoctorAndPatientBooking(doctorId,patient.getUserId(),date);
            List<DoctorSchedule> schedules = doctorScheduleDAO.getDoctorSchedule(doctorId, date, StatusEnum.ScheduleStatus.APPROVED.getValue());
            Boolean[] availableSlots = returnAvailableSlots(slots, bookings, schedules);
            request.setAttribute("duration", durationConfig);
            request.setAttribute("starTime", startTime);
            request.setAttribute("endTime", endTime);
            request.setAttribute("doctor", doctor);
            request.setAttribute("availableSlots", gson.toJson(availableSlots));
        }

        String minDate = dateFormat.format(new Date());
        request.setAttribute("minDate", minDate);
        request.setAttribute("date", dateFormat.format(date));
        request.setAttribute("majors", majors);
        request.setAttribute("doctors", doctors);
        request.setAttribute("doctorId", doctorId);
        request.setAttribute("majorId", majorId);
        request.getRequestDispatcher("Main Template/appointment.jsp").forward(request, response);
    }

    public Boolean[] returnAvailableSlots(List<SlotDTO> slots, List<Booking> bookings, List<DoctorSchedule> schedules) {
        if (slots == null || slots.isEmpty()) {
            return null;
        }
        Boolean[] result = new Boolean[slots.size()];
        int count = 0;
        for (SlotDTO slot : slots) {
            boolean isInSchedule = false;
            for (DoctorSchedule doctorSchedule : schedules) {
                if (compareDates(slot.getStartDate(), doctorSchedule.getStartDate()) >= 0
                        && compareDates(slot.getEndDate(), doctorSchedule.getEndDate()) <= 0) {
                    isInSchedule = true;
                    break;
                }
            }
            boolean isInBooking = false;
            for (Booking booking : bookings) {
                if (compareDates(slot.getStartDate(), booking.getEndDate()) < 0
                        && compareDates(slot.getEndDate(), booking.getStartDate()) > 0) {
                    isInBooking = true;
                    break;
                }
            }
            boolean isOverCurrentDate = compareDates(slot.getStartDate(), new Date()) > 0;
            if (isInSchedule && !isInBooking && isOverCurrentDate) {
                result[count] = true;
            } else {
                result[count] = false;
            }
            count++;
        }
        return result;
    }

    public static int compareDates(Date date1, Date date2) {
        LocalDateTime localDate1 = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        LocalDateTime localDate2 = date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        if (localDate1.getYear() != localDate2.getYear()) {
            return localDate1.getYear() - localDate2.getYear();
        }
        if (localDate1.getMonthValue() != localDate2.getMonthValue()) {
            return localDate1.getMonthValue() - localDate2.getMonthValue();
        }
        if (localDate1.getDayOfMonth() != localDate2.getDayOfMonth()) {
            return localDate1.getDayOfMonth() - localDate2.getDayOfMonth();
        }
        if (localDate1.getHour() != localDate2.getHour()) {
            return localDate1.getHour() - localDate2.getHour();
        }
        if (localDate1.getMinute() != localDate2.getMinute()) {
            return localDate1.getMinute() - localDate2.getMinute();
        }
        return 0;
    }

    public List<SlotDTO> generateListSlot(LocalTime startTime, LocalTime endTime, Date date, double duration) {
        if (startTime == null || endTime == null) {
            return null;
        }
        List<SlotDTO> slots = new ArrayList<>();
        Date temp = new Date();
        temp.setTime(date.getTime());
        temp.setHours(startTime.getHour());
        temp.setMinutes(startTime.getMinute());
        while (temp.getHours() < endTime.getHour() || (temp.getHours() == endTime.getHour() && temp.getMinutes() < endTime.getMinute())) {
            SlotDTO slot = new SlotDTO();
            Date temp1 = new Date();
            temp1.setTime(temp.getTime());
            temp1.setSeconds(0);
            slot.setStartDate(temp1);
            temp.setMinutes(temp.getMinutes() + (int) duration);
            Date temp2 = new Date();
            temp2.setTime(temp.getTime());
            temp2.setSeconds(0);
            slot.setEndDate(temp2);
            slots.add(slot);
        }
        return slots;
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
        String format = "EEE MMM dd yyyy HH:mm";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        String doctorIdRaw = request.getParameter("doctorId");
        String note = request.getParameter("note");

        String startDateRaw = request.getParameter("startDate");
        String endDateRaw = request.getParameter("endDate");
        Date startDate = null;
        Date endDate = null;
        if (startDateRaw != null && endDateRaw != null) {
            try {
                startDate = sdf.parse(startDateRaw);
                endDate = sdf.parse(endDateRaw);
            } catch (ParseException ex) {
                Logger.getLogger(BookingController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (startDate != null && endDate != null) {
            HttpSession session = request.getSession();
            User customer = (User) session.getAttribute("user");
            Integer doctorId = doctorIdRaw == null || doctorIdRaw.length() == 0 ? null : Integer.parseInt(doctorIdRaw);
            BookingDTO bookingDTO = new BookingDTO(0, doctorId, customer.getUserId(), 0, note, startDate, endDate, null, null);
            int result = bookingDAO.insertBooking(bookingDTO);
            if (result != 0) {
                List<User> admins = userDAO.findAdmins();
                NotificationDTO notificationDTO = new NotificationDTO();
                notificationDTO.setContent(Const.NEW_BOOKING_REQUEST_MESSAGE);
                notificationDTO.setLink(Const.DOCTOR_VIEW_APPOINTMENT_URL);
                notificationDTO.setToUserId(doctorId);
                notificationDAO.insertNotification(notificationDTO);
                notificationDTO.setLink(Const.ADMIN_VIEW_ALL_APPOINTMENT_URL);
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
