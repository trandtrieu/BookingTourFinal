/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.FeedbackDao;
import dao.PlaceDao;
import dao.RegionDao;
import dao.TourDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Tour;

/**
 *
 * @author DELL
 */
public class ListAllTour extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            TourDao t = new TourDao(DbCon.getConnection());
            RegionDao r = new RegionDao(DbCon.getConnection());
            PlaceDao p = new PlaceDao(DbCon.getConnection());
            FeedbackDao feedbackDao = new FeedbackDao();
            List<Tour> tours = t.getAllTours();

            for (Tour tour : tours) {
                int tourId = tour.getTourId();
                int averageStar = feedbackDao.getAVGStar(tourId);
                tour.setAverageStar(averageStar);
            }
            int tourCount = t.getAllToursCount();

            request.getServletContext().setAttribute("myTours", tours);
            request.setAttribute("tourCount", tourCount);
            request.getRequestDispatcher("tourList.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListAllTour.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ListAllTour.class.getName()).log(Level.SEVERE, null, ex);
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
