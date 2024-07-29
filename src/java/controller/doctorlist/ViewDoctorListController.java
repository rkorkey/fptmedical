/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.doctorlist;

import Enums.ConfigEnum;
import dal.ConfigDAO;
import dal.UserDAO;
import dto.DoctorCardDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author My Computer
 */
@WebServlet(name = "ViewDoctorListController", urlPatterns = {"/doctors"})
public class ViewDoctorListController extends HttpServlet {
    private final UserDAO userDAO;
    private final ConfigDAO configDAO;
    private final int DOCTORSPERPAGE = 6;
    public ViewDoctorListController(){
        userDAO = new UserDAO();
        configDAO = new ConfigDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageNumber = (request.getParameter("pageNumber") == null) ? 0 : Integer.parseInt(request.getParameter("pageNumber"));
        int totalPage = 1;
        String query = request.getParameter("query") == null ? "" : request.getParameter("query");
        int totalDoctors = userDAO.countDoctors(query);
        int pageRemain = ((totalDoctors % DOCTORSPERPAGE) > 0) ? 1 : 0;
        totalPage = (totalDoctors / DOCTORSPERPAGE) + pageRemain;
        int offset = pageNumber * DOCTORSPERPAGE;
        int fetch = DOCTORSPERPAGE;
        List<DoctorCardDto> doctors = userDAO.findDoctorsBasicInformation(offset , fetch , query);
        double defaultPrice = configDAO.getConfigValue(ConfigEnum.Config.DEFAULT_PRICE.toString());
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("query", query);
        request.setAttribute("defaultPrice", defaultPrice);
        
        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("Main Template/doctors.jsp").forward(request, response);
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
