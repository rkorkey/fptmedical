/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BlogDAO;
import entity.Blog;
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
@WebServlet(name = "BlogListController", urlPatterns = {Const.BLOG_LIST_URL})
public class BlogListController extends HttpServlet {
    private final int BLOGSPERPAGE = 6;
    private BlogDAO blogDAO;
    
    public BlogListController(){
        this.blogDAO = new BlogDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageNumber = (request.getParameter("pageNumber") == null) ? 0 : Integer.parseInt(request.getParameter("pageNumber"));
        int totalPage = 1;
        String query = request.getParameter("query") == null ? "" : request.getParameter("query");
        int totalBlogs = blogDAO.countBlogs(query);
        int pageRemain = ((totalBlogs % BLOGSPERPAGE) > 0) ? 1 : 0;
        totalPage = (totalBlogs / BLOGSPERPAGE) + pageRemain;
        int offset = pageNumber * BLOGSPERPAGE;
        int fetch = BLOGSPERPAGE;
        List<Blog> blogs = blogDAO.findBlogsPaging(offset , fetch , query);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("query", query);
        request.setAttribute("blogs", blogs);
        request.getRequestDispatcher("Main Template/blogs.jsp").forward(request, response);
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
