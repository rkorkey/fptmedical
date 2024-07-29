/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.booking;

import com.google.gson.Gson;
import dal.BookingDAO;
import dto.DoctorAppointmentDTO;
import entity.User;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "DoctorAppointmentController", urlPatterns = {Const.DOCTOR_VIEW_APPOINTMENT_URL})
public class DoctorAppointmentController extends HttpServlet {

    private final BookingDAO bookingDAO;
    private final Gson gson;

    public DoctorAppointmentController() {
        bookingDAO = new BookingDAO();
        gson = new Gson();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User doctor = (User) session.getAttribute("user");
        if (doctor != null) {
            List<DoctorAppointmentDTO> bookings = bookingDAO.getDoctorAppointment(doctor.getUserId());
            request.setAttribute("bookings", gson.toJson(bookings));
        }
        request.getRequestDispatcher("Main Template/doctor-appointment.jsp").forward(request, response);
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
