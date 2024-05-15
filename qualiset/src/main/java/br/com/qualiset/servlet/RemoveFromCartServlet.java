package br.com.qualiset.servlet;

import br.com.qualiset.dao.ProductDao;
import br.com.qualiset.model.Cart;
import br.com.qualiset.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            String productId = req.getParameter("productId");
            Product product = new ProductDao().getProductById(productId);
            if (product != null) {
                cart.removeItem(product);
            }
        }
        resp.sendRedirect("view-cart");
    }
}
