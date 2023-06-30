/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AmountByMonth;
import model.CustomerByMonth;

/**
 *
 * @author DELL
 */
public class ChartDAO {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ChartDAO(Connection con) {
        this.con = con;
    }

    public ChartDAO() {
    }

    public int getTotalCustomers() throws SQLException {
        int totalCustomers = 0;

        query = "SELECT SUM(book_quantityAd + book_quantityChild) AS totalCustomers FROM bookTour";

        pst = this.con.prepareStatement(query);
        rs = pst.executeQuery();
        if (rs.next()) {
            totalCustomers = rs.getInt("totalCustomers");
        }

        return totalCustomers;
    }

    public List<CustomerByMonth> getCustomersByMonth() throws SQLException {
        List<CustomerByMonth> customersByMonth = new ArrayList<>();

        query = "SELECT CONVERT(varchar(7), book_date, 126) AS month, SUM(book_quantityAd + book_quantityChild) AS totalCustomers\n"
                + "FROM bookTour\n"
                + "GROUP BY CONVERT(varchar(7), book_date, 126)";

        try ( PreparedStatement statement = con.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                String month = resultSet.getString("month");
                int totalCustomers = resultSet.getInt("totalCustomers");
                CustomerByMonth customerByMonth = new CustomerByMonth(month, totalCustomers);
                customersByMonth.add(customerByMonth);
            }
        }

        return customersByMonth;
    }

    public List<AmountByMonth> getAmountsByMonth() throws SQLException {
        List<AmountByMonth> amountsByMonth = new ArrayList<>();

        query = " SELECT CONVERT(varchar(7), book_date, 126) AS month, SUM(total_amount) AS totalAmounts\n"
                + "FROM bookTour\n"
                + "GROUP BY CONVERT(varchar(7), book_date, 126)";

        try ( PreparedStatement statement = con.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                String month = resultSet.getString("month");
                float totalAmounts = resultSet.getFloat("totalAmounts");
                AmountByMonth amountByMonth = new AmountByMonth(month, totalAmounts);

                amountsByMonth.add(amountByMonth);
            }
        }

        return amountsByMonth;
    }

    public int getTotalAdults() throws SQLException {
        int totalAdults = 0;

        query = "SELECT SUM(book_quantityAd) AS totalAdults\n"
                + "FROM bookTour";

        pst = this.con.prepareStatement(query);
        rs = pst.executeQuery();
        if (rs.next()) {
            totalAdults = rs.getInt("totalAdults");
        }

        return totalAdults;
    }

    public int getTotalChildrens() throws SQLException {
        int totalChildrens = 0;

        query = "select SUM(book_quantityChild) AS totalChildrens\n"
                + "FROM bookTour";

        pst = this.con.prepareStatement(query);
        rs = pst.executeQuery();
        if (rs.next()) {
            totalChildrens = rs.getInt("totalChildrens");
        }

        return totalChildrens;
    }
}