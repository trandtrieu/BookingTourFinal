/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.AccountDAO;
import dao.FeedbackDao;
import dao.GuideDao;
import dao.ListDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import model.BookTour;
import model.GuideTour;
import model.Tour;

/**
 *
 * @author DELL
 */
public class ListJobGuide extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        AccountDTO acc = (AccountDTO) session.getAttribute("acc");

        if (acc != null) {
            Connection con = null;
            try {
                con = DbCon.getConnection();
                GuideDao g = new GuideDao(con);
                List<Tour> job = g.getGuideJob(acc.getId());
                request.getServletContext().setAttribute("job", job);

                ListDao dao = new ListDao(con);
                String tid = request.getParameter("tid");
                if (tid != null && !tid.isEmpty()) {
                    int tourId = Integer.parseInt(tid);
                    List<BookTour> list = dao.getListOrder(tourId);
                    request.setAttribute("listH", list);
                }

                request.getRequestDispatcher("listJobGuide.jsp").forward(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ListJobGuide.class.getName()).log(Level.SEVERE, null, ex);
                // Handle the exceptions appropriately, e.g., display error message or redirect to an error page.
            }
        } else {
            response.sendRedirect("Login");
            return;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ListJobGuide.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ListJobGuide.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
