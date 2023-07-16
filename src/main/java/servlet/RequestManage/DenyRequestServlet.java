/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.RequestManage;

import Email.EmailDeny;
import Email.EmailRequest;
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
import model.AccountDTO;
import model.MailContent;
import model.RequestCreateTour;
import model.Tour;

/**
 *
 * @author DELL
 */
public class DenyRequestServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DenyRequestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DenyRequestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AccountDTO acc = (AccountDTO) request.getSession().getAttribute("acc");
            if (acc != null) {
                String requestId = request.getParameter("rid");
                RequestDAO dao = new RequestDAO(DbCon.getConnection());
                RequestCreateTour t = dao.getRequestById(requestId);

                request.setAttribute("detail", t);
                request.getRequestDispatcher("requestDeny.jsp").forward(request, response);
            } else {
                response.sendRedirect("Login");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DenyRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DenyRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AccountDTO acc = (AccountDTO) request.getSession().getAttribute("acc");
            if (acc != null) {
                String requestId = request.getParameter("rid");
                RequestDAO dao = new RequestDAO(DbCon.getConnection());
                RequestCreateTour t = dao.getRequestById(requestId);
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String email = request.getParameter("email");
                MailContent deny = new MailContent();
                deny.setTitle(title);
                deny.setContent(content);
                deny.setEmail(email);
                EmailDeny.sendDenyCreateTour(email, deny, t);
                request.getRequestDispatcher("RequestListManage").forward(request, response);
            } else {
                response.sendRedirect("Login");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DenyRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DenyRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(DenyRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
