/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.BookTour;
import model.Region;
import model.RequestCreateTour;
import model.Tour;

/**
 *
 * @author DELL
 */
public class RequestDAO {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public RequestDAO(Connection con) {
        this.con = con;
    }

    public RequestDAO() {
    }

    public List<RequestCreateTour> getAllRequests() {

        List<RequestCreateTour> requests = new ArrayList<RequestCreateTour>();
        try {

            query = "SELECT * from orderRequest";

            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                RequestCreateTour row = new RequestCreateTour();
                row.setRequestId(rs.getInt("id"));

                row.setName(rs.getString("cusName"));
                row.setNameGroup(rs.getString("groupName"));
                row.setEmail(rs.getString("email"));
                row.setPhone(rs.getString("phone"));
                row.setQuantityAd(rs.getString("quantityAd"));
                row.setQuantityChild(rs.getString("quantityChildren"));
                row.setDateEnd(rs.getString("dateEnd"));
                row.setDateStart(rs.getString("dateStart"));
                row.setQuantityChild(rs.getString("quantityChildren"));
                row.setNote(rs.getString("note"));
                row.setPrice(rs.getString("priceEstimated"));
                row.setTourName(rs.getString("tourName"));
                row.setStatus(rs.getBoolean("status"));

                requests.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return requests;
    }

    public void insertRequest(String nameGroup, String name, String phone, String email, String tourName, String price, String dateStart, String dateEnd, String quantityAd, String quantityChildren, String note, int user_id) {
        query = "INSERT INTO [orderRequest]\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'false')";
        try {
            con = new DbCon().getConnection();
            pst = con.prepareStatement(query);
            pst.setString(1, nameGroup);
            pst.setString(2, name);
            pst.setString(3, phone);
            pst.setString(4, email);
            pst.setString(5, tourName);
            pst.setString(6, price);
            pst.setString(7, dateStart);
            pst.setString(8, dateEnd);
            pst.setString(9, quantityAd);
            pst.setString(10, quantityChildren);
            pst.setString(11, note);
            pst.setInt(12, user_id);

            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public RequestCreateTour getRequestById(String requestId) {
        RequestCreateTour row = null;
        try {
            query = "SELECT * from orderRequest where id = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, requestId);
            rs = pst.executeQuery();
            while (rs.next()) {
                row = new RequestCreateTour();
                row.setRequestId(rs.getInt("id"));

                row.setName(rs.getString("cusName"));
                row.setNameGroup(rs.getString("groupName"));
                row.setEmail(rs.getString("email"));
                row.setPhone(rs.getString("phone"));
                row.setQuantityAd(rs.getString("quantityAd"));
                row.setQuantityChild(rs.getString("quantityChildren"));
                row.setDateEnd(rs.getString("dateEnd"));
                row.setDateStart(rs.getString("dateStart"));
                row.setQuantityChild(rs.getString("quantityChildren"));
                row.setNote(rs.getString("note"));
                row.setPrice(rs.getString("priceEstimated"));
                row.setTourName(rs.getString("tourName"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return row;
    }
}
