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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Tour;

/**
 *
 * @author DELL
 */
public class GetTourBySortHighToLow extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            TourDao t = new TourDao(DbCon.getConnection());
            RegionDao r = new RegionDao(DbCon.getConnection());
            PlaceDao p = new PlaceDao(DbCon.getConnection());
            FeedbackDao feedbackDao = new FeedbackDao();
            List<Tour> tours = t.getAllTourFromHighToLow();

            for (Tour tour : tours) {
                int tourId = tour.getTourId();
                int averageStar = feedbackDao.getAVGStar(tourId);
                tour.setAverageStar(averageStar);
            }
            int tourCount = t.getAllToursCount();
  List<Tour> filteredTours = new ArrayList<>();
            for (Tour tour : tours) {
                if (tour.getStatusTour() != true) {
                    filteredTours.add(tour);
                }
            }

            request.setAttribute("myTours", filteredTours);
            request.setAttribute("tourCount", tourCount);
            request.getRequestDispatcher("tourList.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListAllTour.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ListAllTour.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
