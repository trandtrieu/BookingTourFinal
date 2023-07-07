/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.GuideDao;
import dao.PlaceDao;
import dao.RegionDao;
import dao.TourDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import model.GuideTour;
import model.Place;
import model.Region;
import model.Tour;

/**
 *
 * @author DELL
 */
public class AddTourServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        HttpSession session = request.getSession();
        AccountDTO acc = (AccountDTO) session.getAttribute("acc");

        response.setContentType("text/html;charset=UTF-8");

        if (acc != null) {
            TourDao t = new TourDao(DbCon.getConnection());
            RegionDao r = new RegionDao(DbCon.getConnection());
            GuideDao g = new GuideDao(DbCon.getConnection());
            PlaceDao p = new PlaceDao(DbCon.getConnection());

            List<Tour> tours = t.getAllTours();
            List<Region> regions = r.getAllRegions();
            List<GuideTour> guides = g.getAllGuides();

            List<Place> places = p.getAllPlaces();
            request.getServletContext().setAttribute("myTours", tours);
            request.getServletContext().setAttribute("myRegions", regions);
            request.getServletContext().setAttribute("myGuides", guides);
            request.getServletContext().setAttribute("myPlaces", places);

            request.getRequestDispatcher("AddManager.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login");

        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddTourServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddTourServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tname = request.getParameter("name");
        String tprice = request.getParameter("price");
        String tdateStart = request.getParameter("dateStart");
        String tdateEnd = request.getParameter("dateEnd");
        String tdetails = request.getParameter("details");
        String timage = request.getParameter("image");
        String tstatus = request.getParameter("status");
        String tplaceId = request.getParameter("placeId");
        //        String tplaceName = request.getParameter("placeName");
        String tregionId = request.getParameter("regionId");
        //        String tregionName = request.getParameter("regionName");
        String tguideId = request.getParameter("guideId");
//    String tguideName = request.getParameter("guideName");
        TourDao dao = new TourDao();
        dao.insertTour(tname, tprice, tdateStart, tdateEnd, tdetails, timage, tstatus, tguideId, tplaceId, tregionId);
//dao.insertTour(tname, tprice, tdateStart, tdateEnd, tdetails, timage);
        response.sendRedirect("ManagerTour");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
