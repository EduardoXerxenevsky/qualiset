package br.com.qualiset.servlet;

import br.com.qualiset.dao.ProductDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-products")
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String productId = req.getParameter("id");

        new ProductDao().deleteProductById(productId);

        resp.sendRedirect("/create-products");

    }

}