package br.com.qualiset.dao;
import br.com.qualiset.servlet.config.ConnectionPoolConfig;
import br.com.qualiset.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductDao {

    public Product getProductById(String productId) {
        Product product = null;
        String sql = "SELECT * FROM PRODUCT WHERE ID = ?";
        try (Connection conn = ConnectionPoolConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                product = new Product(
                        rs.getString("ID"),
                        rs.getString("NAME"),
                        rs.getDouble("PRICE"),
                        rs.getString("IMAGEM")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public void createProduct(Product product) {

        String SQL = "INSERT INTO PRODUCT (NAME, PRICE, IMAGEM) VALUES (?,?,?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getImagem());
            preparedStatement.execute();

            System.out.println("success in insert Product");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

        }

    }
    public List<Product> findAllProducts() {

        String SQL = "SELECT * FROM PRODUCT";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Product> products = new ArrayList<>();


            while (resultSet.next()) {

                String productId = resultSet.getString("id");
                String productName = resultSet.getString("name");
                double productPrice = resultSet.getDouble("price");
                String image = resultSet.getString("imagem");

                Product product = new Product(productId, productName, productPrice, image);

                products.add(product);

            }

            System.out.println("success in select * product");

            connection.close();

            return products;

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

            return Collections.emptyList();

        }

    }
    public void deleteProductById(String productId) {

        String SQL = "DELETE PRODUCT WHERE ID = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, Integer.parseInt(productId));
            preparedStatement.execute();

            System.out.println("success on delete car with id: " + productId);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

        }

    }
    public void updateProduct(Product product) {

        String SQL = "UPDATE PRODUCT SET NAME = ?, PRICE = ?, IAMGEM WHERE ID = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getId());
            preparedStatement.setString(4, product.getImagem());
            preparedStatement.execute();

            System.out.println("success in update product");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

        }

    }

}