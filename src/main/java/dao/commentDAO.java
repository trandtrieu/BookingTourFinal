/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

/**
 *
 * @author Lenovo
 */
public class commentDAO {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public commentDAO(Connection con) {
        this.con = con;
    }

    public commentDAO() {
    }
    
      public void insertComment(int blog_id, int user_id, String comment) {
        try {
            String sql = "INSERT INTO Comment (blog_id, u_id, cmt) VALUES (?, ?, ?)";
            this.con = DBContext.getConnection();

            pst = this.con.prepareStatement(sql);
            pst.setInt(1, blog_id);
            pst.setInt(2, user_id);
            pst.setString(3, comment);
            pst.executeUpdate();

        } catch (SQLException e) {
            // Handle the error, for example:
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public List<Comment> getCMTByBlogId(int blog_id) {
        List<Comment> list = new ArrayList<>();
        try {

            String sql = "select ac.username, cmt.cmt\n"
                    + "from Comment cmt\n"
                    + "JOIN account ac ON ac.u_id = cmt.u_id\n"
                    + "where blog_id = ?";

            this.con = DBContext.getConnection();

            pst = this.con.prepareStatement(sql);
            pst.setInt(1, blog_id);
            rs = pst.executeQuery();
            if (rs.next()) {
                int idCmt = rs.getInt("idCmt");
                String name = rs.getString("name");
                String cmt = rs.getString("cmt");
                Comment c = new Comment(idCmt, name, cmt);
                list.add(c);
            }
        } catch (SQLException e) {
            // Xử lý lỗi, ví dụ:
            e.printStackTrace();
        }
        return list;
    }

  
    public static void main(String[] args) {
        commentDAO dao = new commentDAO();
//        List<Comment> list = dao.getCMTByBlogId(1);
//        for (Comment blog : list) {
//            System.out.println("" + blog);
//        }

        int blogId = 2;           // Replace with the actual blog ID
        int userId = 4;           // Replace with the actual user ID
        String comment = "Hello!";  // Replace with the actual comment

        // Call the insertComment method with the provided arguments
        dao.insertComment(blogId, userId, comment);
    }
}
