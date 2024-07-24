/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DayOfWeekDAO;
import dal.TimeManagementDAO;
import dal.TimeSessionDAO;
import dal.UserDAO;
import entity.DayOfWeek;
import entity.TimeManagement;
import entity.TimeSession;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static jdk.nashorn.internal.objects.Global.load;

/**
 *
 * @author Duy
 */
public class TimeSessionServlet extends HttpServlet {

    TimeSessionDAO timeSessionDAO = new TimeSessionDAO();
    UserDAO userDao = new UserDAO();
    DayOfWeekDAO dayOfWeekDAO = new DayOfWeekDAO();
    TimeManagementDAO timeManagementDAO = new TimeManagementDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TimeSessionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TimeSessionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String action = request.getParameter("command");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteLichLamViec(request, response);
                break;
            case "add":
                addLichLamViec(request, response);
                break;
            case "update":
                updateLichLamViec(request, response);
                break;
            case "list":
                showListtoUpdate(request, response);
                break;
            case "loadToUpdate":
                loadtoUpdate(request, response);
                break;
            case "loadToAdd":
                loadToAdd(request, response);
                break;
            default:
                showListtoUpdate(request, response);
                break;

        }
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

 

    private void deleteLichLamViec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String timeSessionIdStr = request.getParameter("timeSessionId");
        int timeSessionId = Integer.parseInt(timeSessionIdStr);
        timeSessionDAO.deleteTimeSession(timeSessionId);
        showListtoUpdate(request, response);
    }

    private void addLichLamViec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String dayOfWeekIdStr = request.getParameter("dayOfWeekId");
        int dayOfWeekId = Integer.parseInt(dayOfWeekIdStr);
        DayOfWeek dayOfWeek = dayOfWeekDAO.getTimeManagementById(dayOfWeekId);
        String timeManagementIdStr = request.getParameter("timeManagementId");
        int timeManagementId = Integer.parseInt(timeManagementIdStr);
        TimeManagement timeManagement = timeManagementDAO.getTimeManagementById(timeManagementId);
        String userIdStr = request.getParameter("userId");
        int userId = Integer.parseInt(userIdStr);
        User user = userDao.getUserById(userId);
        TimeSession timeSession = new TimeSession(timeManagement, user, dayOfWeek);
        timeSessionDAO.addTimeSession(timeSession);
        showListtoUpdate(request, response);
    }

    private void updateLichLamViec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String timeSessionIdStr = request.getParameter("timeSessionId");
        int timeSessionId = Integer.parseInt(timeSessionIdStr);
        String timeManagementIdStr = request.getParameter("timeManagementId");
        int timeManagementId = Integer.parseInt(timeManagementIdStr);
        TimeManagement timeManagement = timeManagementDAO.getTimeManagementById(timeManagementId);
        String userIdStr = request.getParameter("userId");
        int userId = Integer.parseInt(userIdStr);
        User user = userDao.getUserById(userId);
        String dayOfWeekIdStr = request.getParameter("dayOfWeekId");
        int dayOfWeekId = Integer.parseInt(dayOfWeekIdStr);
        DayOfWeek dayOfWeek = dayOfWeekDAO.getTimeManagementById(dayOfWeekId);
        TimeSession timeSession = new TimeSession(timeSessionId, timeManagement, user, dayOfWeek);
        timeSessionDAO.updateTimeSession(timeSession);
        showListtoUpdate(request, response);
    }

    private void showListtoUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TimeSession> timeSessions = timeSessionDAO.getAllTimeSession();
        List<DayOfWeek> dayOfWeeks = dayOfWeekDAO.getAllDayOfWeek();
        request.setAttribute("timeSessions", timeSessions);
        request.setAttribute("dayOfWeeks", dayOfWeeks);
        request.getRequestDispatcher("Main Template/edit-time-table.jsp").forward(request, response);
    }

    private void loadToAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userDao.findAll();
        List<DayOfWeek> dayOfWeeks = dayOfWeekDAO.getAllDayOfWeek();
        List<TimeManagement> timeManagements = timeManagementDAO.getAllTimeManagement();
        request.setAttribute("users", users);
        request.setAttribute("dayOfWeeks", dayOfWeeks);
        request.setAttribute("timeManagements", timeManagements);
        request.getRequestDispatcher("Main Template/add-time-table.jsp").forward(request, response);
    }

    private void loadtoUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String timeSessionIdStr = request.getParameter("timeSessionId");
        int timeSessionId = Integer.parseInt(timeSessionIdStr);
        TimeSession timeSession = timeSessionDAO.getTimeSessionById(timeSessionId);
        List<DayOfWeek> dayOfWeeks = dayOfWeekDAO.getAllDayOfWeek();
        List<TimeManagement> timeManagements = timeManagementDAO.getAllTimeManagement();
        request.setAttribute("timeSession", timeSession);
        request.setAttribute("dayOfWeeksUpdate", dayOfWeeks);
        request.setAttribute("timeManagementsUpdate", timeManagements);
        request.getRequestDispatcher("Main Template/edit-one-time-table.jsp").forward(request, response);
    }
}
