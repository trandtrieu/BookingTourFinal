package servlet;

import connection.DbCon;
import dao.FeedbackDao;
import dao.PlaceDao;
import dao.TourDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Region;
import dao.RegionDao;
import dao.ViewDao;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.AccountDTO;
import model.Place;
import model.Tour;

public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDTO acc = (AccountDTO) request.getSession().getAttribute("acc");

        try {
            TourDao t = new TourDao(DbCon.getConnection());
            RegionDao r = new RegionDao(DbCon.getConnection());
            PlaceDao p = new PlaceDao(DbCon.getConnection());
            FeedbackDao feedbackDao = new FeedbackDao();
            List<Tour> tours = t.getAllTours();
            List<Region> regions = r.getAllRegions();
            List<Place> places = p.getAllPlaces();

            for (Tour tour : tours) {
                int tourId = tour.getTourId();
                int averageStar = feedbackDao.getAVGStar(tourId);
                tour.setAverageStar(averageStar);
            }
            int tourCount = t.getAllToursCount();
           
            request.getServletContext().setAttribute("myRegions", regions);
            request.getServletContext().setAttribute("myPlaces", places);

            request.setAttribute("tourCount", tourCount);

            List<Tour> filteredTours = new ArrayList<>();
            for (Tour tour : tours) {
                if (tour.getStatusTour() != true) {
                    filteredTours.add(tour);
                }
            }

            request.setAttribute("myTours", filteredTours);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
