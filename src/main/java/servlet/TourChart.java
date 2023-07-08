/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.ChartDAO;
import dao.ViewDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AmountByMonth;
import model.AmountByRegion;
import model.CustomerByMonth;

/**
 *
 * @author DELL
 */
public class TourChart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            ChartDAO chartDAO = new ChartDAO(DbCon.getConnection());
            ViewDao viewDao = new ViewDao(DbCon.getConnection());

            HttpSession session = request.getSession();
            if (session.isNew()) {
                viewDao.updateView();
            }

            // Lấy danh sách khách hàng theo tháng
            List<CustomerByMonth> customersByMonth = chartDAO.getCustomersByMonth();
            List<AmountByMonth> amountsByMonth = chartDAO.getAmountsByMonth();
            List<AmountByRegion> amountsByRegion1 = chartDAO.getAmountsByRegion(1);
            List<AmountByRegion> amountsByRegion2 = chartDAO.getAmountsByRegion(2);
            List<AmountByRegion> amountsByRegion3 = chartDAO.getAmountsByRegion(3);
           

            int totalCus = chartDAO.getTotalAdults();
            int totalChilrens = chartDAO.getTotalChildrens();
            int view = viewDao.getView();
            String formartted = String.format("%05d", view);

            request.setAttribute("view", formartted);

            request.setAttribute("customersByMonth", customersByMonth);
            request.setAttribute("amountsByMonth", amountsByMonth);
            request.setAttribute("amountsByRegion1", amountsByRegion1);
            request.setAttribute("amountsByRegion2", amountsByRegion2);
            request.setAttribute("amountsByRegion3", amountsByRegion3);

            request.setAttribute("totalCus", totalCus);
            request.setAttribute("totalChilrens", totalChilrens);

            request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TourChart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TourChart.class.getName()).log(Level.SEVERE, null, ex);
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
