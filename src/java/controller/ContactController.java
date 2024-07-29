/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.NotificationDAO;
import dal.UserDAO;
import dto.NotificationDTO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Const;

/**
 *
 * @author My Computer
 */
@WebServlet(name = "ContactController", urlPatterns = {Const.CONTACT_URL})
public class ContactController extends HttpServlet {

    private final NotificationDAO notificationDAO;
    private final UserDAO userDAO;
    public ContactController(){
        this.notificationDAO = new NotificationDAO();
        this.userDAO = new UserDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Main Template/contact.jsp").forward(request, response);
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

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        NotificationDTO notificationDTO = new NotificationDTO();
        notificationDTO.setContent(Const.NEW_CONTACT_MESSAGE + email + " , phone : " + phone + " , message : "+message);
        for (User u : userDAO.findAdmins()) {
            notificationDTO.setToUserId(u.getUserId());
            notificationDTO.setLink(Const.ADMIN_VIEW_ALL_APPOINTMENT_URL);
            notificationDAO.insertNotification(notificationDTO);
        }
        response.sendRedirect(request.getContextPath() + Const.CONTACT_URL);
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
