/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.RequestManage;

import Email.EmailConfirmRequest;
import connection.DbCon;
import dao.RequestDAO;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MailContent;
import model.RequestCreateTour;

/**
 *
 * @author DELL
 */
public class ConfirmRequestServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmRequestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmRequestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String requestId = request.getParameter("rid");
            RequestDAO dao = new RequestDAO(DbCon.getConnection());
            RequestCreateTour t = dao.getRequestById(requestId);
            request.setAttribute("detail", t);
            request.getRequestDispatcher("requestConfirm.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConfirmRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String requestId = request.getParameter("rid");
            RequestDAO dao = new RequestDAO(DbCon.getConnection());
            RequestCreateTour t = dao.getRequestById(requestId);

            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String email = request.getParameter("email");

            MailContent confirm = new MailContent();

            confirm.setTitle(title);
            confirm.setContent(content);
            confirm.setEmail(email);
            EmailConfirmRequest.sendConfirmCreateTour(email, confirm, t);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConfirmRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(ConfirmRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
