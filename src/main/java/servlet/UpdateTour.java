/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlet;

import dao.TourDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tour;

/**
 *
 * @author DELL
 */
public class UpdateTour extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateTour</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateTour at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String tourId = request.getParameter("tid");
        TourDao dao = new TourDao();
        Tour tour = dao.getTourByIdd(tourId);
        request.setAttribute("tt", tour);
        request.getRequestDispatcher("UpdateManager.jsp").forward(request, response);
        
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String ttourId = request.getParameter("id");
        String ttourName = request.getParameter("name");
        String tprice = request.getParameter("price");
        String tdateStart = request.getParameter("dateStart");
        String tdateEnd = request.getParameter("dateEnd");
        String tdetailTour = request.getParameter("details");
        String timageTour = request.getParameter("image");
        String tstatusTour = request.getParameter("status");
        String tplaceId = request.getParameter("placeId");
        String tregionId = request.getParameter("regionId");
        String tguideId = request.getParameter("guideId");
        
        TourDao dao = new TourDao();
        dao.updateTour(ttourId, ttourName, tprice, tdateStart, tdateEnd, tdetailTour, timageTour, tstatusTour, tplaceId, tregionId, tguideId);
        response.sendRedirect("ManagerTour");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}