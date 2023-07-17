/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.RequestManage;

import connection.DbCon;
import dao.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.RequestCreateTour;

/**
 *
 * @author DELL
 */
public class UpdateStatusRequest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            String historyUrl = (String) session.getAttribute("historyUrl");

            String requestId = request.getParameter("rid");
            RequestDAO dao = new RequestDAO(DbCon.getConnection());
            RequestCreateTour t = dao.getRequestById(requestId);
//            dao.updateTourStatus(t);
            response.sendRedirect(historyUrl);

        } catch (SQLException ex) {
            Logger.getLogger(UpdateStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
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
            request.getRequestDispatcher("updateStatusRequest.jsp").forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RequestDAO dao = new RequestDAO(DbCon.getConnection());
            String id = request.getParameter("id");

            String status = request.getParameter("status");
            dao.updateRequestStatus(status, id);
            response.sendRedirect("RequestListManage");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
