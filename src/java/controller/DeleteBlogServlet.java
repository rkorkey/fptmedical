/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import entity.Blog;
import entity.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Lenovo
 */
public class DeleteBlogServlet extends HttpServlet {

    
   

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String id1 = req.getParameter("id");
        int id = Integer.parseInt(id1);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        BlogDAO dao = new BlogDAO();
        Blog blog = dao.findbyId(id);
        if(blog.getUserId() == user.getUserId()){
    
        dao.deleteBlog(id);
        
        }
        res.sendRedirect("ShowBlogServlet");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    

}
