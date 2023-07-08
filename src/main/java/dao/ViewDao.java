/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class ViewDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ViewDao(Connection con) {
        this.con = con;
    }

    public ViewDao() {
    }

    public int getView() {
        int count = 0;
        try {
            query = "select * from [view]";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            if (rs.next()) {
                count = rs.getInt("viewed");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return count;
    }
      public void updateView() {
        int count = 0;
        try {
            query = "  update [view] set viewed = viewed + 1";
            pst = this.con.prepareStatement(query);
            pst.executeUpdate();

            if (rs.next()) {
                count = rs.getInt("viewed");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

}
