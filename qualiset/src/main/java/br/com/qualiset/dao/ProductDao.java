package br.com.qualiset.dao;
import br.com.qualiset.config.ConnectionPoolConfig;
import br.com.qualiset.model.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductDao {

    public void createProduct(Product product) {

        String SQL = "INSERT INTO PRODUCT (NAME, PRICE) VALUES (?,?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.execute();

            System.out.println("success in insert Product");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

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

                Product product = new Product(productId, productName, productPrice);

                products.add(product);

            }

            System.out.println("success in select * product");

            connection.close();

            return products;

        } catch (Exception e) {

            System.out.println("fail in database connection");

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

        }

    }
    public void updateProduct(Product product) {

        String SQL = "UPDATE PRODUCT SET NAME = ?, PRICE = ? WHERE ID = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, product.getName()); // Substitua novoNome pelo novo nome do produto
            preparedStatement.setDouble(2, product.getPrice()); // Substitua novoPreco pelo novo preço do produto
            preparedStatement.setString(3, product.getId());
            preparedStatement.execute();

            System.out.println("success in update product");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

        }

    }

}