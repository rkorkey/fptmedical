/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.booking;

import com.google.gson.Gson;
import dal.BookingDAO;
import dal.BookingMedicineDAO;
import dal.MedicineDAO;
import dal.NotificationDAO;
import dto.BookingDTO;
import dto.BookingMedicineInsertDTO;
import dto.NotificationDTO;
import entity.Medicine;
import java.io.IOException;
import java.lang.reflect.Type;
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
@WebServlet(name = "DoctorEndExaminingController", urlPatterns = {"/endExamining"})
public class DoctorEndExaminingController extends HttpServlet {

    private final MedicineDAO medicineDAO;
    private final BookingDAO bookingDAO;
    private final BookingMedicineDAO bookingMedicineDAO;
    private final Gson gson;
    private final NotificationDAO notificationDAO;

    public DoctorEndExaminingController() {
        this.medicineDAO = new MedicineDAO();
        this.bookingDAO = new BookingDAO();
        this.bookingMedicineDAO = new BookingMedicineDAO();
        gson = new Gson();
        notificationDAO = new NotificationDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String bookingIdRaw = request.getParameter("bookingId");
            String totalPriceRaw = request.getParameter("totalPrice");
            String bookingMedicinesRaw = request.getParameter("bookingMedicines");
            String medicinesRaw = request.getParameter("medicines");
            Type listMedicineType = new com.google.gson.reflect.TypeToken<List<Medicine>>() {
            }.getType();
            Type listBookingMedicineType = new com.google.gson.reflect.TypeToken<List<BookingMedicineInsertDTO>>() {
            }.getType();
            List<BookingMedicineInsertDTO> bookingMedicines = gson.fromJson(bookingMedicinesRaw, listBookingMedicineType);
            List<Medicine> medicines = gson.fromJson(medicinesRaw, listMedicineType);
            Double price = totalPriceRaw != null && !totalPriceRaw.isEmpty() ? Double.parseDouble(totalPriceRaw) : null;
            Integer bookingId = bookingIdRaw != null && !bookingIdRaw.isEmpty() ? Integer.parseInt(bookingIdRaw) : null;
            if (price != null && bookingMedicines != null && medicines != null && bookingId != null) {
                BookingDTO bookingDTO = new BookingDTO();
                bookingDTO.setTotalPrice(price);
                bookingDTO.setId(bookingId);
                int result1 = medicineDAO.updateMedicinesQuantity(medicines);
                int result2 = bookingDAO.updateBookingEndExamining(bookingDTO);
                int result3 = bookingMedicineDAO.insertBookingMedicines(bookingMedicines);
                if (result1 != 0 && result2 != 0 && result3 != 0) {
                    bookingDTO = bookingDAO.getBookingById(bookingId);
                    /* Send Notification */
                    NotificationDTO notificationDTO = new NotificationDTO();
                    notificationDTO.setContent(Const.UPDATE_BOOKING_REQUEST_MESSAGE + bookingDTO.getStartDate().toString());
                    notificationDTO.setLink(Const.CUSTOMER_VIEW_APPOINTMENT);
                    notificationDTO.setToUserId(bookingDTO.getCustomerId());
                    notificationDAO.insertNotification(notificationDTO);
                    /* End Notification */
                    response.getWriter().print(1);
                    return;
                }
            }
        } catch (Exception exception) {

        }
        response.getWriter().print(0);
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
