package br.com.qualiset.servlet;

import br.com.qualiset.dao.ProductDao;
import br.com.qualiset.model.Product;
import br.com.qualiset.config.ConnectionPoolConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/create-products")
public class CreateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String productId =req.getParameter("id");
        String productName = req.getParameter("product-name");
        double productPrice = Double.parseDouble(req.getParameter("product-price"));

        ProductDao productDao = new ProductDao();
        Product product = new Product(productId,productName,productPrice);

        if (productId.isBlank()) {

            productDao.createProduct(product);

        } else {

            productDao.updateProduct(product);

        }

        resp.sendRedirect("/find-all-products");

    }


}