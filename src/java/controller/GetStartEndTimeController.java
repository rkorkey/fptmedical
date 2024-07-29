/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dal.TimeConfigDAO;
import entity.TimeConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
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
@WebServlet(name = "GetStartEndTimeController", urlPatterns = {"/GetStartEndTimeController"})
public class GetStartEndTimeController extends HttpServlet {

    private final TimeConfigDAO timeConfigDAO;
    private final Gson gson;
    
    public GetStartEndTimeController(){
        this.timeConfigDAO = new TimeConfigDAO();
        this.gson = new Gson();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TimeConfig> timeConfigs = timeConfigDAO.getTimeConfigOrderByStartTimeAsc();
        LocalTime startDate = timeConfigs.get(0).getStartHour();
        LocalTime endDate = timeConfigs.get(timeConfigs.size() - 1).getEndHour();
        response.getWriter().print(startDate.toString() + "&" + endDate.toString());
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
