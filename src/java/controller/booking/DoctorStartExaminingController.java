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
import dal.BookingMedicineDAO;
import dal.ConfigDAO;
import dal.MedicineDAO;
import dal.NotificationDAO;
import dto.BookingDTO;
import dto.BookingMedicineDTO;
import dto.NotificationDTO;
import entity.Medicine;
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
@WebServlet(name = "DoctorStartExaminingController", urlPatterns = {"/startExamining"})
public class DoctorStartExaminingController extends HttpServlet {
    private final MedicineDAO medicineDAO;
    private final BookingDAO bookingDAO;
    private final BookingMedicineDAO bookingMedicineDAO;
    private final Gson gson;
    private final ConfigDAO configDAO;
    private final NotificationDAO notificationDAO;
    
    public DoctorStartExaminingController(){
        medicineDAO = new MedicineDAO();
        bookingDAO = new BookingDAO();
        gson = new Gson();
        bookingMedicineDAO = new BookingMedicineDAO();
        configDAO = new ConfigDAO();
        notificationDAO = new NotificationDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIdRaw = request.getParameter("id");
        Integer bookingId = bookingIdRaw != null && !bookingIdRaw.isEmpty() ? Integer.parseInt(bookingIdRaw) : null;
        if(bookingId != null){
            BookingDTO bookingDTO = bookingDAO.getBookingById(bookingId);
            List<Medicine> medicines = medicineDAO.getAll();
            List<BookingMedicineDTO> bookingMedicines = bookingMedicineDAO.getMedicineByBookingId(bookingId);
            BookingDTO startExamining = new BookingDTO();
            double defaultPrice = configDAO.getConfigValue(ConfigEnum.Config.DEFAULT_PRICE.toString());
            startExamining.setId(bookingId);
            if(bookingDTO.getRealStartDate() == null){
                bookingDAO.updateBookingStartExamining(startExamining);
                /* Send Notification */
                NotificationDTO notificationDTO = new NotificationDTO();
                notificationDTO.setContent(Const.UPDATE_BOOKING_REQUEST_MESSAGE + bookingDTO.getStartDate().toString());
                notificationDTO.setLink(Const.CUSTOMER_VIEW_APPOINTMENT);
                notificationDTO.setToUserId(bookingDTO.getCustomerId());
                notificationDAO.insertNotification(notificationDTO);
            }
            /* End Notification */
            request.setAttribute("medicines", gson.toJson(medicines));
            request.setAttribute("bookingMedicines", gson.toJson(bookingMedicines));
            request.setAttribute("booking", bookingDTO);
            request.setAttribute("defaultPrice", defaultPrice);
        }
        request.getRequestDispatcher("Main Template/start-examining.jsp").forward(request, response);
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
