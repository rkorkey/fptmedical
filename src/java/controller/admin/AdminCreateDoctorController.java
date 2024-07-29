/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import com.google.gson.Gson;
import dal.MajorDAO;
import dal.UserDAO;
import dto.DoctorCardDto;
import entity.Major;
import entity.User;
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
@WebServlet(name = "AdminCreateDoctor", urlPatterns = {"/createDoctor"})
public class AdminCreateDoctorController extends HttpServlet {
    private final UserDAO userDAO;
    private final MajorDAO majorDAO;
    private final Gson gson;
    
    public AdminCreateDoctorController(){
        userDAO = new UserDAO();
        gson = new Gson();
        majorDAO = new MajorDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<DoctorCardDto> doctors = userDAO.findDoctors();
        request.setAttribute("doctors", gson.toJson(doctors));
        List<Major> majors = majorDAO.getAll();
        
        request.setAttribute("majors", majors);
        request.getRequestDispatcher("Main Template/doctor-management.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String avatar = request.getParameter("avatar");
        String majorIdRaw = request.getParameter("majorId");
        Integer majorId = majorIdRaw != null && !majorIdRaw.isEmpty() ? Integer.parseInt(majorIdRaw) : null ;
        User user = new User(0, majorId, null, address, avatar, name, phone, email, password, null);
        int result = userDAO.createDdoctor(user);
        response.getWriter().print(result);
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
