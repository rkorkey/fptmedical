/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import com.google.gson.Gson;
import dal.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
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
@WebServlet(name = "AdminDashboard", urlPatterns = {Const.ADMIN_DASHBOARD})
public class AdminDashboard extends HttpServlet {
    private final BookingDAO bookingDAO;
    private final Gson gson;
    
    public AdminDashboard(){
        this.bookingDAO = new BookingDAO();
        this.gson = new Gson();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Calendar calendar = Calendar.getInstance();
        int yearNumberOfBooking = calendar.get(Calendar.YEAR);
        int yearRevenue = calendar.get(Calendar.YEAR);
        try{
            yearNumberOfBooking = Integer.parseInt(request.getParameter("yearNumberOfBooking"));
            yearRevenue = Integer.parseInt(request.getParameter("yearRevenue"));
        }catch(NumberFormatException ex){
            try{
                yearRevenue = Integer.parseInt(request.getParameter("yearRevenue"));
            }catch(NumberFormatException ex1){}
        }
        HashMap<Integer , Long> revenues = bookingDAO.getRevenueByYear(yearRevenue);
        HashMap<Integer , HashMap<Integer , Integer>> bookings = bookingDAO.getNumberOfBookingRequestByStatusAndYear(yearNumberOfBooking);
        request.setAttribute("revenues", gson.toJson(revenues));
        request.setAttribute("bookings", gson.toJson(bookings));
        request.setAttribute("yearNumberOfBooking", yearNumberOfBooking);
        request.setAttribute("yearRevenue", yearRevenue);
        request.getRequestDispatcher("Main Template/admin-dashboard.jsp").forward(request, response);
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
