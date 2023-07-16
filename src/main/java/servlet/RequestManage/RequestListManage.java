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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import model.RequestCreateTour;

/**
 *
 * @author DELL
 */
public class RequestListManage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            AccountDTO acc = (AccountDTO) session.getAttribute("acc");
            if (acc != null) {
                RequestDAO dao = new RequestDAO(DbCon.getConnection());

                List<RequestCreateTour> requestList = dao.getAllRequests();
//            RequestDAO dao = new RequestDAO(DbCon.getConnection());
//            RequestCreateTour t = dao.getRequestById(requestId);

                request.getServletContext().setAttribute("requestList", requestList);
                request.getRequestDispatcher("requestList.jsp").forward(request, response);
            } else {
                response.sendRedirect("Login");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RequestListManage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RequestListManage.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
