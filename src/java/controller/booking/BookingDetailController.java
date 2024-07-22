/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.booking;

import dal.BookingDAO;
import dal.BookingMedicineDAO;
import dto.BookingDTO;
import dto.BookingMedicineDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "BookingDetailController", urlPatterns = {Const.BOOKING_DETAIL})
public class BookingDetailController extends HttpServlet {
    private final BookingDAO bookingDAO;
    private final BookingMedicineDAO bookingMedicineDAO;
    
    public BookingDetailController(){
        bookingDAO = new BookingDAO();
        bookingMedicineDAO = new BookingMedicineDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIdRaw = request.getParameter("id");
        Integer bookingId = bookingIdRaw != null && !bookingIdRaw.isEmpty() ? Integer.parseInt(bookingIdRaw) : null;
        if(bookingId != null){
            List<BookingMedicineDTO> bookingMedicines = bookingMedicineDAO.getMedicineByBookingId(bookingId);
            BookingDTO bookingDTO = bookingDAO.getBookingById(bookingId);
            request.setAttribute("bookingMedicines", bookingMedicines);
            request.setAttribute("booking", bookingDTO);
        }
        request.getRequestDispatcher("Main Template/bookingDetail.jsp").forward(request, response);
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
