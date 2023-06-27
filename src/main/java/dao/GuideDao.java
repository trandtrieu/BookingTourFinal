/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DbCon;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import model.GuideTour;
import model.TourSchedule;

/**
 *
 * @author DELL
 */
public class GuideDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public GuideDao(Connection con) {
        this.con = con;
    }

    public GuideDao() {
    }

    public List<GuideTour> getAllGuides() throws ClassNotFoundException {

        List<GuideTour> guides = new ArrayList<GuideTour>();
        try {
            con = new DbCon().getConnection();

            query = "SELECT * from tourGuider";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                GuideTour row = new GuideTour();
                row.setGuideId(rs.getInt("guideId"));
                row.setGuideName(rs.getString("guideName"));
                row.setGuideAge(rs.getInt("guideAge"));
                row.setGuideImage(rs.getString("guideImage"));
                row.setGuideEmail(rs.getString("guideEmail"));
                row.setGuidePhone(rs.getString("guidePhone"));
                row.setGuideAddress(rs.getString("guideAddress"));
                row.setGuideYearExperience(rs.getInt("guideYearExperience"));
                row.setGuideSex(rs.getString("guideSex"));

                guides.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return guides;
    }

    public GuideTour getGuideDetailByID(int id) {

        String query = "SELECT *    "
                + "FROM tourGuider\n"
                + "where guideId = ?";
        try {
            this.con = DbCon.getConnection();

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                return new GuideTour(
                        rs.getInt("guideId"),
                        rs.getString("guideName"),
                        rs.getInt("guideAge"),
                        rs.getString("guideImage"),
                        rs.getString("guideEmail"),
                        rs.getString("guidePhone"),
                        rs.getString("guideDetail"),
                        rs.getString("guideAddress"),
                        rs.getString("guideSex"),
                        rs.getInt("guideYearExperience"));

            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return null;
    }

    public List<TourSchedule> getGuideJob(int u_id) throws ClassNotFoundException {

        List<TourSchedule> guides = new ArrayList<TourSchedule>();
        try {
            query = "SELECT * from tour\n"
                    + " JOIN place ON tour.placeId = place.placeId\n"
                    + "JOIN region ON tour.regionId = region.regionId \n"
                    + "JOIN schedule ON tour.scheduleId = schedule.scheduleId\n"
                    + "JOIN tourGuider ON tour.guideId = tourGuider.guideId\n"
                    + "where tourGuider.u_id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, u_id);

            rs = pst.executeQuery();

            while (rs.next()) {
                TourSchedule tour = new TourSchedule();
                tour.setTourId(rs.getInt("tourId"));
                tour.setTourName(rs.getString("name"));
                tour.setImageTour(rs.getString("image"));
                DecimalFormat decimalFormat = new DecimalFormat("#.#");
                float price = rs.getFloat("price");
                String formattedPrice = decimalFormat.format(price);
                tour.setPrice(Float.parseFloat(formattedPrice));
                tour.setDateStart(rs.getDate("dateStart"));
                tour.setDateEnd(rs.getDate("dateEnd"));
                tour.setDetailTour(rs.getString("detail"));
                tour.setStatusTour(rs.getBoolean("status"));
                tour.setPlaceName(rs.getString("placeName"));
                tour.setRegionName(rs.getString("regionName"));
                tour.setSeat(rs.getInt("seat"));

                // Tính toán lịch trình từ dateStart đến dateEnd
                Date startDate = rs.getDate("dateStart");
                Date endDate = rs.getDate("dateEnd");
                tour.setGuideId(rs.getInt("guideId"));

                tour.setPlaceId(rs.getInt("placeId"));
                tour.setRegionId(rs.getInt("regionId"));
                tour.setGuideName(rs.getString("guideName"));
                int numberOfDays = calculateNumberOfDays(startDate, endDate);

                // Thiết lập lịch trình và số ngày chuyến đi
                tour.setNumberDay(numberOfDays);

                guides.add(tour);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return guides;
    }

    private int calculateNumberOfDays(Date startDate, Date endDate) {
        long timeDifference = endDate.getTime() - startDate.getTime();
        return (int) TimeUnit.DAYS.convert(timeDifference, TimeUnit.MILLISECONDS);
    }
}
