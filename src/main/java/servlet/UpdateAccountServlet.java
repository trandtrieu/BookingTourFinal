/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.AccountDTO;

/**
 *
 * @author DELL
 */
public class UpdateAccountServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String id = request.getParameter("aid");
        AccountDAO dao = new AccountDAO();
        AccountDTO account = dao.getAccountByID(id);
        request.setAttribute("a", account);
        request.getRequestDispatcher("UpdateAccount.jsp").forward(request, response);
        String historyUrl = (String) session.getAttribute("historyUrl");
        response.sendRedirect(historyUrl);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String aid = request.getParameter("id");
        String ausername = request.getParameter("username");
        String apassword = request.getParameter("password");
        String aemail = request.getParameter("email");
        String aphone = request.getParameter("phone");
        String arole = request.getParameter("role");
        String aavatar = request.getParameter("avatar");

        AccountDAO dao = new AccountDAO();
        dao.updateAccount(aid, ausername, apassword, aemail, aphone, arole, aavatar);
        response.sendRedirect("ListUser");
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
