package br.com.qualiset.dao;
import br.com.qualiset.servlet.config.ConnectionPoolConfig;
import br.com.qualiset.model.Feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class FeedbackDAO {
    private Connection connection;

    public FeedbackDAO() {
        try {
            // Conectando ao H2 Database
            Class.forName("org.h2.Driver");
            this.connection = ConnectionPoolConfig.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addFeedback(Feedback feedback) {
        try {
            String sql = "INSERT INTO FEEDBACK (ID, PRODUCT_ID, USER_ID, COMMENT, RATING) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, UUID.randomUUID().toString()); // Gera um UUID para o ID
            stmt.setString(2, feedback.getProductId());
            stmt.setString(3, feedback.getUserId());
            stmt.setString(4, feedback.getComment());
            stmt.setInt(5, feedback.getRating());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getFeedbackByProduct(String productId) {
        List<Feedback> feedbackList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM FEEDBACK WHERE PRODUCT_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, productId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getString("ID"));
                feedback.setProductId(rs.getString("PRODUCT_ID"));
                feedback.setUserId(rs.getString("USER_ID"));
                feedback.setComment(rs.getString("COMMENT"));
                feedback.setRating(rs.getInt("RATING"));
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public List<Feedback> getFeedbackByUser(String userId) {
        List<Feedback> feedbackList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM FEEDBACK WHERE USER_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getString("ID"));
                feedback.setProductId(rs.getString("PRODUCT_ID"));
                feedback.setUserId(rs.getString("USER_ID"));
                feedback.setComment(rs.getString("COMMENT"));
                feedback.setRating(rs.getInt("RATING"));
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
}
