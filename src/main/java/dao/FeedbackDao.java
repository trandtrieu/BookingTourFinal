package dao;

import connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

public class FeedbackDao {

    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public List<Feedback> getAllFeedbackByProductId(int id) throws ClassNotFoundException {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedbackTour WHERE tourId = ?";
        try {
            con = DbCon.getConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("feedback_id"));
                f.setUsername(rs.getString("username"));
                f.setRated_star(rs.getInt("rated_star"));
                f.setFeedback(rs.getString("feedback"));
                f.setTourId(rs.getInt("tourId"));
                f.setU_id(rs.getInt("u_id"));
                f.setDate(rs.getDate("date"));
                f.setAvatar(rs.getString("avatar"));

                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getTotalFeedback(int id) throws ClassNotFoundException {
        String sql = "SELECT COUNT(feedback_id) FROM feedbackTour WHERE tourId = ?";
        try {
            con = DbCon.getConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

  
    public void addNewFeedback(String username, int star, String subject, int tourId, int u_id, String avatar) throws ClassNotFoundException {
    try {
        String sql = "INSERT INTO [dbo].[feedbackTour] ([username], [rated_star], [feedback], [tourId], [u_id], [avatar]) VALUES (?, ?, ?, ?, ?, ?)";
        con = DbCon.getConnection();
        st = con.prepareStatement(sql);
        st.setString(1, username);
        st.setInt(2, star);
        st.setString(3, subject);
        st.setInt(4, tourId);
        st.setInt(5, u_id);
        st.setString(6, avatar);
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


//    private void closeResources() {
//        try {
//            if (rs != null) {
//                rs.close();
//            }
//            if (st != null) {
//                st.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
}
