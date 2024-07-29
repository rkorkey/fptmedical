/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import entity.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.WebServlet;
import utils.Const;


/**
 *
 * @author Lenovo
 */
@WebServlet(name = "BlogServlet", urlPatterns = {Const.ADMIN_BLOG_URL})
public class BlogServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/Blog.jsp").forward(req, res);
    }

    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        System.out.println(user);
        
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        
        Date date1 = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String date = dateFormat.format(date1);
        
        BlogDAO dao = new BlogDAO();
        dao.createBlog(user.getUserId(), title, content, date, user.getName());
        res.sendRedirect("ShowBlogServlet");

    }

    
    

}
