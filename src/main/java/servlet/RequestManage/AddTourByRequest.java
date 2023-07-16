/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.RequestManage;

import connection.DbCon;
import dao.GuideDao;
import dao.PlaceDao;
import dao.RegionDao;
import dao.RequestDAO;
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
import model.GuideTour;
import model.Place;
import model.Region;
import model.RequestCreateTour;

/**
 *
 * @author DELL
 */
public class AddTourByRequest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddTourByRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTourByRequest at " + request.getContextPath() + "</h1>");
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
            RegionDao r = new RegionDao(DbCon.getConnection());
            GuideDao g = new GuideDao(DbCon.getConnection());
            PlaceDao p = new PlaceDao(DbCon.getConnection());

            RequestCreateTour t = dao.getRequestById(requestId);

            List<Region> regions = r.getAllRegions();
            List<GuideTour> guides = g.getAllGuides();
            List<Place> places = p.getAllPlaces();

            request.getServletContext().setAttribute("myRegions", regions);
            request.getServletContext().setAttribute("myGuides", guides);
            request.getServletContext().setAttribute("myPlaces", places);
            request.setAttribute("detail", t);
            request.getRequestDispatcher("AddTourByRequest.jsp").forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddTourByRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddTourByRequest.class.getName()).log(Level.SEVERE, null, ex);
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
        dao.insertTourForGroup(tname, tprice, tdateStart, tdateEnd, tdetails, timage, tstatus, tguideId, tplaceId, tregionId);
//dao.insertTour(tname, tprice, tdateStart, tdateEnd, tdetails, timage);
        response.sendRedirect("ManagerTour");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
