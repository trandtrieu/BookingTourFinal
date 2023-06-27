/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.AccountDAO;
import dao.FeedbackDao;
import dao.GuideDao;
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
import model.GuideTour;
import model.TourSchedule;

/**
 *
 * @author DELL
 */
public class ListJobGuide extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        AccountDTO acc = (AccountDTO) session.getAttribute("acc");

        if (acc != null) {
            try {
                GuideDao g = new GuideDao(DbCon.getConnection());
                List<TourSchedule> job = g.getGuideJob(acc.getId());
                request.getServletContext().setAttribute("job", job);
                request.getRequestDispatcher("listJobGuide.jsp").forward(request, response);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ListJobGuide.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ListJobGuide.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("Login");
            return;
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
    }// </editor-fold>

}
