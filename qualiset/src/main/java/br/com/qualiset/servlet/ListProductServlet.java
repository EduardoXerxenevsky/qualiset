package br.com.qualiset.servlet;

import br.com.qualiset.dao.ProductDao;
import br.com.qualiset.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-products")
public class ListProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Product> products = new ProductDao().findAllProducts();

        req.setAttribute("products", products);

        req.getRequestDispatcher("pages/tabela.jsp").forward(req, resp);

    }

}