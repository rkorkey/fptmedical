/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;


import dal.DoctorScheduleDAO;
import dal.NotificationDAO;
import dto.NotificationDTO;
import entity.DoctorSchedule;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateDoctorScheduleStatusController", urlPatterns = {"/updateDoctorScheduleStatus"})
public class UpdateDoctorScheduleStatusController extends HttpServlet {
    private final DoctorScheduleDAO doctorScheduleDAO;
    private final NotificationDAO notificationDAO;
    public UpdateDoctorScheduleStatusController(){
        this.doctorScheduleDAO = new DoctorScheduleDAO();
        this.notificationDAO = new NotificationDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        DoctorSchedule doctorSchedule  = doctorScheduleDAO.getDoctorScheduleById(id);
        NotificationDTO notificationDTO = new NotificationDTO();
        notificationDTO.setContent(Const.UPDATE_DOCTOR_SCHEDULE_REQUEST_MESSAGE + doctorSchedule.getStartDate().toString());
        notificationDTO.setLink(Const.DOCTOR_TIME_TABLE_REGISTRATION_URL);
        notificationDTO.setToUserId(doctorSchedule.getDoctor().getUserId());
        notificationDAO.insertNotification(notificationDTO);
        String contextPath = request.getContextPath();
        doctorScheduleDAO.updateScheduleStatus(id, status , user.getUserId());
        response.sendRedirect(contextPath + Const.ADMIN_VIEW_DOCTOR_SCHEDULE_URL);
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
        processRequest(request, response);
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
