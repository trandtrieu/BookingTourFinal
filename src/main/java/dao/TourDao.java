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
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Tour;
import model.TourSchedule;
import java.text.DecimalFormat;

/**
 *
 * @author DELL
 */
public class TourDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public TourDao(Connection con) {
        this.con = con;
    }

    public TourDao() {
    }

    public List<Tour> getAllTours() throws ClassNotFoundException {
        List<Tour> tours = new ArrayList<>();
        query = "SELECT *\n"
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId\n"
                + "JOIN region ON tour.regionId = region.regionId\n"
                + "JOIN tourGuider ON tour.guideId = tourGuider.guideId";
        try {
            con = new DbCon().getConnection();
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Tour tour = extractTourFromResultSet(rs);
                tours.add(tour);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return tours;
    }

    private TourSchedule extractTourFromResultSet(ResultSet rs) throws SQLException {
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

        return tour;
    }

    private int calculateNumberOfDays(Date startDate, Date endDate) {
        long timeDifference = endDate.getTime() - startDate.getTime();
        return (int) TimeUnit.DAYS.convert(timeDifference, TimeUnit.MILLISECONDS);
    }

    public int getAllToursCount() {
        int count = 0;
        try {
            query = "SELECT COUNT(*) AS count FROM tour";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return count;
    }

    public List<Tour> getTop4() {
        List<Tour> list = new ArrayList<>();
        String query = "select top 4 * from tour";
        try {
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Tour(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getInt(10)));

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Tour> getToursByRegionName(String regionName) {
        String query = "SELECT *, place.placeName "
                + "FROM tour "
                + "JOIN place ON tour.placeId = place.placeId "
                + "JOIN region ON tour.regionId = region.regionId "
                + "JOIN schedule ON tour.scheduleId = schedule.scheduleId "
                + "WHERE regionName LIKE ?";

        return getToursByQuery(query, regionName);
    }

    public List<Tour> getToursByName(String tourName) {
        String query = "SELECT *, place.placeName "
                + "FROM tour "
                + "JOIN place ON tour.placeId = place.placeId "
                + "JOIN region ON tour.regionId = region.regionId "
                + "JOIN schedule ON tour.scheduleId = schedule.scheduleId "
                + "WHERE name LIKE ?";

        return getToursByQuery(query, tourName);
    }

    private List<Tour> getToursByQuery(String query, String searchStr) {
        List<Tour> list = new ArrayList<>();
        try {
            this.con = DbCon.getConnection();
            pst = this.con.prepareStatement(query);
            pst.setString(1, "%" + searchStr + "%");
            rs = pst.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet và thêm vào list
                // ...
                Tour row = new Tour();
                row.setTourId(rs.getInt("tourId"));
                row.setTourName(rs.getString("name"));
                row.setImageTour(rs.getString("image"));
                row.setPrice(rs.getFloat("price"));
                row.setDateStart(rs.getDate("dateStart"));
                row.setDateEnd(rs.getDate("dateEnd"));
                row.setDetailTour(rs.getString("detail"));
                row.setStatusTour(rs.getBoolean("status"));
                row.setPlaceName(rs.getString("placeName"));
                row.setRegionName(rs.getString("regionName"));
                row.setSeat(rs.getInt("seat"));

                list.add(row);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TourDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TourDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Tour> searchTours(String placeId, String dateStart, Float price) {
        List<Tour> searchResults = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            query = "SELECT * FROM tour\n"
                    + "JOIN place ON tour.placeId = place.placeId "
                    + "JOIN region ON tour.regionId = region.regionId\n"
                    + "WHERE place.placeId = ?  AND tour.dateStart >= ? AND tour.price >= ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, placeId);
            pst.setString(2, dateStart);
            pst.setFloat(3, price);
            rs = pst.executeQuery();

            // Process the query result
            while (rs.next()) {
                Tour row = new Tour();

                row.setTourId(rs.getInt("tourId"));
                row.setStatusTour(rs.getBoolean("status"));
                row.setTourName(rs.getString("name"));
                row.setImageTour(rs.getString("image"));
                row.setPrice(rs.getFloat("price"));
                row.setDateStart(rs.getDate("dateStart"));
                row.setDateEnd(rs.getDate("dateEnd"));
                Date startDate = rs.getDate("dateStart");
                Date endDate = rs.getDate("dateEnd");
                row.setDetailTour(rs.getString("detail"));
                row.setPlaceName(rs.getString("placeName"));
                row.setRegionName(rs.getString("regionName"));
                row.setSeat(rs.getInt("seat"));
                int numberOfDays = calculateNumberOfDays(startDate, endDate);

                // Thiết lập lịch trình và số ngày chuyến đi
                row.setNumberDay(numberOfDays);
                searchResults.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the PreparedStatement and ResultSet
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return searchResults;
    }

    public List<Tour> getToursFromRegion(int id) {
        List<Tour> tours = new ArrayList<>();

        String query = "SELECT *\n"
                + "FROM region\n"
                + "JOIN tour ON tour.regionId = region.regionId \n"
                + "JOIN place ON tour.placeId = place.placeId\n"
                + "JOIN tourGuider ON tour.guideId = tourGuider.guideId\n"
                + "\n"
                + "where region.regionId = ?";
        try {
            this.con = DbCon.getConnection();

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Tour tour = new Tour(
                        rs.getInt("tourId"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getDate("dateStart"),
                        rs.getDate("dateEnd"),
                        rs.getString("detail"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getString("placeName"),
                        rs.getString("regionName"),
                        rs.getInt("guideId"),
                        rs.getString("guideName"),
                        rs.getInt("seat"));
                tours.add(tour);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Xử lý lỗi
        }
        return tours;
    }

    public Tour getSingleTour(int id) {
        Tour row = null;
        try {
            query = "select * from tour where tourId=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Tour();
                row.setTourId(rs.getInt("tourId"));
                row.setTourName(rs.getString("name"));
                row.setDateStart(rs.getDate("dateStart"));
                row.setDateEnd(rs.getDate("dateEnd"));
                row.setImageTour(rs.getString("image"));
//                row.setGuideName(rs.getString("guideName"));
                row.setPrice(rs.getFloat("price"));
                row.setSeat(rs.getInt("seat"));

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public void updateTour(Tour tour) {
        try {
            query = "UPDATE tour SET seat = ? WHERE tourId = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, tour.getSeat());
            pst.setInt(2, tour.getTourId());
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertTour(String tourName, String price, String dateStart, String dateEnd, String detailTour, String imageTour, String statusTour, String guideId, String placeId, String regionId) {
        query = "insert into tour\n"
                + "values(?, ?,?, ?, ?, ?, ?, ?,? ,'1', ?, '30')";
        try {
            con = new DbCon().getConnection();
            pst = con.prepareStatement(query);
            pst.setString(1, tourName);
            pst.setString(2, price);
            pst.setString(3, dateStart);
            pst.setString(4, dateEnd);
            pst.setString(5, detailTour);
            pst.setString(6, imageTour);
            pst.setString(7, statusTour);
            pst.setString(8, placeId);
            pst.setString(9, guideId);
            pst.setString(10, regionId);
//            pst.setString(8, placeName);
//            pst.setString(9, regionName);

            //pst.setString(11, guideName);
            pst.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Tour getTourByIdd(String tourId) {
        query = "SELECT *    "
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId \n"
                + "JOIN region ON tour.regionId = region.regionId\n"
                + "JOIN schedule ON tour.scheduleId = schedule.scheduleId\n"
                + "JOIN tourGuider ON tour.guideId = tourGuider.guideId\n"
                + "where tourId = ?";
        try {
            con = new DbCon().getConnection();
            pst = con.prepareStatement(query);
            pst.setString(1, tourId);
            rs = pst.executeQuery();
            while (rs.next()) {
                return new TourSchedule(
                        rs.getInt("scheduleId"),
                        rs.getString("day1"),
                        rs.getString("day2"),
                        rs.getString("day3"),
                        rs.getString("day4"),
                        rs.getString("day5"),
                        rs.getString("day6"),
                        rs.getString("day7"),
                        rs.getInt("tourId"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getDate("dateStart"),
                        rs.getDate("dateEnd"),
                        rs.getString("detail"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getString("placeName"),
                        rs.getString("regionName"),
                        rs.getString("guideName"),
                        rs.getInt("guideId"),
                        rs.getInt("placeId"),
                        rs.getInt("regionId"),
                        rs.getInt("seat"));

            }
        } catch (Exception e) {
        }

        return null;
    }

    public Tour getTourByID(int id) {

        String query = "SELECT *    "
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId \n"
                + "JOIN region ON tour.regionId = region.regionId\n"
                + "JOIN schedule ON tour.scheduleId = schedule.scheduleId\n"
                + "JOIN tourGuider ON tour.guideId = tourGuider.guideId\n"
                + "where tourId = ?";
        try {
            this.con = DbCon.getConnection();

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                return new TourSchedule(
                        rs.getInt("scheduleId"),
                        rs.getString("day1"),
                        rs.getString("day2"),
                        rs.getString("day3"),
                        rs.getString("day4"),
                        rs.getString("day5"),
                        rs.getString("day6"),
                        rs.getString("day7"),
                        rs.getInt("tourId"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getDate("dateStart"),
                        rs.getDate("dateEnd"),
                        rs.getString("detail"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getString("placeName"),
                        rs.getString("regionName"),
                        rs.getInt("guideId"),
                        rs.getString("guideName"),
                        rs.getInt("seat"));

            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return null;
    }

    public void updateTour(String tourId, String tourName, String price, String dateStart, String dateEnd,
            String detailTour, String imageTour, String statusTour, String placeId, String regionId, String guideId) {
        query = "update tour\n"
                + "set name = ?,\n"
                + "price = ?,\n"
                + "dateStart = ?,\n"
                + "dateEnd = ?,\n"
                + "detail = ?,\n"
                + "image = ?,\n"
                + "status= ?,\n"
                + "placeId = ?,\n"
                + "guideId = ?,\n"
                + "scheduleId = '1',\n"
                + "regionId = ?,\n"
                + "seat = '30'\n"
                + "where tourId = ?";
        try {
            con = new DbCon().getConnection();
            pst = con.prepareStatement(query);
            pst.setString(1, tourName);
            pst.setString(2, price);
            pst.setString(3, dateStart);
            pst.setString(4, dateEnd);
            pst.setString(5, detailTour);
            pst.setString(6, imageTour);
            pst.setString(7, statusTour);
            pst.setString(8, placeId);
            pst.setString(9, guideId);
            pst.setString(10, regionId);
            pst.setString(11, tourId);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // In thông báo lỗi ra màn hình
            // Hoặc ghi log lỗi vào một tệp log
        }

    }

    public void deleteTour(String tourId) {
        query = "delete from tour \n"
                + "where tourId = ?";
        try {
            con = new DbCon().getConnection();
            pst = con.prepareStatement(query);
            pst.setString(1, tourId);
            pst.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    
}
