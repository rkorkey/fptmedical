/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.UserDAO;
import entity.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import utils.Const;


/**
 *
 * @author Lenovo
 */
@WebServlet(name = "ShowBlog", urlPatterns = {Const.ADMIN_SHOW_BLOG_URL})
public class ShowBlogServlet extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
     
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        BlogDAO dao = new BlogDAO();
        req.setAttribute("blog", dao.getAllBlog());
        req.getRequestDispatcher("showBlog.jsp").forward(req, res);
    }

    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
        
    }

    

}
