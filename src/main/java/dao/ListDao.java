/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.BookTour;
import model.Tour;

/**
 *
 * @author PC
 */
public class ListDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ListDao(Connection con) {
        this.con = con;
    }

    public ListDao() {
    }

    public List<BookTour> getListOrder(int id) {
        List<BookTour> list = new ArrayList<>();
        try {
            query = "select * from bookTour where t_id=? order by bookTour.t_id desc";

            con = new DBContext().getConnection();
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                BookTour order = new BookTour();
                TourDao tourDao = new TourDao(this.con);
                int tId = rs.getInt("t_id");
                Tour tour = tourDao.getSingleTour(tId);

                order.setOrderId(rs.getInt("o_id"));
                order.setTourId(tId);
                order.setTourName(tour.getTourName());
                order.setDateStart(tour.getDateStart());
                order.setPrice(tour.getPrice() * rs.getInt("book_quantityAd"));
                order.setQuantityAd(rs.getInt("book_quantityAd"));
                order.setQuantityChildren(rs.getInt("book_quantityChild"));
                order.setDate(rs.getString("book_date"));
                order.setAddress(rs.getString("book_address"));
                order.setName(rs.getString("book_cusName"));
                order.setNote(rs.getString("note"));
                order.setEmail(rs.getString("book_email"));
                order.setPhone(rs.getString("book_phone"));

                // Calculate and set the total amount
                float adultPrice = order.getPrice();
                float childrenPrice = adultPrice / 2;
                float totalAmount = (adultPrice * order.getQuantityAd()) + (childrenPrice * order.getQuantityChildren());
                order.setTotalAmount(totalAmount);

                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
        public static void main(String[] args) {
        ListDao dao = new ListDao();
        List<BookTour> list = dao.getListOrder(3);   
            for (BookTour o : list) {
                System.out.println(o);
            }
    }
// public List<BookTour> historyOder(){
//        List<BookTour> listS = new ArrayList<>();
//        String  query = "select * from bookTour where u_id=1 order by bookTour.t_id desc" ;
//        try {
//            pst = this.con.prepareStatement(query);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                listS.add(new BookTour(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getInt(7),
//                        rs.getInt(😎,
//                        rs.getString(9),
//                        rs.getString(10),
//                        rs.getFloat(11)));
//            }
//        } catch (SQLException e) {
//        }
//        return listS;
//    }
//  public static void main(String[] args) {
//        ListDao dao = new ListDao();
//         List<BookTour> listS = dao.historyOder();
//            for (BookTour o : listS) {
//                System.out.println(o);
//            }
//    }

}