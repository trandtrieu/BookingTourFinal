/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Email.EmailRequest;
import connection.DbCon;
import dao.RequestDAO;
import dao.TourDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import Email.EmailSender;
import jakarta.mail.MessagingException;
import model.Tour;
import model.RequestCreateTour;

/**
 *
 * @author DELL
 */
public class BookingCustomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        AccountDTO acc = (AccountDTO) session.getAttribute("acc");

        response.setContentType("text/html;charset=UTF-8");

        if (acc != null) {
            try {
                TourDao t = new TourDao(DbCon.getConnection());

                List<Tour> tours = t.getAllTours();

                request.getServletContext().setAttribute("myTours", tours);

                request.getRequestDispatcher("buildTour.jsp").forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(BookingCustomServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(BookingCustomServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("Login");

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
        HttpSession session = request.getSession();
        AccountDTO acc = (AccountDTO) session.getAttribute("acc");

        String nameGroup = request.getParameter("nameGroup");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String tourName = request.getParameter("tourName");
        String dateStart = request.getParameter("dateStart");
        String dateEnd = request.getParameter("dateEnd");
        String priceString = request.getParameter("price");
        String quantityAd = request.getParameter("quantityAd");
        String quantityChildren = request.getParameter("quantityChildren");
        String note = request.getParameter("note");

        if (acc != null) {
            try {
                RequestDAO dao = new RequestDAO();
                dao.insertRequest(nameGroup, name, phone, email, tourName, priceString, dateStart, dateEnd, quantityAd, quantityChildren, note, acc.getId());
                RequestCreateTour requestC = new RequestCreateTour();
                
                requestC.setNameGroup(nameGroup);
                requestC.setName(name);
                requestC.setPhone(phone);
                requestC.setEmail(email);
                requestC.setTourName(tourName);
                requestC.setDateStart(dateStart);
                requestC.setDateEnd(dateEnd);
                requestC.setQuantityAd(quantityAd);
                requestC.setQuantityChild(quantityChildren);
                requestC.setPrice(priceString);
                requestC.setNote(note);
                

                EmailRequest.sendConfirmationEmail(email, requestC);

                response.sendRedirect("BookingCustomServlet");
            } catch (MessagingException ex) {
                Logger.getLogger(BookingCustomServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
