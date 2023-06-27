/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.BlogDAO;
import dao.FeedbackDao;
import dao.PlaceDao;
import dao.TourDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.Place;
import model.Tour;
import model.TourSchedule;

/**
 *
 * @author DELL
 */
public class SearchCondidion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchCondidion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchCondidion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            FeedbackDao feedbackDao = new FeedbackDao();
            PlaceDao p = new PlaceDao(DbCon.getConnection());

            String placeSearch = request.getParameter("placeSearch");
            String dateStartSearch = request.getParameter("dateStartSearch");
            String priceSearch = request.getParameter("priceSearch");
            float price = Float.parseFloat(priceSearch);
            
            List<Place> places = p.getAllPlaces();
            TourDao t = new TourDao(DbCon.getConnection());
            
            List<Tour> searchResults = t.searchTours(placeSearch, dateStartSearch, price);

            for (Tour tour : searchResults) {
                int tourId = tour.getTourId();
                int averageStar = feedbackDao.getAVGStar(tourId);
                tour.setAverageStar(averageStar);
            }
            
            
            request.setAttribute("listS", searchResults);
            request.getServletContext().setAttribute("myPlaces", places);

            request.getRequestDispatcher("searchResult.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchCondidion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchCondidion.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
