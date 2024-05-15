package br.com.qualiset.dao;

import br.com.qualiset.model.Affiliate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AffiliateDao {
    private static final String JDBC_URL = "jdbc:h2:~/test";
    private static final String JDBC_USER = "sa";
    private static final String JDBC_PASSWORD = "sa";

    public void createAffiliate(Affiliate affiliate) throws SQLException {
        String sql = "INSERT INTO AFILIADO (NAME, EMAIL, PHONE, FOLLOWERS, COUPON, DISCOUNT) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, affiliate.getName());
            stmt.setString(2, affiliate.getEmail());
            stmt.setString(3, affiliate.getPhone());
            stmt.setInt(4, affiliate.getFollowers());
            stmt.setString(5, affiliate.getCoupon());
            stmt.setDouble(6, affiliate.getDiscount());
            stmt.executeUpdate();
        }
    }

    public Affiliate getAffiliateByCoupon(String coupon) throws SQLException {
        String sql = "SELECT * FROM AFILIADO WHERE COUPON = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, coupon);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Affiliate(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("EMAIL"),
                        rs.getString("PHONE"),
                        rs.getInt("FOLLOWERS"),
                        rs.getString("COUPON"),
                        rs.getDouble("DISCOUNT")
                );
            }
        }
        return null;
    }
}
